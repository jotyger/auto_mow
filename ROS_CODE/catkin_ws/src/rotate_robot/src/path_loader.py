#!/usr/bin/env python
import time
import rospy
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Path
import numpy as np

def go(msg):
	posestamped= PoseStamped()
	publish_heading_control.publish(posestamped)
	sub.unregister()
	rospy.logwarn("Current Pose Initialized")
		
if __name__ == '__main__':
	rospy.init_node('First_Point', anonymous=True)
	time.sleep(5)
	#path= np.genfromtxt('/home/ubuntu/Desktop/PATH/path.csv', delimiter=',')
	publish_heading_control = rospy.Publisher('/Heading_Control', PoseStamped, queue_size = 1)
	global sub 
	sub = rospy.Subscriber('clock', Path, go)
	rospy.spin()
	#return 0