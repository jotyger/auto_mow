# CMake generated Testfile for 
# Source directory: /home/pi/test/src/geometry2/tf2_bullet
# Build directory: /home/pi/test/build_isolated/tf2_bullet
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_tf2_bullet_gtest_test_bullet "/home/pi/test/build_isolated/tf2_bullet/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/tf2_bullet/test_results/tf2_bullet/gtest-test_bullet.xml" "--return-code" "/home/pi/test/devel_isolated/tf2_bullet/lib/tf2_bullet/test_bullet --gtest_output=xml:/home/pi/test/build_isolated/tf2_bullet/test_results/tf2_bullet/gtest-test_bullet.xml")
subdirs("gtest")
