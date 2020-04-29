#!/usr/bin/env python
import rospy
import std_msgs
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from std_msgs.msg import Float64 


publish_yaw= rospy.Publisher('/yaw', Float64, queue_size = 1)
roll = pitch = yaw = 0.0
 
def get_rotation (msg):
    global roll, pitch, yaw
    orientation_q = msg.pose.pose.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
    #print yaw
    publish_yaw.publish(yaw)
 


rospy.init_node('Live_Pose')
 
sub = rospy.Subscriber ('/IMU', Odometry, get_rotation)
 
r = rospy.Rate(1)
while not rospy.is_shutdown():
    quat = quaternion_from_euler (roll, pitch,yaw)
    print quat
    r.sleep()