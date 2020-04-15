"""
linear_actuator.py
"""

import csv
import RPi.GPIO as GPIO
import logging
import math
import sys
import threading
import time

import os.path
from logging.handlers import RotatingFileHandler

import i2c
from simple_pid import PID

import config

def calibrate_both(linear_actuator_l, linear_actuator_r):
    """
    Prompts for a confirmation that full calibration is safe, or for  or should be skipped,
    then calibrates the left and right actuators by fully retracting them and then
    extending them to their neutral length (corresponding to an arm angle of 0).
    Returns when both calibrations have completed.
    """
    
    logging.info("Verify that the actuators are disconnected from the arms and positioned upright.")
    logging.info("May instead used backed up length to allow no full retraction.")
    logging.info("May be skipped if actuators are already calibrated.")
    response = ""
    while not response in ["ok", "backup", "skip"]:
        response = input("Begin calibration? ['ok', 'backup', 'skip']").lower()
            
    if response == "ok":
        threading.Thread(target=linear_actuator_l.calibrate).start()
        threading.Thread(target=linear_actuator_r.calibrate).start()
        #linear_actuator_r.calibrated = True
        while not (linear_actuator_l.calibrated and linear_actuator_r.calibrated):  # Wait until both actuators are at their neutral length
            time.sleep(0.1)
    elif response == "backup":
        linear_actuator_l.calibrate(backup=True)
        linear_actuator_r.calibrate(backup=True)
    elif response == "skip":
        linear_actuator_l.calibrate(skip=True)
        linear_actuator_r.calibrate(skip=True)


class Linear_Actuator():    
    def __init__(self, side, debug=False):
        self.side = side  # 'R' or 'L' based on side
        self.debug = debug
        
        # Set up geometry for length/arm angle conversions. See diagram at TODO
        if side == 'L':
            self.L = config.LA_L_FULLY_RETRACTED_LENGTH
            self.h = config.LA_L_UPPER_HORIZONTAL_DISTANCE
            self.H = config.LA_L_INNER_HYPOTENUSE_DISTANCE
            self.w = config.LA_L_LOWER_HORIZONTAL_DISTANCE
            self.W = config.LA_L_LOWER_HYPOTENUSE_DISTANCE
        elif side == 'R':
            self.L = config.LA_R_FULLY_RETRACTED_LENGTH
            self.h = config.LA_R_UPPER_HORIZONTAL_DISTANCE
            self.H = config.LA_R_INNER_HYPOTENUSE_DISTANCE
            self.w = config.LA_R_LOWER_HORIZONTAL_DISTANCE
            self.W = config.LA_R_LOWER_HYPOTENUSE_DISTANCE
        self.lower_constant_angle = math.acos(self.w / self.W)
        self.upper_constant_angle = math.asin(self.h / self.H)
        self.variable_angle_at_neutral = math.pi / 2 - self.lower_constant_angle - self.upper_constant_angle
        self.neutral_length = self._calculate_length_from_arm_angle(0)  # Length of actuator when at neutral
        
        # Set up I/O pins
        if self.side == 'L':         
            self.extend_pin = config.I2C_OUT_LA_L_EXTEND
            self.retract_pin = config.I2C_OUT_LA_L_RETRACT
            self.enable_pin = config.I2C_OUT_LA_L_ENABLE
            self.HE_pin = config.GPIO_IN_LA_L_HE
        elif self.side == 'R':
            self.extend_pin = config.I2C_OUT_LA_R_EXTEND
            self.retract_pin = config.I2C_OUT_LA_R_RETRACT
            self.enable_pin = config.I2C_OUT_LA_R_ENABLE
            self.HE_pin = config.GPIO_IN_LA_R_HE
        i2c.pinMode(self.extend_pin, 1)  # Set up as output
        i2c.pinMode(self.retract_pin, 1)  # Set up as output
        i2c.pinMode(self.enable_pin, 1)  # Set up as output
        GPIO.setup(self.HE_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)  # Set up as pulled-up input
    
    
    def initiate(self):
        """
        Set up changeable variables
        Set up debug logging
        Set up length recording
        Set up input interrupt and control thread
        """
        
        self.calibrated = False  # Turns true when calibration is completed or skipped
        self.aborted = False  # If true, stops 
        self.length = 0  # [m] Current variable length of linear actuator. Changed by _handle_input_pulse()
        self.arm_angle = 0  # [rad] Current arm angle (0=neutral) corresponding to current length
        self.target_length = 0  # [m]
        self.target_velocity = 0  # [m/s] (+ for extend, - for retract)
        self.target_velocity_correction_total = 0  # [m/s]
        self.target_arm_angle = 0  # [rad]
        self.target_arm_angle_correction_total = 0  # [rad]
        self.actual_distance_since_target_velocity_changed = 0  # [m]
        self.last_movement_direction = 0
        self.direction = 0
        
        if self.debug:
            self.log_file = open('logs/LA-{}_log.csv'.format(self.side), 'w', newline='')
            self.csv_writer = csv.writer(self.log_file, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            self.time_log_started = time.time()
            
        feedback_thread = threading.Thread(target=self._feedback_thread)
        feedback_thread.daemon = True
        feedback_thread.start()
        #bouncetime = 1  # [ms]
        #GPIO.add_event_detect(self.HE_pin, GPIO.RISING, self._handle_input_pulse, bouncetime=bouncetime)
        control_thread = threading.Thread(target=self._control_thread)
        control_thread.daemon = True
        control_thread.start()
    
    
    def _feedback_thread(self):
        state = False
        n = 0
        while True:
            if GPIO.input(self.HE_pin):
                n += 1
                if state == False and n == 3:
                    state = True
                    self._handle_input_pulse(self.HE_pin)
            else:
                n = 0
                state = False
            time.sleep(0.001)
    
    
    def calibrate(self, skip=False, backup=False):
        """
        If skipping calibration, current length will be assumed to be neutral length.
        If calibrating from a backup, the last recorded length will be assumed as accurate, and length will be set to neutral from there.
        Else, calibrates the left and right actuators by fully retracting them and then
            extending them to their neutral length (corresponding to an arm angle of 0).
        
        Blocking: Returns when calibration has completed.
        """
        
        if skip:
            self.length = self.neutral_length
            self.arm_angle = self._calculate_arm_angle_from_length(self.length)
            
            logging.info("Calibration skipped.")
        elif backup:
            logging.info("Please wait for each actuator to reach its neutral length")
            length_backup_file = open('LA-{}_length_backup.txt'.format(self.side), 'r')
            backup_data = length_backup_file.read()
            length_backup_file.close()
            if backup_data:
                self.length = float(backup_data)
                self.set_length(self.neutral_length, config.LA_MAX_SPEED)
            else:
                self._print("Cannot calibrate from backup; no backup.", warning=True)
                return False
        else:
            logging.info("Please wait for each actuator to reach its neutral length")
            
            self.pulse_time = time.time()
            self.set_length(-999, config.LA_MAX_SPEED)
            while time.time() - self.pulse_time < 2:
                time.sleep(0.001)
            self.length = 0
            
            self.set_length(self.neutral_length, config.LA_MAX_SPEED)
            self._print("Extending to neutral length...")
            while self.length < self.neutral_length:
                time.sleep(0.001)
            self._stop()
            
            self._print("Calibration complete.")
        
        self.calibrated = True
    
    
    def set_arm_angle(self, target_arm_angle, correction=False):  # [rad]
        """
        Set the target arm angle by first calculating its corresponding length, then setting that length.
        If correcting (from wheel.py), remember the original target arm angle and tack the correction onto it.
        """
        
        if not correction:
            self.target_arm_angle = target_arm_angle
            self.target_arm_angle_correction_total = 0
            self.target_velocity_correction_total = 0
        
        target_length = self._calculate_length_from_arm_angle(target_arm_angle)
        self.set_length(target_length)
    
    
    def set_length(self, target_length, target_speed=config.LA_DEFAULT_SPEED): # [m, m/s]
        """
        Set the target length and duty cycle of the linear actuator
        _control_thread() will change its behavior when self.target_velocity changes
        _handle_input_pulse() will know whether to add or subtract length based on self.target_velocity sign
            and know to stop movement when target_length is reached
        target_velocity > 0: extend
        target_velocity < 0: retract
        target_velocity = 0: stop
        """
        
        if self.aborted: return
        
        self.target_length = self._round_length_to_step(target_length)
        if target_length > self.length:
            self.target_velocity = target_speed
        elif target_length < self.length:
            self.target_velocity = -target_speed
        elif target_length == self.length:
            self.target_velocity = 0
        
        self._print("Setting length to {:.8f}m at {:.8f}m/s".format(self.target_length, self.target_velocity))
    
    
    def add_target_arm_angle_correction(self, target_arm_angle_correction):  # [rad]
        """
        Used when actuator is moving 
        Add correction to arm angle to compensate for improper wheel velocity.
        """
        
        if self.aborted: return
        
        self.target_arm_angle_correction_total += target_arm_angle_correction
        self.set_arm_angle(self.target_arm_angle + self.target_arm_angle_correction_total, correction=True)
        
        # TODO check if correction is too big and abort/stop/don't correct if so
    
    
    def add_target_velocity_correction(self, target_velocity_correction):  # [m/s]
        """
        Used when actuator is not moving
        Add correction to linear actuator velocity to compensate for improper wheel velocity.
        """
        
        if self.aborted: return
        
        self.target_velocity_correction_total += target_velocity_correction
        
        # TODO check if correction is too big and abort/stop/don't correct if so
    
    
    def abort(self, reason=""):
        """
        Send length back to neutral and disable ability for new lengths to be targeted.
        """
        
        self._print("Aborting: " + reason, warning=True)
        self.set_arm_angle(0)
        self.aborted = True
    
    
    def _handle_input_pulse(self, pin):
        """
        Called when rising edge is detected on hall effect sensor, indicating a change in length of config.LA_STEP
        Requires 3 consecutive highs to count as a rising edge.
        If calibrated, backs up current length and stops movement if target length is reached.
        Stops movement if target length is reached and is calibrated.
        Aborts if calibrated and leaving allowable boundaries.
        """
        self.pulse_time = time.time()
        
        self.last_movement_direction
        if self.target_velocity > 0:
            movement_direction = 1
        elif self.target_velocity < 0:
            movement_direction = -1
        else:
            movement_direction = self.last_movement_direction
        self.last_movement_direction = movement_direction
        
        movement_direction = self.direction
        
        self.actual_distance_since_target_velocity_changed += movement_direction * config.LA_STEP
        self.length = self._round_length_to_step(self.length + movement_direction * config.LA_STEP)
        
        if self.debug:
            #logging.info("length: {:.8f}".format(self.length))
            self.csv_writer.writerow([time.time() - self.time_log_started, 1, self.length, self.target_velocity, movement_direction])
            self.log_file.flush()
        
        if not self.calibrated: return
        self.arm_angle = self._calculate_arm_angle_from_length(self.length)
        
        length_backup_file = open('LA-{}_length_backup.txt'.format(self.side), 'w')
        length_backup_file.write(str(self.length))
        length_backup_file.close()
        
        
        max = config.LA_MAX_ALLOWABLE_LENGTH
        min = config.LA_MIN_ALLOWABLE_LENGTH
        if (self.length >= max and self.target_velocity >= 0) or (self.length <= min and self.target_velocity <= 0):
            self.abort("length out of range")
        
        if self.target_length is not None:  # Currently moving toward a target
            if (self.target_length >= max) or (self.target_length <= min):
                self.abort("target out of range")
                return
            if (self.length >= self.target_length and self.target_velocity > 0 or self.length <= self.target_length and self.target_velocity < 0):
                self._stop()  # Stop actuator movement since it has reached its target length
    
    
    def _control_thread(self):
        """
        Calculates ideal distance moved since target velocity changed
        Uses pulse width modulation to match ideal distance moved
        """
        pid = PID(10000, 0, 100, setpoint=0)
        pid.output_limits = (-1, 1) 
        frequency = config.LA_CONTROL_FREQUENCY  # [Hz]
        period = 1 / frequency
        time_target_velocity_changed = time.time()
        target_velocity = self.target_velocity
        duty_cycle = self._calculate_duty_cycle_from_speed(abs(target_velocity))
        enabled = False
        self.direction = 0
        while True:
            if target_velocity != self.target_velocity + self.target_velocity_correction_total:
                target_velocity = self.target_velocity + self.target_velocity_correction_total
                duty_cycle = self._calculate_duty_cycle_from_speed(abs(target_velocity))
                self.actual_distance_since_target_velocity_changed = 0
                time_target_velocity_changed = time.time()
            
            pid.setpoint = target_velocity
            actual_velocity = self.actual_distance_since_target_velocity_changed / (time.time() - time_target_velocity_changed)
            duty_cycle = pid(actual_velocity)
##            if time.time() % 1 >= 0.97 and self.side == "R":
##                print("actual", actual_velocity, "target", target_velocity)
##                print("length", self.length)
            
            if -0.5 < duty_cycle < 0.5:
                if enabled:
                    i2c.digitalWrite(self.enable_pin, False)
                    enabled = False
                time.sleep(period)
            else:
                if duty_cycle > 0 and not self.direction == 1:
                    #self._print("extending %s" % duty_cycle)
                    i2c.digitalWrite(self.extend_pin, True)
                    i2c.digitalWrite(self.retract_pin, False)
                    self.direction = 1
                elif duty_cycle < 0 and not self.direction == -1:
                    #self._print("retracting %s" % duty_cycle)
                    i2c.digitalWrite(self.extend_pin, False)
                    i2c.digitalWrite(self.retract_pin, True)
                    self.direction = -1
                
                duty_cycle = abs(duty_cycle)
                if duty_cycle == 1:
                    if not enabled:
                        i2c.digitalWrite(self.enable_pin, True)
                        enabled = True
                    time.sleep(period)
                else:
                    i2c.digitalWrite(self.enable_pin, True)
                    enabled = True
                    time.sleep(period * duty_cycle)
                    i2c.digitalWrite(self.enable_pin, False)
                    enabled = False
                    time.sleep(period * (1 - duty_cycle))
                    
    
    
    def _stop(self):
        self.target_length = None
        self.target_velocity = 0
        i2c.digitalWrite(self.enable_pin, 0) 
        i2c.digitalWrite(self.extend_pin, 0)
        i2c.digitalWrite(self.retract_pin, 0)
    
    
    def _round_length_to_step(self, length):
        return round(length / config.LA_STEP) * config.LA_STEP
    
    
    def _calculate_duty_cycle_from_speed(self, speed):
        duty_cycle = 1 - (1 - speed / config.LA_MAX_SPEED) / 2  # TODO measure this more precisely
        duty_cycle = min(duty_cycle, 1)
        duty_cycle = max(duty_cycle, 0)
        return duty_cycle

        
    def _calculate_length_from_arm_angle(self, arm_angle):
        # Calculate what actuator length is required to reach a desired control arm angle
        variable_angle = self.variable_angle_at_neutral - arm_angle
        length = (self.H**2 + self.W**2 - 2*self.H*self.W*math.cos(variable_angle))**0.5 - self.L
        length = self._round_length_to_step(length)
        return length
    
    
    def _calculate_arm_angle_from_length(self, length):
        variable_angle = math.acos((self.H**2 + self.W**2 - (length + self.L)**2)/(2*self.H*self.W))
        arm_angle = self.variable_angle_at_neutral - variable_angle
        return arm_angle
    
    
    def _print(self, text, warning=False):
        if not warning:
            logging.info("[LA-{}] {}".format(self.side, text))
        else:
            logging.warning("[LA-{}] {}".format(self.side, text))
    



def init_logger():
    cwd = os.path.dirname(__file__)
    log_dir = os.path.join(cwd, "logs")
    if not os.path.isdir(log_dir):
        os.mkdir(log_dir)

    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG)
    log_formatter = logging.Formatter("[%(asctime)s] %(message)s")

    console_handler = logging.StreamHandler()
    console_handler.setFormatter(log_formatter)
    console_handler.setLevel(logging.INFO)
    root_logger.addHandler(console_handler)

    file_handler = RotatingFileHandler(os.path.join(cwd, "logs", "main.log"), 'a', 1024 ** 2, 10)
    file_handler.setFormatter(log_formatter)
    file_handler.setLevel(logging.DEBUG)
    root_logger.addHandler(file_handler)

if __name__ == "__main__":
    """
    Manually calibrate or control linear actuator lengths from the console
    """
    
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    i2c.setup()
    
    init_logger()
    
    linear_actuator_l = Linear_Actuator('L', debug=False)
    linear_actuator_r = Linear_Actuator('R', debug=False)
    linear_actuator_l.initiate()
    linear_actuator_r.initiate()
    
    calibrate_both(linear_actuator_l, linear_actuator_r)
    
    response = ""
    while True:
        while not response in ["l", "r", "exit"]:
            response = input("Choose actuator ['l', 'r', 'exit']").lower()
        if response == "exit": break
        
        linear_actuator = linear_actuator_l if response == "l" else linear_actuator_r
        target_length = float(input("Target length (m)?"))
        linear_actuator.set_length(target_length)
        
     
