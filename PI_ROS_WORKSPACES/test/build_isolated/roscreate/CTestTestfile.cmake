# CMake generated Testfile for 
# Source directory: /home/pi/test/src/ros/roscreate
# Build directory: /home/pi/test/build_isolated/roscreate
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roscreate_nosetests_test "/home/pi/test/build_isolated/roscreate/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/roscreate/test_results/roscreate/nosetests-test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/roscreate/test_results/roscreate" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/test/src/ros/roscreate/test --with-xunit --xunit-file=/home/pi/test/build_isolated/roscreate/test_results/roscreate/nosetests-test.xml")
subdirs("gtest")
