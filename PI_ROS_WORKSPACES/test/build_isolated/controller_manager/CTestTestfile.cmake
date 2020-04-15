# CMake generated Testfile for 
# Source directory: /home/pi/test/src/ros_control/controller_manager
# Build directory: /home/pi/test/build_isolated/controller_manager
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_controller_manager_rostest_test_hwi_switch_test.test "/home/pi/test/build_isolated/controller_manager/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/controller_manager/test_results/controller_manager/rostest-test_hwi_switch_test.xml" "--return-code" "/home/pi/test/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/pi/test/src/ros_control/controller_manager --package=controller_manager --results-filename test_hwi_switch_test.xml --results-base-dir \"/home/pi/test/build_isolated/controller_manager/test_results\" /home/pi/test/src/ros_control/controller_manager/test/hwi_switch_test.test ")
subdirs("gtest")
