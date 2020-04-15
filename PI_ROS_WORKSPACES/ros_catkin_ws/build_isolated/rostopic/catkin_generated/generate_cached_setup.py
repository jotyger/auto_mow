# -*- coding: utf-8 -*-
from __future__ import print_function
import argparse
import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/home/pi/ros_catkin_ws/build/opt/ros/kinetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/home/pi/ros_catkin_ws/build/opt/ros/kinetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in "/home/pi/ros_catkin_ws/devel_isolated/rosnode;/home/pi/ros_catkin_ws/devel_isolated/message_filters;/home/pi/ros_catkin_ws/devel_isolated/rosout;/home/pi/ros_catkin_ws/devel_isolated/roscpp;/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp;/home/pi/ros_catkin_ws/devel_isolated/vision_opencv;/home/pi/ros_catkin_ws/devel_isolated/teleop_twist_keyboard;/home/pi/ros_catkin_ws/devel_isolated/std_srvs;/home/pi/ros_catkin_ws/devel_isolated/rosmsg;/home/pi/ros_catkin_ws/devel_isolated/rosgraph_msgs;/home/pi/ros_catkin_ws/devel_isolated/geometry_msgs;/home/pi/ros_catkin_ws/devel_isolated/std_msgs;/home/pi/ros_catkin_ws/devel_isolated/rostest;/home/pi/ros_catkin_ws/devel_isolated/rosbag_storage;/home/pi/ros_catkin_ws/devel_isolated/roslz4;/home/pi/ros_catkin_ws/devel_isolated/pluginlib;/home/pi/ros_catkin_ws/devel_isolated/rosconsole;/home/pi/ros_catkin_ws/devel_isolated/rosunit;/home/pi/ros_catkin_ws/devel_isolated/roslaunch;/home/pi/ros_catkin_ws/devel_isolated/roscpp_serialization;/home/pi/ros_catkin_ws/devel_isolated/rostime;/home/pi/ros_catkin_ws/devel_isolated/rosservice;/home/pi/ros_catkin_ws/devel_isolated/rospy;/home/pi/ros_catkin_ws/devel_isolated/rosparam;/home/pi/ros_catkin_ws/devel_isolated/roslib;/home/pi/ros_catkin_ws/devel_isolated/rospack;/home/pi/ros_catkin_ws/devel_isolated/rosmaster;/home/pi/ros_catkin_ws/devel_isolated/rosmake;/home/pi/ros_catkin_ws/devel_isolated/roslisp;/home/pi/ros_catkin_ws/devel_isolated/roslang;/home/pi/ros_catkin_ws/devel_isolated/rosgraph;/home/pi/ros_catkin_ws/devel_isolated/roscreate;/home/pi/ros_catkin_ws/devel_isolated/roscpp_traits;/home/pi/ros_catkin_ws/devel_isolated/rosclean;/home/pi/ros_catkin_ws/devel_isolated/rosbuild;/home/pi/ros_catkin_ws/devel_isolated/rosboost_cfg;/home/pi/ros_catkin_ws/devel_isolated/rosbash;/home/pi/ros_catkin_ws/devel_isolated/ros_environment;/home/pi/ros_catkin_ws/devel_isolated/ros_comm;/home/pi/ros_catkin_ws/devel_isolated/ros;/home/pi/ros_catkin_ws/devel_isolated/opencv_tests;/home/pi/ros_catkin_ws/devel_isolated/mk;/home/pi/ros_catkin_ws/devel_isolated/message_runtime;/home/pi/ros_catkin_ws/devel_isolated/message_generation;/home/pi/ros_catkin_ws/devel_isolated/image_common;/home/pi/ros_catkin_ws/devel_isolated/cpp_common;/home/pi/ros_catkin_ws/devel_isolated/class_loader;/home/pi/ros_catkin_ws/devel_isolated/cmake_modules;/home/pi/ros_catkin_ws/devel_isolated/genpy;/home/pi/ros_catkin_ws/devel_isolated/gennodejs;/home/pi/ros_catkin_ws/devel_isolated/genlisp;/home/pi/ros_catkin_ws/devel_isolated/geneus;/home/pi/ros_catkin_ws/devel_isolated/gencpp;/home/pi/ros_catkin_ws/devel_isolated/genmsg;/home/pi/ros_catkin_ws/devel_isolated/catkin;/home/pi/rosbots_catkin_ws/devel;/home/pi/ros_catkin_ws/build/opt/ros/kinetic".split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/pi/ros_catkin_ws/devel_isolated/rostopic/env.sh')

output_filename = '/home/pi/ros_catkin_ws/build_isolated/rostopic/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
