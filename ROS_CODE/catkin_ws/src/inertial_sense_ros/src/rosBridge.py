# !/usr/bin/env python
import rospy
import geometry_msgs
from geometry_msgs.msg import Twist
import numpy as np

class RosBridge:
    def __init__(self):
        pass

    def ros_bridge_control(self, mower):
        rospy.init_node('rosBridge', anonymous=True)
        rospy.Subscriber("cmd_vel", Twist, self.twist_converter, queue_size=1)

        # set_turn(target_linear_velocity, target_angular_velocity) [m/s], [rad/s]
        mower.set_turn(self.twist)
        
        # keeps python from exiting until this node is stopped
        rospy.spin()


    def twist_converter(self, twist):
        # note: the z component of linear and angular velocity is ignored in this calculation
        self.linear_velocity = self.magnitude([twist.linear.x, twist.linear.y])
        self.angular_velocity = self.magnitude([twist.angular.x, twist.angular.y])

        self.twist = [self.linear_velocity, self.angular_velocity]

    @staticmethod
    def magnitude(vector):
        mag = 0
        for i in vector:
            mag += i ** 2
        mag = np.sqrt(mag)
        return mag