## Pins (BOARD)
# Linear Actuators
# extend high + retract low = extend
# retract high + extend low = retract
LA_L_EXTEND = 18
LA_L_RETRACT = 22
LA_R_EXTEND = 12
LA_R_RETRACT = 16

LA_L_HE = 24
LA_R_HE = 26

# Wheel Encoders
# A - back, B - front
WE_L_A = 33
WE_L_B = 35
WE_R_A = 29
WE_R_B = 31

# Mower Overrides
# Mower will abort if brake is off and seat not occupied, or brake is engaged and arms are off.
OR_SEAT = 32
OR_ARMS_BRAKE = 36
OR_IGNITION = 38  # Control with a ~2s pulse, not constant high. Requires arms and brake to be high.
OR_BLADES = 40  # Blades only engage when seat is occupied


## Database
# Credentials
#DB_HOST = "10.160.53.33"
DB_HOST = "192.168.43.14"
DB_USER = "mrmower"
DB_PASSWORD = "mower"
DB_NAME = "lawnmower"

# Proof of Life and rate
DB_ROVER_POL_RATE = 0 # [s] time between each Proof of Life message to server, 0 for none
DB_BASE_POL_TIMEOUT = 5 # [s]
DB_WE_RATE = 0.25 # [s] time between uploading wheel encoder velocities to the database

DB_CONTROL_LV_SLOW = 0.4 # [m/s]
DB_CONTROL_AV_SLOW = 30 # [deg/s]


# Website-control multipliers
RC_LINEAR_V_MPS_PER_STEP = 0.5 # [m/s]
RC_ANGULAR_V_DPS_PER_STEP = 15 # [degrees / s]


## Mower Dimensions
WHEEL_CIRCUMFERENCE = 1.69  # [m]
MOWER_WIDTH = 1.057  # [m]

