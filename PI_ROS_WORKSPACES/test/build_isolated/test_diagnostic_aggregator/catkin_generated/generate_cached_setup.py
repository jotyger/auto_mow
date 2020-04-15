# -*- coding: utf-8 -*-
from __future__ import print_function
import argparse
import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/home/pi/test/src/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/home/pi/test/src/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in "/home/pi/test/devel_isolated/test_bond;/home/pi/test/devel_isolated/self_test;/home/pi/test/devel_isolated/roswtf;/home/pi/test/devel_isolated/rostopic;/home/pi/test/devel_isolated/rosnode;/home/pi/test/devel_isolated/message_filters;/home/pi/test/devel_isolated/controller_manager;/home/pi/test/devel_isolated/controller_interface;/home/pi/test/devel_isolated/combined_robot_hw;/home/pi/test/devel_isolated/hardware_interface;/home/pi/test/devel_isolated/dynamic_reconfigure;/home/pi/test/devel_isolated/diagnostic_common_diagnostics;/home/pi/test/devel_isolated/diagnostic_updater;/home/pi/test/devel_isolated/diagnostic_aggregator;/home/pi/test/devel_isolated/rosout;/home/pi/test/devel_isolated/realtime_tools;/home/pi/test/devel_isolated/nodelet;/home/pi/test/devel_isolated/bondpy;/home/pi/test/devel_isolated/bondcpp;/home/pi/test/devel_isolated/roscpp;/home/pi/test/devel_isolated/xmlrpcpp;/home/pi/test/devel_isolated/visualization_msgs;/home/pi/test/devel_isolated/urdf_parser_plugin;/home/pi/test/devel_isolated/control_msgs;/home/pi/test/devel_isolated/trajectory_msgs;/home/pi/test/devel_isolated/tf2_eigen;/home/pi/test/devel_isolated/tf2_bullet;/home/pi/test/devel_isolated/tf2;/home/pi/test/devel_isolated/tf2_msgs;/home/pi/test/devel_isolated/std_srvs;/home/pi/test/devel_isolated/shape_msgs;/home/pi/test/devel_isolated/rosmsg;/home/pi/test/devel_isolated/rosgraph_msgs;/home/pi/test/devel_isolated/nav_msgs;/home/pi/test/devel_isolated/kdl_msgs;/home/pi/test/devel_isolated/kdl_conversions;/home/pi/test/devel_isolated/eigen_conversions;/home/pi/test/devel_isolated/geometry_msgs;/home/pi/test/devel_isolated/diagnostic_msgs;/home/pi/test/devel_isolated/controller_manager_msgs;/home/pi/test/devel_isolated/bond;/home/pi/test/devel_isolated/actionlib_msgs;/home/pi/test/devel_isolated/ackermann_msgs;/home/pi/test/devel_isolated/std_msgs;/home/pi/test/devel_isolated/smclib;/home/pi/test/devel_isolated/rqt_controller_manager;/home/pi/test/devel_isolated/rostest;/home/pi/test/devel_isolated/rosbag_storage;/home/pi/test/devel_isolated/roslz4;/home/pi/test/devel_isolated/rosconsole_bridge;/home/pi/test/devel_isolated/resource_retriever;/home/pi/test/devel_isolated/rosconsole;/home/pi/test/devel_isolated/angles;/home/pi/test/devel_isolated/rosunit;/home/pi/test/devel_isolated/rosservice;/home/pi/test/devel_isolated/rospy;/home/pi/test/devel_isolated/rosparam;/home/pi/test/devel_isolated/rosmaster;/home/pi/test/devel_isolated/rosmake;/home/pi/test/devel_isolated/roslint;/home/pi/test/devel_isolated/roslib;/home/pi/test/devel_isolated/roslaunch;/home/pi/test/devel_isolated/roslang;/home/pi/test/devel_isolated/rosgraph;/home/pi/test/devel_isolated/rosdiagnostic;/home/pi/test/devel_isolated/roscreate;/home/pi/test/devel_isolated/rosclean;/home/pi/test/devel_isolated/rosbuild;/home/pi/test/devel_isolated/rosboost_cfg;/home/pi/test/devel_isolated/rosbash;/home/pi/test/devel_isolated/ros_control;/home/pi/test/devel_isolated/ros_comm;/home/pi/test/devel_isolated/ros;/home/pi/test/devel_isolated/nodelet_core;/home/pi/test/devel_isolated/mk;/home/pi/test/devel_isolated/geometry2;/home/pi/test/devel_isolated/geometry;/home/pi/test/devel_isolated/gazebo_ros_pkgs;/home/pi/test/devel_isolated/gazebo_dev;/home/pi/test/devel_isolated/diff_sim;/home/pi/test/devel_isolated/diagnostics;/home/pi/test/devel_isolated/common_msgs;/home/pi/test/devel_isolated/bond_core;/home/pi/test/devel_isolated/actionlib_tools;/home/pi/test/devel_isolated/genpy;/home/pi/test/devel_isolated/gencpp;/home/pi/test/devel_isolated/catkin;/home/pi/rosbots_catkin_ws/devel;/home/pi/ros_catkin_ws/build/opt/ros/kinetic".split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/pi/test/devel_isolated/test_diagnostic_aggregator/env.sh')

output_filename = '/home/pi/test/build_isolated/test_diagnostic_aggregator/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
