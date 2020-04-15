import config
import wiringpi
import threading
import time

tasks = []

def setup():
    wiringpi.wiringPiSetup() # initialise wiringpi  
    wiringpi.mcp23017Setup(config.I2C_PINBASE, config.I2C_ADDRESS)   # set up the pins and i2c address
    threading.Thread(target=do_tasks, args=[]).start()

def pinMode(pin, mode):
    tasks.append(["pinMode", pin, mode])

def digitalRead(pin):
    tasks.append(["digitalRead", pin])
    while len(returns) == 0:
        time.sleep(0.0001)
    return returns.pop(0)

def digitalWrite(pin, state):
    tasks.append(["digitalWrite", pin, state])

def do_tasks():
    while True:
        time.sleep(0.0001)
        if len(tasks) > 0:
            task = tasks.pop(0)
            #print(task)
            if task[0] == "pinMode":
                wiringpi.pinMode(task[1], task[2])
            elif task[0] == "digitalRead":
                state = wiringpi.digitalRead(task[1])
                returns.append(state)
            elif task[0] == "digitalWrite":
                wiringpi.digitalWrite(task[1], task[2])