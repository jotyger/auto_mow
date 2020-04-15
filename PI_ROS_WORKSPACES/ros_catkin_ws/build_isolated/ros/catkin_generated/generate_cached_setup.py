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
    for workspace in "/home/pi/ros_catkin_ws/devel_isolated/opencv_tests;/home/pi/ros_catkin_ws/devel_isolated/mk;/home/pi/ros_catkin_ws/devel_isolated/message_runtime;/home/pi/ros_catkin_ws/devel_isolated/message_generation;/home/pi/ros_catkin_ws/devel_isolated/image_common;/home/pi/ros_catkin_ws/devel_isolated/cpp_common;/home/pi/ros_catkin_ws/devel_isolated/class_loader;/home/pi/ros_catkin_ws/devel_isolated/cmake_modules;/home/pi/ros_catkin_ws/devel_isolated/genpy;/home/pi/ros_catkin_ws/devel_isolated/gennodejs;/home/pi/ros_catkin_ws/devel_isolated/genlisp;/home/pi/ros_catkin_ws/devel_isolated/geneus;/home/pi/ros_catkin_ws/devel_isolated/gencpp;/home/pi/ros_catkin_ws/devel_isolated/genmsg;/home/pi/ros_catkin_ws/devel_isolated/catkin;/home/pi/rosbots_catkin_ws/devel;/home/pi/ros_catkin_ws/build/opt/ros/kinetic".split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/pi/ros_catkin_ws/devel_isolated/ros/env.sh')

output_filename = '/home/pi/ros_catkin_ws/build_isolated/ros/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
