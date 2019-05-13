"""
wheel.py
"""

import csv
import RPi.GPIO as GPIO
import logging
from logging.handlers import RotatingFileHandler
import math
import os.path
import threading
import time

import config

import wiringpi as i2c

class Wheel():    
    def __init__(self, side, linear_actuator, debug=False):        
        self.side = side
        self.linear_actuator = linear_actuator
        self.debug = debug
        
        # Set up I/O pins
        if self.side == 'L':
            self.HE_pin_A = config.GPIO_IN_WE_HE_LA
            self.HE_pin_B = config.GPIO_IN_WE_HE_LB
            self.HE_phase_A = config.HE_phase_LA
            self.HE_phase_B = config.HE_phase_LB
            self.HE_duty_cycle_A = config.HE_duty_cycle_LA
            self.HE_duty_cycle_B = config.HE_duty_cycle_LB
        elif self.side == 'R':
            self.HE_pin_A = config.GPIO_IN_WE_HE_RA
            self.HE_pin_B = config.GPIO_IN_WE_HE_RB
            self.HE_phase_A = config.HE_phase_RA
            self.HE_phase_B = config.HE_phase_RB
            self.HE_duty_cycle_A = config.HE_duty_cycle_RA
            self.HE_duty_cycle_B = config.HE_duty_cycle_RB
        GPIO.setup(self.HE_pin_A, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.setup(self.HE_pin_B, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        self.HE_state_A = GPIO.input(self.HE_pin_A)
        self.HE_state_B = GPIO.input(self.HE_pin_B)
        self.HE_edge_time_A = time.time()
        self.HE_edge_time_B = time.time()
        
    
    def initiate(self):      
        """
        Set up changeable variables
        Set up debug logging
        Set up input interrupt and control thread
        """
        
        self.velocity = 0  # [m/s] Instantaneous measured velocity
        self.target_velocity = 0  # [m/s]
        self.distance_since_target_velocity_changed = 0
        
        if self.debug:
            here = os.path.dirname(os.path.abspath(__file__))
            filename_A = os.path.join(here, "logs/WE-{}A.csv".format(self.side))
            filename_B = os.path.join(here, "logs/WE-{}B.csv".format(self.side))
            self.input_log_file_A = open(filename_A, 'w', newline='')
            self.input_log_file_B = open(filename_B, 'w', newline='')
            self.input_csv_writer_A = csv.writer(self.input_log_file_A, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            self.input_csv_writer_B = csv.writer(self.input_log_file_B, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            self.time_log_started = time.time()
        
        _feedback_thread_1 = threading.Thread(target=self._feedback_thread, args=[self.HE_pin_A])
        _feedback_thread_1.daemon = True
        _feedback_thread_1.start()
        _feedback_thread_2 = threading.Thread(target=self._feedback_thread, args=[self.HE_pin_B])
        _feedback_thread_2.daemon = True
        _feedback_thread_2.start()
        if self.linear_actuator:
            _control_thread = threading.Thread(target=self._control_thread)
            _control_thread.daemon = True
            #_control_thread.start()
    
    
    def _feedback_thread(self, pin):
        state = False
        n = 0
        while True:
            if GPIO.input(pin):
                if state == False:
                    n += 1
                    if n >= 3:
                        state = True
                        self._handle_edge(pin, True)
                        n = 0
            else:
                if state == True:
                    n += 1
                    if n >= 3:
                        state = False
                        self._handle_edge(pin, False)
            time.sleep(0.001)
    
    
    def set_velocity(self, target_velocity): # [m/s]
        """
        Set the target velocity for the wheel
        _control_thread() will change its behavior when self.target_velocity changes
        target_velocity > 0: forward
        target_velocity < 0: reverse
        target_velocity = 0: stop
        """
        
        # Calculate the arm angle required to achieve a target velocity by doing interpolation of mapped data
        self.target_velocity = target_velocity
        if target_velocity > 0:
            if config.THROTTLE == 1:
                arm_angle = 0.035 + (0.254 - 0.035) * target_velocity / 1.75
            elif config.THROTTLE == 2:
                arm_angle = 0.025 + (0.2345 - 0.025) * target_velocity / 2.95
            elif config.THROTTLE == 3:
                if target_velocity < 0.593:  # m/s
                    arm_angle = 0.025 + (0.049 - 0.025) * target_velocity / 0.593
                else:
                    arm_angle = 0.049 + (0.254 - 0.049) * target_velocity / 4.43
        elif target_velocity < 0:
            # TODO map this
            arm_angle = -0.035 + (0.254 - 0.035) * target_velocity / 1.75
        else:
            arm_angle = 0
        
        self.linear_actuator.set_arm_angle(arm_angle)
        
        self._print("Setting velocity to {:.2f}".format(self.target_velocity))
    
    
    def _handle_edge(self, pin, is_rising):
        """
        Called when rising/falling edge is detected on either hall effect sensor, indicating a change in rotation of the wheel
        Requires 3 consecutive consistent readings to count as an edge.
        Updates instantaneous velocity and distance since target velocity changed
        """
        
        is_HE_A = pin == self.HE_pin_A
        is_HE_B = not is_HE_A
        if (is_HE_A and self.HE_state_A != is_rising) or (is_HE_B and self.HE_state_B != is_rising):
            for i in range(2):
                if GPIO.input(pin) != is_rising: return
                time.sleep(0.0001)
        else:
            return
        
        edge_time = time.time()
        if is_HE_A:
            self.HE_state_A = is_rising
            self.HE_edge_time_A = edge_time
        elif is_HE_B:
            self.HE_state_B = is_rising
            self.HE_edge_time_B = edge_time
        
        # Determine the sensor with which to compare
        last_edge = self.HE_state_B if is_HE_A else self.HE_state_A
        last_edge_time = self.HE_edge_time_B if is_HE_A else self.HE_edge_time_A
        
        # Determine direction
        if is_HE_A and (is_rising != last_edge): direction = 1
        elif is_HE_A and (is_rising == last_edge): direction = -1
        elif is_HE_B and (is_rising != last_edge): direction = -1
        elif is_HE_B and (is_rising == last_edge): direction = 1
        
        # Calculate faction of periods since the last edge TODO link to chart
        if   (direction == +1 and is_HE_B and     is_rising) or (direction == -1 and is_HE_A and not is_rising):
            fraction_of_period = self.HE_phase_B - self.HE_phase_A  # first segment
        elif (direction == +1 and is_HE_A and not is_rising) or (direction == -1 and is_HE_B and not is_rising):
            fraction_of_period = self.HE_phase_A + self.HE_duty_cycle_A - self.HE_phase_B  # second segment
        elif (direction == +1 and is_HE_B and not is_rising) or (direction == -1 and is_HE_A and     is_rising):
            fraction_of_period = self.HE_phase_B + self.HE_duty_cycle_B - self.HE_duty_cycle_A - self.HE_phase_A  # third segment
        elif (direction == +1 and is_HE_A and     is_rising) or (direction == -1 and is_HE_B and     is_rising):
            fraction_of_period = 1 + self.HE_phase_A - self.HE_phase_B - self.HE_duty_cycle_B  # fourth segment
        # Calculate distance [m] and velocity since last edge
        distance = direction * fraction_of_period / (config.WE_N_MAGNET / 2) * config.WHEEL_CIRCUMFERENCE
        self.distance_since_target_velocity_changed += distance
        self.velocity = distance / (edge_time - last_edge_time)
        
        # Log the velocity
        if self.debug:
            if is_HE_A:
                self.input_csv_writer_A.writerow([edge_time - self.time_log_started, self.velocity])
                self.input_log_file_A.flush()
            elif is_HE_B:
                self.input_csv_writer_B.writerow([edge_time - self.time_log_started, self.velocity])
                self.input_log_file_B.flush()
    
    
    def _control_thread(self):
        """
        Use pulse width modulation to match target speed using feedback from hall effect sensor
        """
        
        frequency = config.WHEEL_CONTROL_FREQUENCY  # [Hz]
        period = 1 / frequency
        
        target_velocity = self.target_velocity
        time_target_velocity_changed = time.time()
        prev_target_velocity = target_velocity
        deviation_bound = config.WHEEL_FEEDBACK_DEVIATION_BOUND  # [m]
        while True:
            if (time.time() - self.HE_edge_time_A > config.WE_ZERO_VELOCITY_WAIT_DURATION) and (time.time() - self.HE_edge_time_B > config.WE_ZERO_VELOCITY_WAIT_DURATION):
                self.velocity = 0  # Been a while since last edge, so velocity is very close to or exactly 0.
            
            if target_velocity != self.target_velocity:
                prev_target_velocity = target_velocity
                target_velocity = self.target_velocity
                time_target_velocity_changed = time.time()
                self.distance_since_target_velocity_changed = 0
            
            dt = time.time() - time_target_velocity_changed
            a = config.THROTTLE_NORMAL_ACCELERATION
            target_dx = prev_target_velocity * dt + a * dt ** 2 / 2 - a * max(0, dt - (target_velocity - prev_target_velocity) / a) ** 2 / 2
            deviation_between_target_and_actual_distance = self.distance_since_target_velocity_changed - target_dx  # [m]
            if deviation_between_target_and_actual_distance <= -deviation_bound:  # lagging behind
                if self.linear_actuator.target_velocity != 0:
                    self.linear_actuator.add_target_velocity_correction(-0.01 * config.LA_MAX_SPEED)  # [m/s]
                else:
                    self.linear_actuator.add_target_arm_angle_correction(+0.0175)  # [rad]
            elif deviation_between_target_and_actual_distance >= deviation_bound:  # overshooting
                if self.linear_actuator.target_velocity != 0:
                    self.linear_actuator.add_target_velocity_correction(+0.01 * config.LA_MAX_SPEED)  # [m/s]
                else:
                    self.linear_actuator.add_target_arm_angle_correction(-0.0175)  # [rad]
            time.sleep(period)
    
    
    def _print(self, text, warning=False):
        if not warning:
            logging.info("[WE-{}] {}".format(self.side, text))
        else:
            logging.warning("[WE-{}] {}".format(self.side, text))


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
    Enable velocity logging. No velocity control.
    """

    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    i2c.wiringPiSetup() # initialise wiringpi  
    i2c.mcp23017Setup(config.I2C_PINBASE, config.I2C_ADDRESS)   # set up the pins and i2c address
    init_logger()
    
    wheel_l = Wheel('L', linear_actuator=None, debug=True)
    wheel_r = Wheel('R', linear_actuator=None, debug=True)
    wheel_l.initiate()
    wheel_r.initiate()
    
    logging.info("Logging velocity data to log files for left and right wheels.")
    input("Press enter to quit.")
    
    