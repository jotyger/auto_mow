#!/usr/bin/env python
import rospy
import nav_msgs
import time
import geometry_msgs 
import std_msgs


from std_msgs.msg import String
from nav_msgs.msg import Odometry

publish_4 = rospy.Publisher('/GPIO4', String, queue_size = 1)

def interface():
	rospy.init_node('setGPIO', anonymous=True)
	rospy.Subscriber("ins",Odometry, callback, queue_size =1)
        # spin() simply keeps python from exiting until this node is stopped
	rospy.spin()

def callback(data):
        #rospy.Subscriber("/gps/location",Vector3, gps_location_callback, queue_size=1)
	publish_4.publish("1")
    	time.sleep(1)
    	#publish_4(String("false"))
	publish_4.publish("0")
    	time.sleep(1)
        #rospy.Subscriber("ins",Odometry, callback, queue_size =1)



if __name__ == '__main__':
    interface()

