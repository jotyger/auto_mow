# CMake generated Testfile for 
# Source directory: /home/pi/ros_catkin_ws/src/ros_comm/roswtf
# Build directory: /home/pi/ros_catkin_ws/build/ros_comm/roswtf
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roswtf_rostest_test_roswtf.test "/home/pi/ros_catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/src/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build/test_results/roswtf/rostest-test_roswtf.xml" "--return-code" "/home/pi/ros_catkin_ws/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/pi/ros_catkin_ws/src/ros_comm/roswtf --package=roswtf --results-filename test_roswtf.xml --results-base-dir \"/home/pi/ros_catkin_ws/build/test_results\" /home/pi/ros_catkin_ws/src/ros_comm/roswtf/test/roswtf.test ")
add_test(_ctest_roswtf_nosetests_test "/home/pi/ros_catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/ros_catkin_ws/src/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build/test_results/roswtf/nosetests-test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/ros_catkin_ws/build/test_results/roswtf" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/ros_catkin_ws/src/ros_comm/roswtf/test --with-xunit --xunit-file=/home/pi/ros_catkin_ws/build/test_results/roswtf/nosetests-test.xml")
