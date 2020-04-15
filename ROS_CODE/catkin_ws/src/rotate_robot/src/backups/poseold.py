#!/usr/bin/env python
import rospy
import time
import math
import geometry_msgs 
import numpy as np
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped, Pose, Point
from nav_msgs.msg import Path

path_progress = 0
current_pose = Pose()
iteration = 0
path_output = Path()
velocity = .02

def get_yaw(msg):   #radians
    global roll, pitch, yaw
    orientation_q = msg.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
    return yaw

#def find

def drive(path):
	global path_progress
	global current_pose
	global iteration
	global path_output
	new_target = Point()

	rospy.loginfo("Self Driving Iteration: " + str(iteration))

	if (iteration == 0):

		current_radians = get_yaw(current_pose)

		rospy.loginfo("\nCurrent Pose \n" + str(current_pose) + "\n")
		rospy.loginfo("Current Radians: " + str(current_radians))

		new_target.x = path.poses[path_progress + 3].pose.position.x
		new_target.y = path.poses[path_progress + 3].pose.position.y
		new_target.z = path.poses[path_progress + 3].pose.position.z
		rospy.loginfo("New Target: \n " + str(new_target))

		
		#new_target = Point(path.poses[path_progress + 3].pose.position.x) 
		current_location = path.poses[path_progress].pose.position
		rospy.loginfo("Current Location: \n" + str(current_location) + " \n  New Target: \n" + str(new_target))

		target_radians = math.atan((new_target.y - current_location.y)/( new_target.x - current_location.x))
		rospy.loginfo("target_radians = " + str(target_radians))
		
		desired_yaw = target_radians
		quaternion = quaternion_from_euler(roll, pitch, desired_yaw)
		#type(pose) = geometry_msgs.msg.Pose
		current_pose.orientation.x = quaternion[0]
		current_pose.orientation.y = quaternion[1]
		current_pose.orientation.z = quaternion[2]
		current_pose.orientation.w = quaternion[3]
		rospy.loginfo("Current Pose: " + str(current_pose))
		rospy.loginfo("END ITERATION 0")

	else:
		
		current_radians = get_yaw(current_pose)
		rospy.loginfo("Yaw: " + str(current_radians))

		y_movement = math.sin(current_radians) * velocity
		rospy.loginfo("Y Movement: " + str(y_movement))
		x_movement = math.cos(current_radians) * velocity
		rospy.loginfo("X Movement:  " +str(x_movement))
		
		current_pose.position.x += x_movement
		current_pose.position.y += y_movement
		rospy.loginfo("Current Position: " +str(current_pose))


		##############################################################################
		
		current_radians = get_yaw(current_pose)

		rospy.loginfo("\nCurrent Pose \n" + str(current_pose) + "\n")
		rospy.loginfo("Current Radians: " + str(current_radians))

		new_target.x = path.poses[path_progress + 3].pose.position.x
		new_target.y = path.poses[path_progress + 3].pose.position.y
		new_target.z = path.poses[path_progress + 3].pose.position.z
		rospy.loginfo("New Target: \n " + str(new_target))

		
		#new_target = Point(path.poses[path_progress + 3].pose.position.x) 
		current_location = path.poses[path_progress].pose.position
		rospy.loginfo("Current Location: \n" + str(current_location) + " \n  New Target: \n" + str(new_target))

		target_radians = math.atan((new_target.y - current_location.y)/( new_target.x - current_location.x))
		rospy.loginfo("target_radians = " + str(target_radians))
		
		desired_yaw = target_radians
		quaternion = quaternion_from_euler(roll, pitch, desired_yaw)
		#type(pose) = geometry_msgs.msg.Pose
		current_pose.orientation.x = quaternion[0]
		current_pose.orientation.y = quaternion[1]
		current_pose.orientation.z = quaternion[2]
		current_pose.orientation.w = quaternion[3]
		rospy.loginfo("Current Pose: " + str(current_pose))
		rospy.loginfo("END STEERING")
		

		#######################################################################

		#quaternion = quaternion_from_euler(roll, pitch, yaw)
		#type(pose) = geometry_msgs.msg.Pose
		#current_pose.orientation.x = quaternion[0]
		#current_pose.orientation.y = quaternion[1]
		#current_pose.orientation.z = quaternion[2]
		#current_pose.orientation.w = quaternion[3]

		#rospy.loginfo("Yaw: " + str(yaw))
	
		#current_radians = get_yaw(current_pose)

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
		
		rospy.loginfo("Pose into publisher: " + str(current_pose))

		publish_pose = PoseStamped(header = path.poses[path_progress].header, pose = current_pose)
		#publish_heading_control.publish(publish_pose)

		PS = PoseStamped(header=path.header, pose=publish_pose)
    		PS.header.frame_id = "my_frame"

		path_output.poses.append(PS)
		publish_Autonomous_Path.publish(path)

	iteration += 1

if __name__ == '__main__':
	rospy.init_node('Auto_Drive', anonymous=True)
	time.sleep(2) #Give Path Head Start
	rospy.Subscriber("path2",Path,drive, queue_size =1)
	publish_heading_control = rospy.Publisher('/Heading_Control', PoseStamped, queue_size = 1)
	publish_Autonomous_Path =  rospy.Publisher('/Autonomus_Path', Path, queue_size = 1)
	rospy.spin()


