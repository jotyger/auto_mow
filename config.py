## I2C settings and pins
I2C_PINBASE = 65  # lowest available starting number is 65  
I2C_ADDRESS = 0x20  # A0, A1, A2 pins all wired to GND  

# Linear Actuators (Output)
I2C_OUT_LA_L_RETRACT = I2C_PINBASE + 15  # GPB7
I2C_OUT_LA_L_EXTEND  = I2C_PINBASE + 13  # GPB5
I2C_OUT_LA_L_ENABLE  = I2C_PINBASE + 14  # GPB6
I2C_OUT_LA_R_RETRACT = I2C_PINBASE + 10  # GPB2
I2C_OUT_LA_R_EXTEND  = I2C_PINBASE + 11  # GPB3
I2C_OUT_LA_R_ENABLE  = I2C_PINBASE + 12  # GPB4
# EXTEND high + RETRACT low = extend
# RETRACT high + EXTEND low = retract

# Mower Overrides 'OR'
I2C_OUT_OR_SEAT      = I2C_PINBASE + 2  # GPA2
I2C_OUT_OR_BRAKE     = I2C_PINBASE + 4  # GPA4
I2C_OUT_OR_ARMS      = I2C_PINBASE + 5  # GPA5
I2C_OUT_OR_IGNITION  = I2C_PINBASE + 7  # GPA7  # Control with a ~2s pulse, not constant high. Requires arms and brake to be high.
I2C_OUT_OR_BLADES    = I2C_PINBASE + 0  # GPA0  # Blades only engage when seat is occupied.
# Mower will abort if brake is open (low) and seat not occupied (low), or brake is engaged (high) and arms are in (low).

# Mower Override Inputs
I2C_IN_OR_SEAT       = I2C_PINBASE + 1  # GPA1
I2C_IN_OR_BRAKE      = I2C_PINBASE + 3  # GPA3
#I2C_IN_OR_ARMS       = I2C_PINBASE + 6  # GPB5
#I2C_IN_OR_IGNITION   = I2C_PINBASE + 12  # GPB4
I2C_IN_OR_BLADES     = I2C_PINBASE + 6  # GPA6 


## GPIO Pins (GPIO.BOARD numbering)
# Linear Actuators 'LA' (Input)
GPIO_IN_LA_L_HE = 24
GPIO_IN_LA_R_HE = 25

# Wheel Encoders 'WE'
# A - back, B - front
GPIO_IN_WE_HE_LA = 20
GPIO_IN_WE_HE_LB = 19
GPIO_IN_WE_HE_RA = 22
GPIO_IN_WE_HE_RB = 12


## Linear Actuators
LA_STEP = 0.00017896 # [m] distance the actuator moves between each pulse
LA_MAX_SPEED = 0.007 # [m/s] speed of extension/retraction
LA_FULL_LENGTH = 0.3048 # [m] determine
LA_MIN_ALLOWABLE_LENGTH = 0.02 # [m] determine
LA_MAX_ALLOWABLE_LENGTH = 0.18 # [m] determine
LA_DEFAULT_SPEED = LA_MAX_SPEED * 0.8  # default duty cycle for linear actuator PWM
LA_CONTROL_FREQUENCY = 64

LA_L_FULLY_RETRACTED_LENGTH = LA_R_FULLY_RETRACTED_LENGTH = 0.370  # [m] Distance between upper and lower actuator pivot points when fully retracted
LA_L_UPPER_HORIZONTAL_DISTANCE = 0.038  # [m] Horizontal component of distance between arm pivot point and upper actuator pivot point
LA_R_UPPER_HORIZONTAL_DISTANCE = 0.038
LA_L_INNER_HYPOTENUSE_DISTANCE = LA_R_INNER_HYPOTENUSE_DISTANCE = 0.322  # [m] Distance between arm pivot point and upper actuator pivot point
LA_L_LOWER_HORIZONTAL_DISTANCE = LA_R_LOWER_HORIZONTAL_DISTANCE = 0.491  # [m] Horizontal component of distance between arm pivot point and lower actuator pivot point
LA_L_LOWER_HYPOTENUSE_DISTANCE = LA_R_LOWER_HYPOTENUSE_DISTANCE = 0.515  # [m] Distance between arm pivot point and lower actuator pivot point


## Wheel Encoders
HE_phase_LA = 0
HE_phase_LB = 0.2908
HE_phase_RA = 0
HE_phase_RB = 0.2424
HE_duty_cycle_LA = 0.5814
HE_duty_cycle_LB = 0.5668
HE_duty_cycle_RA = 0.6000
HE_duty_cycle_RB = 0.5859
WE_ZERO_VELOCITY_WAIT_DURATION = 5  # [s]
WHEEL_CIRCUMFERENCE = 1.69  # [m]
WE_N_MAGNET = 28
WHEEL_CONTROL_FREQUENCY = 10  # [hz]
WHEEL_FEEDBACK_DEVIATION_BOUND = 0.1  # [m]


THROTTLE = 1
if THROTTLE == 1:
    THROTTLE_NORMAL_ACCELERATION = 0.1  # [m/s^2]
elif THROTTLE == 2:
    THROTTLE_NORMAL_ACCELERATION = 0.2  # [m/s^2]
elif THROTTLE == 3:
    THROTTLE_NORMAL_ACCELERATION = 0.36 * 0.9  # [m/s^2]





## Database
# Credentials
#DB_HOST = "10.160.53.33"
DB_HOST = "192.168.43.14"
DB_USER = "mrmower"
DB_PASSWORD = "mower"
DB_NAME = "lawnmower"


## Website control
# Proof of Life and rate
DB_ROVER_POL_RATE = 0 # [s] time between each Proof of Life message to server, 0 for none
DB_BASE_POL_TIMEOUT = 5 # [s]
DB_WE_RATE = 0.25 # [s] time between uploading wheel encoder velocities to the database

DB_CONTROL_LV_SLOW = 0.4 # [m/s]
DB_CONTROL_AV_SLOW = 30 # [deg/s]

DB_CONNECTION_TRIES = 3
DB_QUERY_TRIES = 3

# Website-control multipliers
RC_LINEAR_V_MPS_PER_STEP = 0.5 # [m/s]
RC_ANGULAR_V_DPS_PER_STEP = 15 # [degrees / s]


## Mower Dimensions
MOWER_WIDTH = 1.057  # [m]

MAX_LINEAR_SPEED = 2  # [m/s]
MAX_ANGULAR_SPEED = 0.524  # [rad/s]

