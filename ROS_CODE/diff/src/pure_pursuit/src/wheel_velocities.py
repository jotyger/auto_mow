#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import Float64

wheelSeparation =  1.5
wheelRadius = .269

from nav_msgs.msg import Path
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point

#path = Path()

def set_wheel_velocities(data):
	## CONVERT ANGULAR TO m/s?
	linear = data.linear.x
	angular = data.angular.z
	velDiff = (wheelSeparation *angular ) /2.0
	leftPower = (linear - velDiff) / wheelRadius
	path_left.publish(leftPower)
	rightPower = (linear + velDiff) / wheelRadius
	path_right.publish(rightPower)

rospy.init_node('Wheel_Velocities')

odom_sub = rospy.Subscriber("cmd_vel",Twist, set_wheel_velocities, queue_size=1)
path_left = rospy.Publisher('/left_velocity', Float64, queue_size=1)
path_right = rospy.Publisher('/right_velocity', Float64, queue_size=1)

if __name__ == '__main__':
    rospy.spin()