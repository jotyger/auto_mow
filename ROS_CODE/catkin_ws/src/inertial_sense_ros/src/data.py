#!/usr/bin/env python
import rospy
import geometry_msgs

from nav_msgs.msg import Path
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Point

path = Path()

def odom_cb(data):
    path_pub.publish(data.pose.pose.position)

rospy.init_node('data_convertor')

odom_sub = rospy.Subscriber("ins", Odometry, odom_cb)
path_pub= rospy.Publisher('/data', Point, queue_size=10)

if __name__ == '__main__': 
    rospy.spin()