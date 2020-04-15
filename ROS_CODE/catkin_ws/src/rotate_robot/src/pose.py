#!/usr/bin/env python
import rospy
import time
import math
import geometry_msgs 
import numpy as np
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped, Pose, Point
from nav_msgs.msg import Path
from std_msgs.msg import Header
import numpy as np

path_progress = 0
current_pose = Pose()
current_pose_stamped= PoseStamped()
iteration = 0
path_output = Path()
path_output.header.frame_id = "my_frame"
velocity = 1.5
path = path= np.genfromtxt('/home/ubuntu/Desktop/PATH/path.csv', delimiter=',')

def get_yaw(msg):   #radians
    global roll, pitch, yaw
    orientation_q = msg.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
    return yaw

#def find

def follow_path(location):
	global path_progress
	global iteration
	global path_output
	new_target = Point()
	global path

	rospy.logwarn("Self Driving Iteration: " + str(iteration))

	if (iteration == 0):

		current_radians = get_yaw(location.pose)

		rospy.loginfo("\nCurrent Pose \n" + str(location.pose) + "\n")
		rospy.loginfo("Current Radians: " + str(current_radians))

		new_target.x = path[path_progress][1]
		new_target.y = path[path_progress][2]
		new_target.z = 0
		rospy.loginfo("New Target: \n " + str(new_target))

		
		#new_target = Point(path.poses[path_progress + 3].pose.position.x) 
		current_location = location.pose.position
		rospy.loginfo("Current Location: \n" + str(current_location) + " \n  New Target: \n" + str(new_target))

		target_radians = math.atan((new_target.y - current_location.y)/( new_target.x - current_location.x))
		rospy.loginfo("target_radians = " + str(target_radians))
		
		desired_yaw = target_radians
		quaternion = quaternion_from_euler(roll, pitch, desired_yaw)
		#type(pose) = geometry_msgs.msg.Pose
		location.pose.orientation.x = quaternion[0]
		location.pose.orientation.y = quaternion[1]
		location.pose.orientation.z = quaternion[2]
		location.pose.orientation.w = quaternion[3]
		rospy.loginfo("Current Pose: " + str(location.pose))
		rospy.loginfo("END ITERATION 0")
		iteration += 1


	time.sleep(1)
	current_radians = get_yaw(location.pose)
	rospy.loginfo("Yaw (Current Radians):" + str(current_radians))

	x_movement = math.cos(current_radians) * velocity
	rospy.loginfo("X Movement:  " +str(x_movement))
	y_movement = math.sin(current_radians) * velocity
	rospy.loginfo("Y Movement: " + str(y_movement))

	
	location.pose.position.x += x_movement
	location.pose.position.y += y_movement
	rospy.loginfo("Current Position (After Movement): " +str(location.pose))


	##############################################################################
		
	#current_radians = get_yaw(location.pose)

	#rospy.loginfo("\nCurrent Pose \n" + str(location.pose) + "\n")
	#rospy.loginfo("Current Radians: " + str(current_radians))

	new_target.x = path[path_progress][1]
	new_target.y = path[path_progress][2]
	new_target.z = 0
	rospy.loginfo("New Target: \n " + str(new_target))

	#new_target = Point(path.poses[path_progress + 3].pose.position.x) 
	current_location = location.pose.position
	#rospy.loginfo("Current Location: \n" + str(current_location) + " \n  New Target: \n" + str(new_target))
	target_radians = math.atan((new_target.y - current_location.y)/( new_target.x - current_location.x))
	rospy.loginfo("target_radians = " + str(target_radians))
		
	desired_yaw = target_radians
	quaternion = quaternion_from_euler(roll, pitch, desired_yaw)
	#type(pose) = geometry_msgs.msg.Pose
	location.pose.orientation.x = quaternion[0]
	location.pose.orientation.y = quaternion[1]
	location.pose.orientation.z = quaternion[2]
	location.pose.orientation.w = quaternion[3]
	rospy.loginfo("Orientation (Steered): " + str(location.pose.orientation))
	rospy.loginfo("END STEERING")
		

	#######################################################################

	#quaternion = quaternion_from_euler(roll, pitch, yaw)
	#type(pose) = geometry_msgs.msg.Pose
	#current_pose.orientation.x = quaternion[0]
	#current_pose.orientation.y = quaternion[1]
	#current_pose.orientation.z = quaternion[2]
	#current_pose.orientation.w = quaternion[3]

	#rospy.loginfo("Yaw: " + str(yaw))
	
	#current_radians = get_yaw(location.pose)

	#rospy.loginfo("Yaw: " + str(yaw))

	#current_degrees = np.degrees(current_radians)
		
	#new_target.x = path.poses[path_progress + 3].pose.position.x
	#new_target.y = path.poses[path_progress + 3].pose.position.y
	#new_target.z = path.poses[path_progress + 3].pose.position.z
	#new_target = Point(path.poses[path_progress + 3].pose.position.x) 
	#current_location = path.poses[path_progress].pose.position
	#target_radians = math.atan((new_target.y - current_location.y)/( new_target.y - current_location.y))	
		
	path_progress = path_progress + 1
	#figure out current location
	
	#rospy.loginfo("Pose into publisher: " + str(location.pose))


	header = Header(stamp = rospy.Time.now(), frame_id = "my_frame")

	publish_pose = PoseStamped(header = header, pose = location.pose)
	publish_heading_control.publish(publish_pose)
	publish_pose.header.frame_id = "my_frame"	
	publish_pose.header.seq = iteration + 1

	#PS = PoseStamped(header=header, pose=publish_pose)
	#PS.header.frame_id = "my_frame"

	#path_output.header = publish_pose.header
	rospy.loginfo("Pose to append: " + str(publish_pose))
	path_output.poses.append(publish_pose)
	publish_Autonomous_Path.publish(path_output)
	iteration += 1

if __name__ == '__main__':
	rospy.init_node('Auto_Drive', anonymous=True)
	time.sleep(2) #Give Path Head Start
	publish_heading_control = rospy.Publisher('/Heading_Control', PoseStamped, queue_size = 1)
	#follow_path(current_pose_stamped)
	sub = rospy.Subscriber('/Heading_Control', PoseStamped, follow_path)
	path_output.header.stamp = rospy.Time.now()
	publish_Autonomous_Path =  rospy.Publisher('/Autonomous_Path', Path, queue_size = 100)
	
	#printf(str(p))
	#while(iteration <= 17):
		#follow_path()
	rospy.spin()
	


