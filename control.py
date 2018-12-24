import csv
import logging
import socket
import threading
import time
from config import *
import math
import RPi.GPIO as GPIO
import pymysql as MySQLdb
#import MySQLdb
#import MySQLdb.cursors
from logging.handlers import RotatingFileHandler
import os.path

GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

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

    file_handler = RotatingFileHandler(os.path.join(cwd, "logs", "mower.log"), 'a', 1024 ** 2, 10)
    file_handler.setFormatter(log_formatter)
    file_handler.setLevel(logging.DEBUG)
    root_logger.addHandler(file_handler)


def main():
    init_logger()
    # Determine whether to get instructions from the database, or from the Python console
    command = input("Control via console or database? (c/d)").lower()
    
    if command == 'd':  # Get instructions from database
        database_control()

    elif command == 'c': # get instruction from Python console
        console_control()
        
def database_control():
    db = Database()  # Create database connection
    we = Wheel_Encoder()  # Create wheel encoder object
    we.start()  # Begin to measure motion
    should_stay_straight = False
    #if input("Use wheel encoders to stay straight? (y/n)").lower() == 'y':
    #    should_stay_straight = True        
        
    controller = Controller(we, should_stay_straight)
    we.controller = controller
    controller.calibrate()  # Ensure that the actuators are in their neutral position, and start monitoring position
    db.start()  # Begin constantly retreiving instructions from database and executing tasks as they are created
    
    while (db.initial_values == False):  # Wait for the first set of instructions to be retreived
        time.sleep(0.001)
    
    base_pol = db.base_pol
    control_direction = db.control_direction
    control_speed = db.control_speed
    control_engine = db.control_engine
    control_blades = db.control_blades
    
    last_db_we_time = 0
    last_db_rover_pol_time = 0
    
    while True:
        t = time.time()
        
        # Check if anything has changed. If so, execute the new movement instructions
        if ([db.control_direction, db.control_speed, db.control_engine, db.control_blades] !=
            [control_direction, control_speed, control_engine, control_blades]):
            
            if [db.control_direction, db.control_speed] != [control_direction, control_speed]:
                """
                control direction:
                0 - forward-left
                1 - forward
                2 - forward-right
                3 - left
                4 - none
                5 - right
                6 - back-right
                7 - back
                8 - back-left
                """
                
                linear_velocity = 0
                linear_velocity = 0
                linear_velocity_mag = 0
                angular_velocity_mag = 0
                if db.control_speed == 1:
                    linear_velocity_mag = DB_CONTROL_LV_SLOW
                    angular_velocity_mag = DB_CONTROL_AV_SLOW * math.pi / 180
                elif db.control_speed == 2:
                    linear_velocity_mag = DB_CONTROL_LV_FAST
                    angular_velocity_mag = DB_CONTROL_AV_FAST * math.pi / 180
                
                if db.control_direction in [0, 1, 2]:
                    linear_velocity = linear_velocity_mag
                elif db.control_direction in [3, 4, 5]:
                    linear_velocity = 0
                elif db.control_direction in [6, 7, 8]:
                    linear_velocity = -linear_velocity_mag
                    
                if db.control_direction in [0, 3, 8]:
                    angular_velocity = angular_velocity_mag
                elif db.control_direction in [1, 4, 7]:
                    angular_velocity = 0
                elif db.control_direction in [2, 5, 6]:
                    angular_velocity = -angular_velocity_mag
                
                logging.info("Setting movement: LV={:.3f}, AV={:.3f}".format(linear_velocity, angular_velocity))
                controller.set_turn(angular_velocity, linear_velocity)
            
            if db.control_engine == 1 and control_engine == 0:
                controller.start_engine()
            elif db.control_engine == 0 and control_engine == 1:
                controller.kill_engine()
            
            if db.control_blades != control_blades:
                controller.engage_blades(db.control_blades)
        
        base_pol = db.base_pol
        control_direction = db.control_direction
        control_speed = db.control_speed
        control_engine = db.control_engine
        control_blades = db.control_blades
        
        # Check for Proof of Life from server, and stop if loss in connection
        if t - db.base_pol >= DB_BASE_POL_TIMEOUT:
            controller.stop()
            db.stop()
            time.sleep(5)
            controller.abort()
            break

        # Send a Proof of Life signal to the database
        if t - last_db_rover_pol_time >= DB_ROVER_POL_RATE and DB_ROVER_POL_RATE:
            db.tasks.append(["UPDATE lawnmower SET RoverPOL='{}'".format(t)])
            last_db_rover_pol_time = t
        
        # Send measured wheel encoder velocities to the database to be displayed on the website
        if t - last_db_we_time >= DB_WE_RATE and DB_WE_RATE and we:
            db.tasks.append(["UPDATE lawnmower SET MeasuredLV='{:.1f}'".format(we.linear_velocity)])
            db.tasks.append(["UPDATE lawnmower SET MeasuredAV='{:.1f}'".format(we.angular_velocity * 180 / math.pi)])
            last_db_we_time = t
        
        time.sleep(0.001)
    
def console_control():
    we = None
    should_stay_straight = False
    we = Wheel_Encoder()
    we.start()
    
    # Use wheel encoders to keep velocity of the wheels the same when target av=0
    #if input("Use wheel encoders to stay straight? (y/n)").lower() == 'y':
    #    should_stay_straight = True

    controller = Controller(we, should_stay_straight)
    we.controller = controller
    controller.calibrate()
    
    command = input("Command ('degrees/s,m/s' e.g. '45,1'): ")
    while command != "exit":
        if command == "":
            controller.set_turn(0, 0)
        elif command == "start":
            controller.start_engine()
        elif command == "stop":
            controller.kill_engine()
        elif command == "blades on":
            controller.engage_blades(True)
        elif command == "blades off":
            controller.engage_blades(False)
        elif "," not in command:
            #angular_velocity = float(command) * math.pi / 180
            #controller.set_turn(angular_velocity, 0)
            linear_velocity = float(command)
            controller.set_turn(0, linear_velocity)
        else:
            angular_velocity = float(command.split(",")[0]) * math.pi / 180
            velocity = float(command.split(",")[1])
            controller.set_turn(angular_velocity, velocity)
        command = input("Command ('degrees/s,m/s' e.g. '45,1'): ")

class Database():
    should_stop = False
    initial_values = False
    
    def __init__(self):
        # Create a connection to the database
        n_tries = 3
        for i in range(n_tries):
            try:
                self.conn = self.create_conn()
            except MySQLdb.Error:
                logging.error("Could not connect to database.")
                self.conn = None
            else:
                logging.info("Connected to database.")
                break
            logging.info("Retrying...")
        else:
            logging.error("FAILED TO CONNECT TO DATABASE.")
    
        # Determine the local IP of the rover so that it can be sent to the website
        self.ipv4 = [(s.connect(('8.8.8.8', 53)), s.getsockname()[0], s.close()) for s in
                [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1]

    def start(self):
        self.should_stop = False
        self.tasks = []
        self.thread = threading.Thread(target=self.database_thread)
        self.thread.start()
        logging.info("Started database thread.")
                
    def create_conn(self):
        conn = MySQLdb.connect(host=DB_HOST, db=DB_NAME, user=DB_USER, passwd=DB_PASSWORD, autocommit=True)
        conn.ping(True)
        print("connected")
        return conn
    
    def database_thread(self):
        while self.should_stop == False:
            # Create task to get the data from the database and feed it into self.update_values()
            query = ("SELECT * FROM lawnmower")
            self.tasks.append([query, 'update_values'])

            n_retries = 3
            for i in range(n_retries):
                if not self.conn:
                    try:
                        self.conn = self.create_conn()
                    except MySQLdb.Error:
                        logging.error("Could not connect to database.")
                    else:
                        logging.info("Reconnected to database.")
                        break

            if self.conn:
                self.execute_tasks()

    def execute_tasks(self):
        with self.conn.cursor(MySQLdb.cursors.DictCursor) as cur:
            while self.tasks:
                task = self.tasks[0]
                if task[0] != "SELECT * FROM lawnmower":
                    #logging.info(task[0])
                    pass
                n_retries = 3
                for i in range(n_retries):
                    try:
                        cur.execute(task[0])
                        result = cur.fetchall()
                        self.tasks.pop(0)
                        if len(task) > 1:
                            function, *args = task[1:]
                            getattr(self, function)(result, *args)
                    except MySQLdb.Error:
                        logging.warning("[Database] SQL query failed, attempt #%d" %
                            (i + 1))
                    else:
                        break

    def update_values(self, fetched):
        row = fetched[0]
        
        
        self.base_pol = float(row["ProofOfLife"])
        self.control_direction = int(row["ControlButton"])
        self.control_speed = int(row["ControlSpeed"])
        self.control_engine = int(row["ControlEngine"])
        self.control_blades = int(row["ControlBlades"])
        
        self.initial_values = True
        
    def stop(self):
        self.should_stop = True
        self.thread.join()
        logging.info("Stopped database thread")

        #with self.conn.cursor() as cur:
        #    cur.execute("UPDATE lawnmower SET RoverPOL=-1")
        self.conn.close()


class Linear_Actuator():
    side = None
    
    step = 0.00017896 # [m] distance the actuator moves between each pulse
    max_speed = 0.0075 # [m/s] speed of extension/retraction
    full_length = 0.3048 # [m] determine
    neutral_length = None
    min_length = 0.02 # [m] determine
    max_length = 0.18 # [m] determine
    length = None # [m] to be changed by calibration and monitoring
    angle = 0
    movement_direction = 0 # 0 = none, 1 = extend, -1 = retract
    last_movement_direction = 0
    target_length = None # [m]
    last_edge_time = 0
    process_edges = False
    
    calibrated = False
    aborted = False # when true, stopes monitoring thread
    
    def __init__(self, side, gpio_extend, gpio_retract, gpio_in):
        if side == "L":
            self.h = 0.041 # [m] horizontal distance between arm pivot point and upper actuator pivot point
        elif side == "R":
            self.h = 0.033 # [m] horizontal ance between actuator pivot points when fully retracted
        self.l = 0.370 # [m] distance between actuator pivot points when fully retracted
        self.w = 0.491 # [m] horizontal distance between arm pivot point and lower actuator pivot point
        self.W = 0.515 # [m] hypotenuse distence between arm pivot point and lower actuator pivot point
        self.lower_constant_arm_angle = math.acos(self.w / self.W)
        self.H = 0.322 # [m] hypotenuse distance between arm pivot point and upper actuator pivot point
        self.upper_constant_arm_angle = math.asin(self.h / self.H)
        self.constant_arm_angle = self.lower_constant_arm_angle + self.upper_constant_arm_angle  # 90 degrees minus angle due to actuator in neutral
        self.neutral_length = self.get_length_from_angle(0)
        
        self.side = side  # R or L based on side
        self.gpio_extend = gpio_extend
        self.gpio_retract = gpio_retract
        self.gpio_in = gpio_in
        
        # Set up GPIO pins
        GPIO.setup(gpio_extend, GPIO.OUT)
        GPIO.setup(gpio_retract, GPIO.OUT)
        GPIO.setup(gpio_in, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        
        # Set up Pulse Width Modulation so that actuator velocity can be controlled
        self.pwm_extend = GPIO.PWM(gpio_extend, 10000)
        self.pwm_retract = GPIO.PWM(gpio_retract, 10000)
        self.pwm_extend.start(0)
        self.pwm_retract.start(0)
        
        # Set up log file and writer
        self.file = open("logs/lin_act_log_" + side + ".csv", 'w', newline='')
        self.writer = csv.writer(self.file, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        self.start_time = time.time()
    
    # Set the direction and speed of the actuator
    def move(self, direction, speed_fraction=1):
        if self.aborted:
            return
        
        self.movement_direction = direction
        
        if direction == 1:
            DC_extend = speed_fraction * 100
            DC_retract = 0
        elif direction == -1:
            DC_extend = 0
            DC_retract = speed_fraction * 100
        else:
            DC_extend = 0
            DC_retract = 0
        
        self.pwm_extend.ChangeDutyCycle(DC_extend)
        self.pwm_retract.ChangeDutyCycle(DC_retract)
    
    # Begin moving the actuator to the desired length
    def set_length(self, target_length): # [m]
        if self.aborted:
            return
        
        self.target_length = target_length
        if target_length > self.length:
            self.move(1)#, (target_length - self.length) / self.max_speed * self.overshoot_multiplier)
        elif target_length < self.length:
            self.move(-1)#, (self.length - target_length) / self.max_speed * self.overshoot_multiplier)

    # Calculate what actuator length is required to reach a desired control arm angle
    def get_length_from_angle(self, req_arm_angle):
        req_variable_arm_angle = math.pi / 2 - self.constant_arm_angle - req_arm_angle
        req_length = (self.H**2 + self.W**2 - 2*self.H*self.W*math.cos(req_variable_arm_angle))**0.5 - self.l
        return req_length

    def get_angle_from_length(self, length):
        variable_arm_angle = math.acos((self.H**2 + self.W**2 - (length + self.l)**2)/(2*self.H*self.W))
        arm_angle = math.pi / 2 - self.constant_arm_angle - variable_arm_angle
        return arm_angle
    
    # Stop actuator movement
    def stop(self):
        self.move(0)
        
    # Detect rising/falling edges (requires n consistent readings)
    def edge_detection_thread(self):
        last_state = GPIO.input(self.gpio_in)
        while True:
            for i in range(3):
                if GPIO.input(self.gpio_in) != last_state:
                    continue
                else:
                    break
            else:
                last_state = not last_state
                
                self.writer.writerow([time.time() - self.start_time, int(not last_state)])
                self.writer.writerow([time.time() - self.start_time + 0.000001, int(last_state)])
                self.file.flush()
                
                if last_state == True:
                    self.last_edge_time = time.time()
                    if self.process_edges:
                        self.rising_edge()
            time.sleep(0.001)
    
    # Recalculate length and change momement accordingly when a rising edge is detected
    def rising_edge(self):
        self.length = round(self.length + self.movement_direction * self.step, 8) # 8 decimals
        self.angle = self.get_angle_from_length(self.length)
        #self.printf("Length: {}m".format(self.length))
        
        # Actuator is moving toward a target length?
        if self.target_length is not None:
            # Actuator has reached or passed its target length
            if (self.movement_direction == 1 and self.length >= self.target_length or
                    self.movement_direction == -1 and self.length <= self.target_length):
                if self.calibrated == False:  # When calibrating, the first target length will be nuetral.
                    self.calibrated = True
                self.stop() # Stop the actuator movement since it has reached its target length
                #logging.info("{}: Reached target of {}".format(self.side, round(self.target_length, 8)))
                self.target_length = None  # Remove target length since the actuator has reached it
        
        # Actuator is passing the allowable boundary?
        if (self.length >= self.max_length and self.movement_direction == 1
                or self.length <= self.min_length and self.movement_direction == -1):
            self.stop()  # Further actuator movement could damage the mower or cause it to go too fast, so stop.
    
    # stop all movement and monitoring for this actuator immediately
    def abort(self, message="Unknown"):
        self.pwm_extend.ChangeDutyCycle(0)
        self.pwm_retract.ChangeDutyCycle(0)
        self.aborted = True
        self.printf("Aborting: {}".format(message))
        self.file.close()
    
    def printf(self, text):
        logging.info("{}-Act: {}".format(self.side, text))


class Controller():
    throttle_mph = 6 # [mph]
    max_forward_speed = throttle_mph * 0.44704 # m/s (mph * m/s/mph) [determine this]
    max_reverse_speed = -throttle_mph / 3 * 0.44704 # m/s (mph * m/s/mph) [determine this]
    neutral_arm_angle = 0 # [rad]
    max_arm_angle = 15 * math.pi / 180 # [rad] 15 degrees, determine
    min_arm_angle = -10 * math.pi / 180 # [rad] -5 degrees, determine
    target_velocity_l = 0
    target_velocity_r = 0
    target_velocity = 0
    target_angular_velocity = 0
    should_continue = True
    should_stay_straight = True
                    
    def __init__(self, we, should_stay_straight=True):
        self.la_l = Linear_Actuator("L", LA_L_EXTEND, LA_L_RETRACT, LA_L_HE)
        self.la_r = Linear_Actuator("R", LA_R_EXTEND, LA_R_RETRACT, LA_R_HE)
        
        self.we = we
        
        self.or_seat = OR_SEAT
        self.or_arms_brake = OR_ARMS_BRAKE
        self.or_ignition = OR_IGNITION
        self.or_blades = OR_BLADES
        for pin in [self.or_seat, self.or_arms_brake, self.or_ignition, self.or_blades]:
            GPIO.setup(pin, GPIO.OUT)
            GPIO.output(pin, False)
        self.or_seat_state = False
        self.or_arms_brake_state = False
        self.or_ignition_state = False
        self.or_blades_state = False
            
        self.should_stay_straight = should_stay_straight
    
    def start_engine(self):  # blocking
        #TODO check that the brake is disengaged, else return
        # Override the brake and arms so that the engine will start
        GPIO.output(self.or_arms_brake, True)
        self.or_arms_brake_state = True
        time.sleep(1)
        
        # Ignite engine
        GPIO.output(self.or_ignition, True)
        self.or_ignition_state = True
        time.sleep(2)
        GPIO.output(self.or_ignition, False)
        self.or_ignition_state = False
        # Record that the engine has been started
        self.engine_state = True
        
        # Override seat sensor, otherwise disengaging brakes/arms will abort mower
        GPIO.output(self.or_seat, True)
        self.or_seat_state = True
        
        # Stop overriding arms and brake
        GPIO.output(self.or_arms_brake, False)
        self.or_arms_brake_state = False
        
    def kill_engine(self):  # Blocking; Requires the brake to be disengaged and the seat to be empty
        # Stop overriding arms and brake
        GPIO.output(self.or_arms_brake, False)
        self.or_arms_brake_state = False
        
        # Stop overriding the seat, which will kill the engine
        GPIO.output(self.or_seat, False)
        self.or_seat_state = False
        
        # Record that the engine has been killed
        self.engine_state = False
        
    
    def engage_blades(self, desired_state):
        if desired_state == True:  # Start the blades
            if self.or_seat_state == True:
                GPIO.output(self.or_blades, True)
                self.or_blades_state = True
            else:
                logging.info("Cannot start blades; seat is not overriden")
                return False
        elif desired_state == False:  # Stop the blades
            GPIO.output(self.or_blades, False)
            self.or_blades_state = False
        return True
    
    # set each of the actuators to the neutral lenght, after a full retraction
    def calibrate(self):
        logging.info("Check that the actuators are disconnected from the control arms and placed in the upright position.")
        calibration_response = ""
        while (not (calibration_response == "ok" or calibration_response == "skip")):
            calibration_response = input("Enter 'ok' to continue, 'skip' to skip (acts MUST be at neutral): ").lower()
                
        if calibration_response == "ok":
            actuators = [self.la_l, self.la_r]
            for actuator in actuators:
                actuator.move(-1)  # retract
                actuator.last_edge_time = time.time()
                threading.Thread(target=actuator.edge_detection_thread, args=[]).start()
                
            # Wait for actuators to reach their retracted state and automatically turn off
            wait_time = 0.25
            while (time.time() - self.la_l.last_edge_time < wait_time or time.time() - self.la_r.last_edge_time < wait_time):
                time.sleep(0.001)
            
            for actuator in [self.la_l, self.la_r]:
                actuator.stop()
                actuator.length = 0
                actuator.process_edges = True
                actuator.printf("Extending to neutral length...")
                self.set_wheel_speed(0, actuator)
            logging.info("Please wait for each actuator to reach its neutral length")
            while not (self.la_l.calibrated and self.la_r.calibrated):  # Wait until both actuators are at their neutral length
                time.sleep(0.001)
            logging.info("Calibrated.")
        elif calibration_response == "skip":
            logging.info("Skipping calibration.")
            self.la_l.length = self.la_l.neutral_length
            self.la_r.length = self.la_r.neutral_length
            
            for actuator in [self.la_l, self.la_r]:
                actuator.process_edges = True
                threading.Thread(target=actuator.edge_detection_thread, args=[]).start()
        
        threading.Thread(target=self.stay_straight_thread, args=[]).start()
    
    # Set mower speed
    def set_speed(self, target_v):
        self.set_wheel_speed(target_v, self.la_l)
        self.set_wheel_speed(target_v, self.la_r)
    
    # If the target movement is straight, use wheel encoders to stay straight
    def stay_straight_thread(self):
        correction_angular_velocity = 0
        while self.should_continue:
            # Wheel encoders are enabled and target velocities are equal and actuators have reached targets
            # and should stay straight
            if self.should_stay_straight == True:
                if (self.we and self.la_l.movement_direction == 0 and self.la_r.movement_direction == 0 and
                    self.target_angular_velocity == 0 and self.target_velocity != 0):
                    l_pulses = self.we.total_l_pulses - self.straight_start_pulses_l
                    r_pulses = self.we.total_r_pulses - self.straight_start_pulses_r
                    min_pulse_deviation = 2
                    if l_pulses >= r_pulses + min_pulse_deviation:
                        correction_angular_velocity += 1 * math.pi / 180
                        self.set_turn(correction_angular_velocity, self.target_velocity, True)
                    elif r_pulses >= l_pulses + min_pulse_deviation:
                        correction_angular_velocity -= 1 * math.pi / 180
                        self.set_turn(correction_angular_velocity, self.target_velocity, True)
            else:
                correction_angular_velocity = 0
            time.sleep(0.25)
    
    # Set individual wheel speed
    def set_wheel_speed(self, target_v, actuator): # [m/s, actuator]
        # calculate the control arm angle required to achieve a certain speed by doing interpolation, ...
        # assuming linear arm angle-speed mapping
        if target_v > 0:
            req_arm_angle = target_v / self.max_forward_speed * (self.max_arm_angle - self.neutral_arm_angle)
        elif target_v < 0:
            req_arm_angle = -target_v / self.max_reverse_speed * (self.neutral_arm_angle - self.min_arm_angle)
        else:
            req_arm_angle = self.neutral_arm_angle
        # req_arm_angle is in [rad], where 0 is vertical, > 0 is forward, and < 0 is reverse
        actuator.printf("Setting angle to {}".format(req_arm_angle))
        
        if req_arm_angle > self.max_arm_angle:
            self.abort("Arm reached maximum allowed angle.")# Asking to move arms outside allowed boundaries; halt system
        elif req_arm_angle < self.min_arm_angle:
                       self.abort("Arm reached minimum allowed angle.") # Asking to move arms outside allowed boundaries; halt system
        
        # calculate the actuator length required to set the control arm to the required angle
        req_length = actuator.get_length_from_angle(req_arm_angle)
        actuator.printf("Setting length to {}".format(req_length))
        
        # begin movement of control arm toward desired position
        actuator.set_length(req_length)
    
    # +av = counter-clockwise, -av = clockwise; target_v is at center of mower between wheels
    def set_turn(self, angular_velocity, target_v=0, staying_straight=False): # [rad/s], [m/s]
        delta_v = MOWER_WIDTH * angular_velocity # difference in velocities of the wheels to achieve the av...
        # positive indicates right wheel has higher velocity, therefore turning left (counter clockwise)
        
        req_l_v = target_v - delta_v / 2
        self.set_wheel_speed(req_l_v, self.la_l)
        
        req_r_v = target_v + delta_v / 2
        self.set_wheel_speed(req_r_v, self.la_r)
        
        if not staying_straight:
            self.target_velocity = target_v
            self.target_velocity_l = req_l_v
            self.target_velocity_r = req_r_v
            self.target_angular_velocity = angular_velocity
            if angular_velocity == 0 and target_v != 0 and self.we:
                self.straight_start_pulses_l = self.we.total_l_pulses
                self.straight_start_pulses_r = self.we.total_r_pulses
        
    # Move the control arms to neutral, stopping mower movement
    def stop(self):
        self.set_speed(0)
    
    # Stop all actuator movement and monitoring immediately
    def abort(self, message="Unknown"):
        self.la_l.abort(message)
        self.la_r.abort(message)
        self.kill_engine()
        self.should_continue = False
        logging.info("Aborting: {}".format(message))


class Wheel_Encoder():
    circumference = WHEEL_CIRCUMFERENCE # [m] circumference of each wheel
    n_magnet = 28
    
    velocity_l = 0
    velocity_r = 0
    velocity_l_list = [0, 0, 0, 0]
    velocity_r_list = [0, 0, 0, 0]
    linear_velocity = 0
    angular_velocity = 0
    total_l_pulses = 0
    total_r_pulses = 0
    
    should_display_velocity = False
    
    def __init__(self):
        """
        name ("XY"):
            X:
                L = Left
                R = Right
            Y:
                A = Back
                B = Front
        phase:
            0-1. Fraction of period delay of B relative to A.
        length:
            0-1. Fraction of period that pulse is high.
        state:
            0,1. Last edge seen. 0=falling edge, 1=rising edge.
        time:
            time of last edge detection
        file:
            log file for the sensor
        writer:
            csv writer for the file of the sensor
        """
                      # name   pin     phase   length  state  time  file  writer
        self.sensors = {"LA": [WE_L_A, 0,      0.5814, 0,     0,    None, None],
                        "LB": [WE_L_B, 0.2908, 0.5668, 0,     0,    None, None],
                        "RA": [WE_R_A, 0,      0.6000, 0,     0,    None, None],
                        "RB": [WE_R_B, 0.2424, 0.5859, 0,     0,    None, None]}
        
        self.start_time = time.time()
        
        # Setup GPIO pins, create files and writers
        for sensor in self.sensors:
            pin = self.sensors[sensor][0]
            file = open("logs/we_log_" + sensor + ".csv", 'w', newline='')
            self.sensors[sensor][5] = file
            self.sensors[sensor][6] = csv.writer(file, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        self.summary_file = open("logs/we_log_summary.csv", 'w', newline='')
        self.summary_writer = csv.writer(self.summary_file, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    
    def start(self):
        threading.Thread(target=self.edge_detection_thread, args=[]).start()
        threading.Thread(target=self.velocity_display_thread, args=[]).start()
        
    # Detect rising/falling edges (requires n consistent readings)
    def edge_detection_thread(self):
        for sensor in self.sensors:
            sensor_data = self.sensors[sensor]
            sensor_data[3] = GPIO.input(sensor_data[0])
        while True:
            for sensor in self.sensors:
                sensor_data = self.sensors[sensor]
                pin = sensor_data[0]
                n = 3
                for i in range(n):
                    if GPIO.input(pin) == sensor_data[3]:
                        break
                else:
                    self.edge(pin, not sensor_data[3])
            time.sleep(0.0001)
    
    # Calculate velocity when edge is detected
    def edge(self, channel, is_rising):
        # Update data of sensor that just rose/fell
        now = time.time()
        for sensor in self.sensors:
            sensor_data = self.sensors[sensor]
            if sensor_data[0] == channel:
                sensor_data[3] = is_rising
                sensor_data[4] = now
                break
        
        # Determine which sensor to compare times to
        comparison_sensor_data = self.sensors[sensor[0] + ("A" if sensor[1] == "B" else "B")]
        was_rising = comparison_sensor_data[3]
        then = comparison_sensor_data[4]
        
        # Determine direction
        direction = 1
        if sensor[1] == "A" and is_rising == was_rising:
            direction = -1
        elif sensor[1] == "B" and is_rising != was_rising:
            direction = -1
        
        # Calculate distance (in periods) since the last edge on this side 
        if sensor[1] == "A" and direction == 1:
            if is_rising:
                length = 1 - comparison_sensor_data[1] - comparison_sensor_data[2]
            else:
                length = sensor_data[2] - comparison_sensor_data[1]
        elif sensor[1] == "B" and direction == 1:
            if is_rising:
                length = sensor_data[1]
            else:
                length = sensor_data[1] + sensor_data[2] - comparison_sensor_data[2]
        elif sensor[1] == "A" and direction == -1:
            if is_rising:
                length = comparison_sensor_data[1] + comparison_sensor_data[2] - sensor_data[2]
            else:
                length = comparison_sensor_data[1]
        elif sensor[1] == "B" and direction == -1:
            if is_rising:
                length = 1 - sensor_data[1] - sensor_data[2]
            else:
                length = comparison_sensor_data[2] - sensor_data[1]
        
        # Calculate the velocity of the wheel on this side
        velocity = direction * length / (self.n_magnet / 2) * self.circumference / (now - then)
        
        # Record the velocity
        if sensor[0] == "L":
            self.velocity_l = velocity
            self.velocity_l_list = [velocity] + self.velocity_l_list[1:]
            self.total_l_pulses += length
        elif sensor[0] == "R":
            self.velocity_r = velocity
            self.velocity_r_list = [velocity] + self.velocity_r_list[1:]
            self.total_r_pulses += length
        
        self.linear_velocity = (self.velocity_r + self.velocity_l) / 2
        self.angular_velocity = (self.velocity_r - self.velocity_l) / MOWER_WIDTH
        
        # Log the velocity
        if sensor[0] == "L":
            self.summary_writer.writerow([now - self.start_time, velocity, "", self.controller.la_l.angle, "", self.controller.la_l.length, ""])
        if sensor[0] == "R":
            self.summary_writer.writerow([now - self.start_time, "", velocity, "", self.controller.la_r.angle, "", self.controller.la_r.length])
        self.summary_file.flush()
         
        self.sensors[sensor][6].writerow([sensor, now - self.start_time, int(not is_rising), velocity])
        #self.sensors[sensor][6].writerow([sensor, now - self.start_time + 0.000001, int(is_rising), velocity])
        self.sensors[sensor][5].flush()
    
    def velocity_display_thread(self):
        while self.should_display_velocity:
            logging.info("VL={:.3f}, VR={:.3f}".format(self.velocity_l, self.velocity_r))
            time.sleep(0.25)

main()