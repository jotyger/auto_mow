# CMake generated Testfile for 
# Source directory: /home/pi/test/src/ros/rosunit
# Build directory: /home/pi/test/build_isolated/rosunit
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rosunit_nosetests_test "/home/pi/test/build_isolated/rosunit/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/rosunit/test_results/rosunit/nosetests-test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/rosunit/test_results/rosunit" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/test/src/ros/rosunit/test --with-xunit --xunit-file=/home/pi/test/build_isolated/rosunit/test_results/rosunit/nosetests-test.xml")
subdirs("gtest")