#!/usr/bin/env python
import rospy
import nav_msgs
import time
import geometry_msgs 

from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Pose
pub = rospy.Publisher('pose_current', PoseStamped, queue_size = 1)

def callback(data):
    data.pose.pose.position.x = data.pose.pose.position.x / 1000000
    data.pose.pose.position.y = data.pose.pose.position.y / 1000000
    data.pose.pose.position.z = 0
    #rospy.loginfo("x: " + str(data.pose.pose.position.x / 1000000))
    #rospy.loginfo("y: " + str(data.pose.pose.position.y / 1000000))
    #rospy.loginfo("z: " + str(data.pose.pose.position.z * 0))
    #rospy.loginfo("w: " + str(data.pose.pose.orientation.w))
    PS = PoseStamped()
    pose_only = Pose(position=data.pose.pose.position, orientation=data.pose.pose.orientation)
    PS = PoseStamped(header=data.header, pose=pose_only)
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

    rospy.Subscriber("ins",Odometry, callback, queue_size =1)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
