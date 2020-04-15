# CMake generated Testfile for 
# Source directory: /home/pi/ros_catkin_ws/src/roscpp_core/rostime
# Build directory: /home/pi/ros_catkin_ws/build_isolated/rostime
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rostime_gtest_rostime-test_duration "/home/pi/ros_catkin_ws/build_isolated/rostime/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/build/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build_isolated/rostime/test_results/rostime/gtest-rostime-test_duration.xml" "--return-code" "/home/pi/ros_catkin_ws/devel_isolated/rostime/lib/rostime/rostime-test_duration --gtest_output=xml:/home/pi/ros_catkin_ws/build_isolated/rostime/test_results/rostime/gtest-rostime-test_duration.xml")
add_test(_ctest_rostime_gtest_rostime-test_time "/home/pi/ros_catkin_ws/build_isolated/rostime/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/build/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build_isolated/rostime/test_results/rostime/gtest-rostime-test_time.xml" "--return-code" "/home/pi/ros_catkin_ws/devel_isolated/rostime/lib/rostime/rostime-test_time --gtest_output=xml:/home/pi/ros_catkin_ws/build_isolated/rostime/test_results/rostime/gtest-rostime-test_time.xml")
subdirs("gtest")
