#!/usr/bin/env sh
# generated from catkin.builder module

# remember type of shell if not already set
if [ -z "$CATKIN_SHELL" ]; then
  CATKIN_SHELL=sh
fi
. "/home/pi/test/devel_isolated/nodelet_core/setup.$CATKIN_SHELL"

# detect if running on Darwin platform
_UNAME=`uname -s`
IS_DARWIN=0
if [ "$_UNAME" = "Darwin" ]; then
  IS_DARWIN=1
fi

# Prepend to the environment
export CMAKE_PREFIX_PATH="/home/pi/test/devel_isolated/orocos_kdl:$CMAKE_PREFIX_PATH"
if [ $IS_DARWIN -eq 0 ]; then
  export LD_LIBRARY_PATH="/home/pi/test/devel_isolated/orocos_kdl/lib:/home/pi/test/devel_isolated/orocos_kdl/lib/arm-linux-gnueabihf:$LD_LIBRARY_PATH"
else
  export DYLD_LIBRARY_PATH="/home/pi/test/devel_isolated/orocos_kdl/lib:/home/pi/test/devel_isolated/orocos_kdl/lib/arm-linux-gnueabihf:$DYLD_LIBRARY_PATH"
fi
export PATH="/home/pi/test/devel_isolated/orocos_kdl/bin:$PATH"
export PKG_CONFIG_PATH="/home/pi/test/devel_isolated/orocos_kdl/lib/pkgconfig:/home/pi/test/devel_isolated/orocos_kdl/lib/arm-linux-gnueabihf/pkgconfig:$PKG_CONFIG_PATH"
export PYTHONPATH="/home/pi/test/devel_isolated/orocos_kdl/lib/python2.7/dist-packages:$PYTHONPATH"
