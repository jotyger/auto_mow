#!/usr/bin/env python
import rospy
import time
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Path
import numpy as np
from rosgraph_msgs.msg import Clock
from rosgraph_msgs.msg import Log
from std_msgs.msg import Bool
flag = 1

def go(msg):
	global flag
	posestamped= PoseStamped()
	publish_heading_control.publish(posestamped)
	rospy.logwarn("Current Path Created")
	#rospy.logwarn(str(path_to_be_published))
	if (flag ==1):	
		publish_path.publish(path_to_be_published)
		#rospy.logwarn(str(path_to_be_published))
	rospy.logwarn("Current Path Created")
	flag =0;
	rospy.signal_shutdown("Path Produced")	

if __name__ == '__main__':
	rospy.init_node('Path_Visualizer', anonymous=True)
	patharray= np.genfromtxt('/home/ubuntu/Desktop/PATH/path.csv', delimiter=',')
	#rospy.logwarn(str(patharray))
	publish_heading_control = rospy.Publisher('/Heading_Control', PoseStamped, queue_size = 1)
	publish_path = rospy.Publisher('path_segment', Path, queue_size = 1)
	path_to_be_published = Path ()
	path_to_be_published.header.stamp = rospy.Time.now()
	path_to_be_published.header.frame_id = "map"
	i =1
	for row in patharray:
		pose = PoseStamped()
		pose.header.frame_id = "map"
		pose.header.seq = i
		pose.header.stamp = rospy.Time.now()
		#pose.header.seq = row[0]
		pose.pose.position.x = row[1]
		pose.pose.position.y =row[2]
		path_to_be_published.poses.append(pose)
		i = i + 1
	time.sleep(5)
	publish_path = rospy.Publisher('path_segment', Path, queue_size = 1)
	rospy.Subscriber('go', Bool, go)
	rospy.spin()

	
	
		
		
	
	