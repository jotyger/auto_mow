#!/usr/bin/env python
import rospy
import nav_msgs
import time
import geometry_msgs
import sensor_msgs

from sensor_msgs.msg import NavSatFix
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Pose

pub = rospy.Publisher('pose_current', PoseStamped, queue_size = 1)

def callback(data):
    PS = PoseStamped()
    PS.pose.position.x = data.latitude
    PS.pose.position.y = data.longitude
    PS.pose.position.z = data.altitude
    PS.header.frame_id = "my_frame"
    pub.publish(PS)
    time.sleep(.005)
#rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("fix",NavSatFix, callback, queue_size =1)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
