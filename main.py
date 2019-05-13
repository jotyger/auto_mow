"""
main.py
"""

import logging
import threading
import time
import math
import RPi.GPIO as GPIO
from logging.handlers import RotatingFileHandler
import os.path

import i2c

import config
import database
import lidar
import linear_actuator
import wheel

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
    
def console_control(mower):
    response = input("['start', 'stop', 'blades on', 'blades off', 'exit', '(degrees/s),(m/s)'")
    while response != "exit":
        if response == "":
            mower.set_turn(0, 0)
            mower.kill_engine()
        elif response == "start":
            mower.start_engine()
        elif response == "stop":
            mower.kill_engine()
        elif response == "blades on":
            mower.start_blades()
        elif response == "blades off":
            mower.kill_blades
        elif response == "auto":
            time.sleep(10)
            mower.move_linear(5)
            time.sleep(2)
            mower.move_angular(math.pi / 3)
            time.sleep(2)
            mower.move_linear(10)
            time.sleep(2)
            mower.move_angular(-math.pi / 3)
            time.sleep(2)
            mower.move_linear(10)
            time.sleep(2)
            mower.move_angular(math.pi / 3)
            time.sleep(2)
            mower.move_linear(5)
        elif response[0] == 'm':
            mower.move_linear(float(response[1:]))
        elif response[0] == 'a':
            mower.move_angular(math.radians(float(response[1:])))
        elif "," not in response:
            #angular_velocity = float(response) * math.pi / 180
            #mower.set_turn(angular_velocity, 0)
            linear_velocity = float(response)
            mower.set_linear_velocity(linear_velocity)
        else:
            angular_velocity = float(response.split(",")[0]) * math.pi / 180
            linear_velocity = float(response.split(",")[1])
            mower.set_turn(linear_velocity, angular_velocity)
        response = input("['start', 'stop', 'blades on', 'blades off', 'exit', 'degrees/s, m/s'")

class Mower():                    
    def __init__(self, debug=False):
        self.GPIO = GPIO
        self.i2c = i2c
        self.debug = debug
        
        self.linear_actuator_l = linear_actuator.Linear_Actuator('L', debug)
        self.linear_actuator_r = linear_actuator.Linear_Actuator('R', debug)
        self.wheel_l = wheel.Wheel("L", self.linear_actuator_l, debug)
        self.wheel_r = wheel.Wheel("L", self.linear_actuator_r, debug)

        # outputs
        self.i2c.pinMode(config.I2C_OUT_OR_SEAT, 1)
        self.i2c.pinMode(config.I2C_OUT_OR_BRAKE, 1)
        self.i2c.pinMode(config.I2C_OUT_OR_ARMS, 1)
        self.i2c.pinMode(config.I2C_OUT_OR_IGNITION, 1)
        self.i2c.pinMode(config.I2C_OUT_OR_BLADES, 1)
        
        self.i2c.digitalWrite(config.I2C_OUT_OR_SEAT, False)
        self.i2c.digitalWrite(config.I2C_OUT_OR_BRAKE, False)
        self.i2c.digitalWrite(config.I2C_OUT_OR_ARMS, False)
        self.i2c.digitalWrite(config.I2C_OUT_OR_IGNITION, False)
        self.i2c.digitalWrite(config.I2C_OUT_OR_BLADES, False)
        self.engine_state = False
        
        #inputs
        self.i2c.pinMode(config.I2C_IN_OR_SEAT, 0)
        self.i2c.pinMode(config.I2C_IN_OR_BRAKE, 0)
        #self.i2c.pinMode(config.I2C_IN_OR_ARMS, 0)
        #self.i2c.pinMode(config.I2C_IN_OR_IGNITION, 0)
        self.i2c.pinMode(config.I2C_IN_OR_BLADES, 0)
    
    def initiate(self):
        self.linear_actuator_l.initiate()
        self.linear_actuator_r.initiate()
        linear_actuator.calibrate_both(self.linear_actuator_l, self.linear_actuator_r)
        self.wheel_l.initiate()
        self.wheel_r.initiate()
        lidar_thread = threading.Thread(target=lidar.monitor, args=[self])
        lidar_thread.daemon = True
        lidar_thread.start()
    
    def start_engine(self):  # blocking
        if self.i2c.digitalRead(config.I2C_IN_OR_BRAKE) == True:
            self._print("Brake must be disengaged before starting engine with an override.", warning=True)
            return False
        
        # Override the brake and arms so that the engine will start
        self.i2c.digitalWrite(config.I2C_OUT_OR_BRAKE, True)
        self.i2c.digitalWrite(config.I2C_OUT_OR_ARMS, True)
        self.i2c.digitalWrite(config.I2C_OUT_OR_SEAT, True)  # Override seat sensor, otherwise disengaging brakes/arms will abort mower
        #time.sleep(1)
        
        # Ignite engine
        self.i2c.digitalWrite(config.I2C_OUT_OR_IGNITION, True)
        time.sleep(2.5)
        self.i2c.digitalWrite(config.I2C_OUT_OR_IGNITION, False)
        self.engine_state = True
        
        # Stop overriding arms and brake
        self.i2c.digitalWrite(config.I2C_OUT_OR_BRAKE, False)
        self.i2c.digitalWrite(config.I2C_OUT_OR_ARMS, False)
        return True
        
    def kill_engine(self):  # Blocking; Requires the brake to be disengaged and the seat to be empty
        self.i2c.digitalWrite(config.I2C_OUT_OR_SEAT, False)
        time.sleep(0.1)
        
        if self.i2c.digitalRead(config.I2C_IN_OR_SEAT) == True:  # someone is sitting in the seat
            self.i2c.digitalWrite(config.I2C_OUT_OR_BRAKE, True)
        
        # Record that the engine has been killed
        self.engine_state = False
        time.sleep(3)
        self.i2c.digitalWrite(config.I2C_OUT_OR_BRAKE, False)
        
    
    def start_blades(self):
        if self.i2c.digitalRead(config.I2C_IN_OR_SEAT) == True:
            self.i2c.digitalWrite(config.I2C_OUT_OR_BLADES, True)
        else:
            self._print("Cannot start blades; seat is not overriden", warning=True)
            return False
        return True
    
    def kill_blades(self):
        self.i2c.digitalWrite(config.I2C_OUT_OR_BLADES, False)
        
    # +av = counter-clockwise, -av = clockwise; target_v is at center of mower between wheels
    def set_turn(self, target_linear_velocity, target_angular_velocity, ): # [m/s], [rad/s]
        velocity_difference = config.MOWER_WIDTH * target_angular_velocity # difference in velocities of the wheels to achieve the av...
        # positive indicates right wheel has higher velocity, therefore turning left (counter clockwise)
        
        target_velocity_l = target_linear_velocity - velocity_difference / 2
        self.wheel_l.set_velocity(target_velocity_l)
        
        target_velocity_r = target_linear_velocity + velocity_difference / 2
        self.wheel_r.set_velocity(target_velocity_r)
    
    # Set mower speed
    def set_linear_velocity(self, target_linear_velocity):  # [m/s]
        self.set_turn(target_linear_velocity, 0)
    
    # Turn the Lawnmower a certain amount with zero-turn
    def set_angular_velocity(self, target_angular_velocity):  # [rad/s]
        self.set_turn(0, target_angular_velocity)
    
    def move_linear(self, distance, max_linear_speed=config.MAX_LINEAR_SPEED):  # [m]
        ## assumes starting at 0 m/s and moving forward
        t1 = abs(distance) / max_linear_speed
        t2 = max_linear_speed / a
        a = config.THROTTLE_NORMAL_ACCELERATION
        if t1 < max_linear_speed / a:
            t1 = math.sqrt(abs(distance) / a)
            t2 = t1
        if distance > 0:
            self.set_linear_velocity(max_linear_speed)
        if distance < 0:
            self.set_linear_velocity(-max_linear_speed / 2)
        print(t1, t2)
        time.sleep(t1)
        self.set_linear_velocity(0)
        time.sleep(t2)
    
    def move_angular(self, angle, max_angular_speed=config.MAX_ANGULAR_SPEED):  # [rad]
        angle = angle % 360
        if angle > 180:
            angle -= 360
        
        max_linear_speed = max_angular_speed * (config.MOWER_WIDTH / 2)
        distance_per_wheel = config.MOWER_WIDTH * abs(angle)
        print("distance per wheel", distance_per_wheel)
        t1 = distance_per_wheel / max_linear_speed
        t2 = max_linear_speed / a
        a = config.THROTTLE_NORMAL_ACCELERATION
        if t1 < max_linear_speed / a:
            t1 = math.sqrt(distance_per_wheel / a)
            t2 = t1
        standard_angular_speed = 15  # [deg/s]
        print(t1, t2)
        if angle > 0:
            self.wheel_r.set_velocity(+max_linear_speed)
            self.wheel_l.set_velocity(-max_linear_speed)
            time.sleep(t1)
            self.wheel_l.set_velocity(0)
            self.wheel_r.set_velocity(0)
            time.sleep(t2)
        else:
            self.wheel_r.set_velocity(-max_linear_speed)
            self.wheel_l.set_velocity(+max_linear_speed)
            time.sleep(t1)
            self.wheel_l.set_velocity(0)
            self.wheel_r.set_velocity(0)
            time.sleep(t2)
    
    # Stop all actuator movement and monitoring immediately
    def abort(self, text="Unknown"):
        logging.info("Aborting: {}".format(text))
        self.kill_engine()
        self.linear_actuator_l.abort()
        self.linear_actuator_r.abort()
    
    
    def _print(self, text, warning=False):
        if not warning:
            logging.info("[Mower] {}".format(text))
        else:
            logging.warning("[Mower] {}".format(text))

if __name__ == "__main__":
    init_logger()
    
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    i2c.wiringPiSetup() # initialise wiringpi  
    i2c.mcp23017Setup(config.I2C_PINBASE, config.I2C_ADDRESS)   # set up the pins and i2c address
    
    mower = Mower(debug=True)
    mower.initiate()
    
    # Determine whether to get instructions from the database, or from the Python console
    command = input("Control via console or database? (c/d)").lower()
    
    if command == 'd':  # Get instructions from database
        database.database_control(mower)
    elif command == 'c': # get instruction from Python console
        console_control(mower)
