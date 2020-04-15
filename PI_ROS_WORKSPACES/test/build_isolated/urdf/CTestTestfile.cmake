# CMake generated Testfile for 
# Source directory: /home/pi/test/src/urdf/urdf
# Build directory: /home/pi/test/build_isolated/urdf
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_urdf_rostest_test_test_robot_model_parser.launch "/home/pi/test/build_isolated/urdf/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/urdf/test_results/urdf/rostest-test_test_robot_model_parser.xml" "--return-code" "/home/pi/test/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/pi/test/src/urdf/urdf --package=urdf --results-filename test_test_robot_model_parser.xml --results-base-dir \"/home/pi/test/build_isolated/urdf/test_results\" /home/pi/test/src/urdf/urdf/test/test_robot_model_parser.launch ")
add_test(_ctest_urdf_gtest_urdfdom_compatibility_test "/home/pi/test/build_isolated/urdf/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/urdf/test_results/urdf/gtest-urdfdom_compatibility_test.xml" "--return-code" "/home/pi/test/devel_isolated/urdf/lib/urdf/urdfdom_compatibility_test --gtest_output=xml:/home/pi/test/build_isolated/urdf/test_results/urdf/gtest-urdfdom_compatibility_test.xml")
subdirs("gtest")
