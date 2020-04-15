# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "actionlib;actionlib_msgs;geometry_msgs;move_base_msgs;roscpp;std_msgs;rospy;tf".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lturtlebot_lawn_mower;-lLawnMower".split(';') if "-lturtlebot_lawn_mower;-lLawnMower" != "" else []
PROJECT_NAME = "turtlebot_lawn_mower"
PROJECT_SPACE_DIR = "/home/ubuntu/catkin_ws/install"
PROJECT_VERSION = "0.0.0"
