cmake_minimum_required(VERSION 2.8.3)
project(dnn_rotate)

## Find catkin macros and libraries
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS rospy move_base_msgs
             message_generation std_msgs)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


################################################
## Declare ROS messages, services and actions ##
################################################

## Generate services in the 'srv' folder
add_service_files(
  FILES
  StringTrigger.srv
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  INCLUDE_DIRS
  LIBRARIES
  CATKIN_DEPENDS dnn_detect
)


###########
## Build ##
###########

#############
## Install ##
#############


#############
## Testing ##
#############

