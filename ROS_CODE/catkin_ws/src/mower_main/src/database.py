"""
database.py
"""

import pymysql as MySQLdb
import socket
#import MySQLdb
#import MySQLdb.cursors

import config

def database_control(mower):
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

class Database():    
    def __init__(self):
        pass    
    
    def initiate(self):
        """
        Set up changeable variables
        Determine the local IP of the rover so that it can be sent to the website
        Attempt to connect to database
        Start main thread
        """
        
        self.should_stop = False
        self.initial_values = False
        self.tasks = []
        self.connection = None
    
        self.ipv4 = [(s.connect(('8.8.8.8', 53)), s.getsockname()[0], s.close()) for s in
                [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1]
        self._print("Local address: {}".format(self.ipv4))
        
        self.connection = self.create_or_verify_connection()
        
        if self.conn:
            self.thread = threading.Thread(target=self._database_thread)
            self.thread.start()
            self._print("Started database thread.")
    
    
    def create_or_verify_connection(self):
        """
        Attempt to connect to database, and return the connection if successful.
        """
        
        for i in range(config.DB_CONNECTION_TRIES):
            if not self.connection:
                try:
                    connection = MySQLdb.connect(host=config.DB_HOST, db=config.DB_NAME, user=config.DB_USER, passwd=config.DB_PASSWORD, autocommit=True)
                    connection.ping(True)
                except MySQLdb.Error:
                    self.connection = None
                else:
                    self._print("Connected to database.")
                    break
        else:
            self._print("Failed to connect to database.", warning=True)
        return connection
    
    
    def _database_thread(self):
        while self.should_stop == False:
            # Create task to get the data from the database and feed it into self.update_values()
            query = ("SELECT * FROM lawnmower")
            self.tasks.append([query, 'update_values'])
            
            self.connection = self.create_or_verify_connection()

            if self.connection:
                self.execute_tasks()
    
    
    def execute_tasks(self):
        with self.connection.cursor(MySQLdb.cursors.DictCursor) as cur:
            while self.tasks:
                task = self.tasks[0]
                if task[0] != "SELECT * FROM lawnmower":
                    #logging.info(task[0])
                    pass
                
                for i in range(config.DB_QUERY_TRIES):
                    try:
                        cur.execute(task[0])
                        result = cur.fetchall()
                        self.tasks.pop(0)
                        if len(task) > 1:
                            function, *args = task[1:]
                            getattr(self, function)(result, *args)
                    except MySQLdb.Error:
                        pass
                    else:
                        break
                else:
                    self._print("[Database] SQL query failed.")
    
    
    def update_values(self, fetched):
        row = fetched[0]
        
        
        self.base_pol = float(row["ProofOfLife"])
        self.control_direction = int(row["ControlButton"])
        self.control_speed = int(row["ControlSpeed"])
        self.control_engine = int(row["ControlEngine"])
        self.control_blades = int(row["ControlBlades"])
        
        self.initial_values = True
    
    
    def abort(self):
        self.should_stop = True
        self.thread.join()
        self._print("Stopped database thread.")

        #with self.connection.cursor() as cur:
        #    cur.execute("UPDATE lawnmower SET RoverPOL=-1")
        self.connection.close()
    
    
    def _print(self, text, warning=False):
        if not error:
            logging.info("[DB] {}".format(self.side, text))
        else:
            logging.warning("[DB] {}".format(self.side, text))
    
    