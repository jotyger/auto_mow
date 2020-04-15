# CMake generated Testfile for 
# Source directory: /home/pi/test/src/ros_comm/roslaunch
# Build directory: /home/pi/test/build_isolated/roslaunch
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roslaunch_nosetests_test.unit "/home/pi/test/build_isolated/roslaunch/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/roslaunch/test_results/roslaunch/nosetests-test.unit.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/roslaunch/test_results/roslaunch" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/test/src/ros_comm/roslaunch/test/unit --with-xunit --xunit-file=/home/pi/test/build_isolated/roslaunch/test_results/roslaunch/nosetests-test.unit.xml")
subdirs("gtest")
