# CMake generated Testfile for 
# Source directory: /home/pi/ros_catkin_ws/src/ros/roslib
# Build directory: /home/pi/ros_catkin_ws/build/ros/roslib
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roslib_nosetests_test "/home/pi/ros_catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/src/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build/test_results/roslib/nosetests-test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/ros_catkin_ws/build/test_results/roslib" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/ros_catkin_ws/src/ros/roslib/test --with-xunit --xunit-file=/home/pi/ros_catkin_ws/build/test_results/roslib/nosetests-test.xml")
add_test(_ctest_roslib_gtest_roslib-utest "/home/pi/ros_catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/src/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build/test_results/roslib/gtest-roslib-utest.xml" "--working-dir" "/home/pi/ros_catkin_ws/src/ros/roslib" "--return-code" "/home/pi/ros_catkin_ws/devel/lib/roslib/roslib-utest --gtest_output=xml:/home/pi/ros_catkin_ws/build/test_results/roslib/gtest-roslib-utest.xml")
add_test(_ctest_roslib_gtest_roslib-test_package "/home/pi/ros_catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/src/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build/test_results/roslib/gtest-roslib-test_package.xml" "--return-code" "/home/pi/ros_catkin_ws/devel/lib/roslib/roslib-test_package --gtest_output=xml:/home/pi/ros_catkin_ws/build/test_results/roslib/gtest-roslib-test_package.xml")
