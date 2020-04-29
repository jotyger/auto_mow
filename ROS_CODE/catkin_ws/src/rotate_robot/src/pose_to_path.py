#!/usr/bin/env python
import rospy

from nav_msgs.msg import Path
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Point

path = Path()

def callback(data):
    global path
    path.header = data.header
    pose = PoseStamped()
    pose.header = data.header
    pose.pose = data.pose                   #.pose
    path.poses.append(pose)
    path_pub.publish(path)

if __name__ == '__main__':
	rospy.init_node('Path_Creator', anonymous=True)
	sub = rospy.Subscriber('pose_current', PoseStamped, callback)
	#path_output.header.stamp = rospy.Time.now()
	path_pub =  rospy.Publisher('Path_To_Follow', Path, queue_size = 100)
	rospy.spin()
	


