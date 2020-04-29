#!/usr/bin/env python
import rospy
import nav_msgs
import geometry_msgs 
import math

from geometry_msgs.msg  import Twist, Vector3

twist_publish = rospy.Publisher('/cmd_vel', Twist, queue_size =1)

def localize(data):
	data.x = (data.x - 813311) /10
	data.y = (data.y +4768520) / 10
	z = math.atan2(data.y, data.x)
	z_degrees = math.degrees(z)
	linearxyz = Vector3(x=1,y=1,z=0)

	angularxyz = Vector3(x=data.x,y=data.y,z=z_degrees)
 

	new_twist = Twist(linear=linearxyz, angular=angularxyz)
	twist_publish.publish(new_twist)


def navigator():
	rospy.init_node('navigator', anonymous=True)
	rospy.Subscriber('/gps/location', Vector3, localize)
	rospy.spin()


if __name__ == '__main__':
	navigator()