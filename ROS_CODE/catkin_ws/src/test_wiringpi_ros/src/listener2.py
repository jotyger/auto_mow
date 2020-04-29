#!/usr/bin/env python
import rospy
import nav_msgs
import time
import geometry_msgs 

from nav_msgs.msg import Path
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Pose, Vector3, PoseWithCovarianceStamped
from sensor_msgs.msg import Imu

pub = rospy.Publisher('pose_current_2', PoseStamped, queue_size = 1)
path_pub = rospy.Publisher('/path', Path, queue_size=1)
pose_stamped_cov = rospy.Publisher('/waypoints',PoseWithCovarianceStamped, queue_size = 1)
imu_pub = rospy.Publisher('/imu_data', Imu, queue_size =1)
path = Path()

gps_x = 0
gps_y = 0
gps_z =0

def gps_location_callback(msg):
    global gps_x
    gps_x = msg.x
    global gps_y 
    gps_y =msg.y
    global gps_z
    gps_z = msg.z

def callback(data):
    global path
    data.pose.pose.position.x =  (gps_x - 813311) /10
    data.pose.pose.position.y = (gps_y +4768520) / 10
    data.pose.pose.position.z = 0
    rospy.loginfo("x: " + str(gps_x))
    rospy.loginfo("y: " + str(gps_y))
    rospy.loginfo("z: " + str(gps_z))
    #rospy.loginfo("w: " + str(data.pose.pose.orientation.w))
    PS = PoseStamped()
    pose_only = Pose(position=data.pose.pose.position, orientation=data.pose.pose.orientation)
    PS = PoseStamped(header=data.header, pose=pose_only)
    PS.header.frame_id = "my_frame"
    pub.publish(PS)
    path.header=data.header
    path.poses.append(PS)
    path_pub.publish(path)
    pose_with_covariance = PoseWithCovarianceStamped(header=data.header, pose=data.pose)
    pose_stamped_cov.publish(pose_with_covariance)
    imu = Imu(header=data.header, orientation=data.pose.pose.orientation, angular_velocity =data.twist.twist.angular, linear_acceleration=data.twist.twist.linear)
    imu_pub.publish(imu)

    time.sleep(.005)
#rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener2', anonymous=True)
    rospy.Subscriber("/gps/location",Vector3, gps_location_callback, queue_size=1)
    time.sleep(1)
    rospy.Subscriber("ins",Odometry, callback, queue_size =1)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
