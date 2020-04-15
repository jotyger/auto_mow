# CMake generated Testfile for 
# Source directory: /home/pi/ros_catkin_ws/src/pluginlib
# Build directory: /home/pi/ros_catkin_ws/build_isolated/pluginlib
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_pluginlib_gtest_pluginlib_utest "/home/pi/ros_catkin_ws/build_isolated/pluginlib/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/build/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build_isolated/pluginlib/test_results/pluginlib/gtest-pluginlib_utest.xml" "--return-code" "/home/pi/ros_catkin_ws/devel_isolated/pluginlib/lib/pluginlib/pluginlib_utest --gtest_output=xml:/home/pi/ros_catkin_ws/build_isolated/pluginlib/test_results/pluginlib/gtest-pluginlib_utest.xml")
add_test(_ctest_pluginlib_gtest_pluginlib_unique_ptr_test "/home/pi/ros_catkin_ws/build_isolated/pluginlib/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/build/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build_isolated/pluginlib/test_results/pluginlib/gtest-pluginlib_unique_ptr_test.xml" "--return-code" "/home/pi/ros_catkin_ws/devel_isolated/pluginlib/lib/pluginlib/pluginlib_unique_ptr_test --gtest_output=xml:/home/pi/ros_catkin_ws/build_isolated/pluginlib/test_results/pluginlib/gtest-pluginlib_unique_ptr_test.xml")
subdirs("gtest")
