#!/usr/bin/env python
import rospy
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Path
import numpy as np
from rosgraph_msgs.msg import Clock
from rosgraph_msgs.msg import Log



#path= np.genfromtxt('/home/ubuntu/Desktop/PATH/pathshort.csv', delimiter=',')

def go(msg):
	posestamped= PoseStamped()
	publish_heading_control.publish(posestamped)
	rospy.logwarn("Current Pose Initialized")
	publish_path.publish(path)
	

if __name__ == '__main__':
	rospy.init_node('Path_Visualizer', anonymous=True)
	patharray= np.genfromtxt('/home/ubuntu/Desktop/PATH/path.csv', delimiter=',')
	publish_heading_control = rospy.Publisher('/Heading_Control', PoseStamped, queue_size = 1)
	publish_path = rospy.Publisher('/excelpath', Path, queue_size = 1)
	pose = PoseStamped()
	pose.header.frame_id = "my_frame"
	path = Path ()
	path.header.stamp = rospy.Time.now()
	path.header.frame_id = "my_frame"
	for i in patharray:
		pose.header.stamp = rospy.Time.now()
		#pose.pose.position.x = patharray[i][1]
		#pose.pose.position.y = patharray[i][2]
		pose.pose.position.x = i
		pose.pose.position.y = i
		path.poses.append(pose)
		rospy.logwarn(str(pose))
	global sub
	sub = rospy.Subscriber('rosout', Log , go)
	rospy.spin()
	
	
		
		
	
	