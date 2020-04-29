#! /usr/bin/python3

## Author: Ryan Brazeal
## Email: ryan.brazeal@ufl.edu
## Date Started: Nov 24th, 2018
## Description: Python3 based driver for SlamTec RPLidar 

## Notes:
##
##    Nov.28th, 2018 - Received an email reply from SlamTec support and apparently new protocol documentation is currently being written to illustrate the new A3 scan rates
##
##    Dec.2nd, 2018 - Standard Scan Rate (~4 KHz) is working properly
##
##    Dec.10th, 2018 - Express Scan Rate (~8 KHz) is working properly
##                     Due to SlamTec protocol document not being updated for A3 device (and I don't feel like reverse engineering the C++ code), no other scan rates are currently working

## RPLidar Viewer Instructions:
##
##    Mouse: 
##        Left Click and Hold - moves (translates) the scan data on the screen
##        Right Click and Hold -  rotates the scan data on the screen (display purposes only, i.e., recorded scan data is unaffected)
##        Mouse Wheel - forward to zoom in, backwards to zoom out
##        Double Left Click - re-center the scan data
##        Double Right Click - re-orientate (rotate) the scan data
##        Double Middle Click - reset the zoom level
##
##    Keyboard:
##        r key    - toogles the faint ray traces on/off within the viewer
##        [/{ key - increases point size
##        ]/} key - decreases point size
##        =/+ key - zooms in
##        -/_ key - zooms out
##        Up/Down/Left/Right keys - moves the scan data in the respective direction
##        ,/< key    - rotates the scan data counter-clockwise
##        ./> key - rotates the scan data clockwise
##        c key    - re-center the scan data
##        o key    - re-orientate (rotate) the scan data
##        z key    - reset the zoom level
##        i key    - re-center and re-orientate and reset the zoom (initializes the default viewer settings)
##        Esc key    - Ends the scanning session and closes the viewer

##----------------------------------------------------------------------

## Modification Author: Michael Parkinson
## Email: balaanboy@gmail.com
## Description: Simplified Python3 based driver for SlamTec RPLidar

## Notes:
##
##    Added overwritable functions which are called after each point, packet, and 360-scan
##    Removed built-in pygame implementation to improve efficiency
##    Removed built-in file logging to imrove efficiency
##    Consolidated packet processing code
##    Reformatted variable and function names etc. to be compliant with PEP 8

# Standard Imports
import time
import math
import binascii

#Non-standard Imports
import serial                    #install pyserial

#lidar sensor device class
class RPLidar:
    
    #default constructor
    def __init__(self, port, baudrate, timeout, process_point=None, process_32_points=None, process_scan=None):
        #serial port parameters
        self.COM = serial.Serial()
        self.COM.baudrate = baudrate
        self.COM.port = port
        self.COM.timeout = timeout

        #sensor/scanning parameters
        self.pulseRateExpress = 0
        self.rotation_rate = 0
        self.start_time = 0
        self.scan = []
        self.scan_start_angle = 0
        
        self.prev_valid_delta = 0
        self.t0 = 0
        self.should_scan = True
        self.motor_started = False
        
        if process_point: self.process_point = process_point
        if process_32_points: self.process_32_points = process_32_points
        if process_scan: self.process_scan = process_scan
        
    #command to establish a connection between the RPLidar sensor and the computer
    def connect(self):
        #connect to serial port
        try:
            self.COM.close()
        except:
            pass
        self.COM.open()

    #command to disconnect the RPLidar sensor from the computer
    def disconnect(self):
        self.COM.close()

    # stop scan command, stops the transmission of data
    def stop_scan(self):
        commandBytes = '\xA5\x25'
        commandBytes = self.add_checksum(commandBytes)
        self.COM.write(commandBytes)
        print("Scan Stopped")

    # reset command, should be used for proper communication/functionality checks, currently I'm not doing this
    def reset(self):
        commandBytes = '\xA5\x40'
        commandBytes = self.add_checksum(commandBytes)
        self.COM.write(commandBytes)
        print("System Reset")

    #very ugly checksum generator for '\x00\x11\x22... string format', adds the checksum byte to the end of the input string
    def add_checksum(self, the_bytes):
        checksum = 0
        newCommand = ''
        
        for el in the_bytes:
            checksum ^= ord(el)
            indiv = hex(ord(el))[1:]
            if len(indiv) == 2:
                indiv = indiv[0:1] + "0" + indiv[1:]
            newCommand += '\\' + indiv

        temp = hex(checksum)[1:]
        if len(temp) == 2:
            temp = temp[0:1] + "0" + temp[1:]
        newCommand += '\\' + temp
        temp2 = str.encode(newCommand)
        newCommand = temp2.decode('unicode-escape').encode('ISO-8859-1')
        return(newCommand)
        
    #query command to get the device information parameters and display them to the terminal window
    def get_device_info(self):
        #self.COM.reset_input_buffer()
        command_bytes = '\xA5\x50'
        command_bytes = self.add_checksum(command_bytes)
        self.COM.write(command_bytes)
        time.sleep(0.01)
        input_bytes = bytes(self.COM.read(self.COM.inWaiting()))

        model = input_bytes[7]
        firmware_minor = input_bytes[8]
        firmware_major = input_bytes[9]
        hardware = input_bytes[10]
        serial_num = "".join([hex(byte).replace("0x", "") for byte in input_bytes[11:]])
        
        print("Get Device Info Response: ")
        print("   Model: " + str(model))
        print("   Firmware: " + str(firmware_major) + "." + str(firmware_minor))
        print("   Hardware: " + str(hardware))
        print("   Serial: " + serial_num + "\n")

    #query command to get the device health parameters and display them to the terminal window
    def get_device_health(self):
        #self.COM.reset_input_buffer()
        command_bytes = '\xA5\x52'
        command_bytes = self.add_checksum(command_bytes)
        self.COM.write(command_bytes)
        time.sleep(0.01)
        input_bytes = bytes(self.COM.read(self.COM.inWaiting()))
        
        status = input_bytes[7]
        error_code = input_bytes[8] + (input_bytes[9] << 8)
        
        print("Get Health Status Response: ")
        print("   Status: " + str(status))
        print("   Error Code: " + str(error_code) + "\n")

    #query command to get the device's default saaple rates and display them to the terminal window 
    def get_sample_rate(self):
        #self.COM.reset_input_buffer()
        command_bytes = '\xA5\x59'
        command_bytes = self.add_checksum(command_bytes)
        self.COM.write(command_bytes)
        time.sleep(0.01)
        input_bytes = bytearray(self.COM.read(self.COM.inWaiting()))
        
        self.pulse_rate_standard = input_bytes[7] + (input_bytes[8] << 8)
        self.pulse_rate_express = input_bytes[9] + (input_bytes[10] << 8)
        pps_standard = int(1 / (self.pulse_rate_standard / 1000000))
        pps_express = int(1 / (self.pulse_rate_express / 1000000))
        
        print("Get Sample Rate Response: ")
        print("   Standard Scan Sample Rate: {} us ({}) pts/sec".format(self.pulse_rate_standard, pps_standard))
        print("    Express Scan Sample Rate: {} us ({}) pts/sec\n".format(self.pulse_rate_express, pps_express))

    def process_packet_data(self, deltas, distances, omega1, omega2):
        angle_diff = omega2 - omega1
        if angle_diff < 0: angle_diff += 360
        
        points = []
        
        for i in range(32):
            delta = deltas[i]
            distance = distances[i]
            if distance > 0:
                self.prev_valid_delta = delta
            else:
                delta = self.prev_valid_delta
            k = i + 1
            angle = (omega1 + (angle_diff / 32) * k - delta) % 360
            
            points.append([angle, distance])
            self.process_point(angle, distance)
        
        self.process_32_points(points)
        
        for angle, distance in points:
            if len(self.scan) > 100:
                prev_angle = self.scan[-1][0]
                a = (prev_angle < self.scan_start_angle <= angle)
                b = angle < prev_angle and (prev_angle - 360 < self.scan_start_angle <= angle)
                
                bound = 5
                diff = self.scan_start_angle - prev_angle
                if diff < 0: diff += 360
                c = abs(diff) < bound
                if (a or b) and c:
                    self.rotation_rate = 1 / (time.time() - self.t0)
                    self.t0 = time.time()
                    self.process_scan(self.scan)
                    self.scan = []
            self.scan.append([angle, distance])
    
    def start_express_scan(self):
        self.start_time = time.time()
        self.start_motor()
        command_bytes = '\xA5\x82\x05\x00\x00\x00\x00\x00'
        command_bytes = self.add_checksum(command_bytes)
        self.COM.write(command_bytes)
        time.sleep(0.01)
        
        byte_data = bytearray(self.COM.read(self.COM.inWaiting()))

        packetsize = byte_data[2]
        midpackets = (byte_data[3] << 4) + (byte_data[4] << 2) + byte_data[5]

        if not (byte_data[0] == 165 and byte_data[1] == 90 and packetsize == 84 and midpackets == 64 and byte_data[6] == 130): return

        print("Express Scan Started (packet size: {:d} bytes)".format(packetsize))

        byte_n = 0
        first_packet_exists = False
        
        omega1 = 0
        omega2 = omega2_P1 = omega2_P2 = 0
        
        delta1_1 = delta1_2 = delta1_sign = 0
        delta2_1 = delta2_2 = delta2_sign = 0
        deltas = []
        
        distance1_1 = distance1_2 = 0
        distance2_1 = distance2_2 = 0
        distances = []
        
        while self.should_scan:
            buffer_data = bytearray(self.COM.read(self.COM.inWaiting()))
               
            for byte in buffer_data:
                if byte_n == 0:
                    if not byte >> 4 == 10:
                        byte_n = 0
                        continue
                elif byte_n == 1:
                    if not byte >> 4 == 5:
                        byte_n = 0
                        continue
                elif byte_n == 2:
                    omega2_2 = byte
                elif byte_n == 3:
                    omega2_1 = (byte & 127) << 8
                    omega1 = omega2
                    omega2 = (omega2_1 + omega2_2) / 64
                    
                    if first_packet_exists:
                        self.process_packet_data(deltas, distances, omega1, omega2)
                        distances = []
                        deltas = []
                    else:
                        first_packet_exists = True
                elif (byte_n - 4) % 5 == 0:
                    distance1_2 = byte >> 2
                    delta1_1 = (byte & 1) << 4
                    delta1_sign = -1*((byte & 3) >> 1)
                elif (byte_n - 0) % 5 == 0:
                    distance1_1 = byte << 6
                elif (byte_n - 1) % 5 == 0:
                    distance2_2 = byte >> 2
                    delta2_1 = (byte & 1) << 4
                    delta2_sign = -1*((byte & 3) >> 1)
                elif (byte_n - 2) % 5 == 0:
                    distance2_1 = byte << 6
                elif (byte_n - 3) % 5 == 0:
                    delta1_2 = byte & 15
                    delta2_2 = byte >> 4
                    deltas.append(delta1_sign * (delta1_1 + delta1_2) / 8)
                    deltas.append(delta2_sign * (delta2_1 + delta2_2) / 8)
                    distances.append((distance1_1 + distance1_2) / 1000)
                    distances.append((distance2_1 + distance2_2) / 1000)
                if byte_n == 83:
                    byte_n = 0
                    continue
                
                byte_n += 1
        
        self.stop_scan()
        self.stop_motor()
                
    def process_point(self, angle, distance):
        return

    def process_32_points(self, points):
        return
    
    def process_scan(self, points):
        return
    
    def display_point(self, point):
        print("θ={:.2f}° r={:.3f}m".format(point[0], point[1]))
    
    def angles_distances_to_points(self, angles, distances):
        points = zip(angles, distances)
        return points
    
    def points_to_angles_distances(self, points):
        angles = [point[0] for point in points]
        distances = [point[1] for point in points]
        return angles, distances
    
    def start_motor(self):
        self.COM.setDTR(False)
        self.motor_started = True
    
    def stop_motor(self):
        self.COM.setDTR(True)
        self.motor_started = False

# Example program using RPLidar class object
if __name__ == "__main__":
    try:
                         #Port,          Baud,   Timeout           
        sensor = RPLidar('/dev/ttyUSB0', 115200, 1)   # LINUX
        sensor.connect()
        sensor.get_device_info()
        sensor.get_device_health()
        sensor.get_sample_rate()        
        sensor.start_express_scan()
    
    except KeyboardInterrupt:
        print("Scan Interrupted")
        
        
        
        
