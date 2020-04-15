# CMake generated Testfile for 
# Source directory: /home/pi/test/src/ros_comm/roswtf
# Build directory: /home/pi/test/build_isolated/roswtf
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roswtf_rostest_test_roswtf.test "/home/pi/test/build_isolated/roswtf/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/roswtf/test_results/roswtf/rostest-test_roswtf.xml" "--return-code" "/home/pi/test/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/pi/test/src/ros_comm/roswtf --package=roswtf --results-filename test_roswtf.xml --results-base-dir \"/home/pi/test/build_isolated/roswtf/test_results\" /home/pi/test/src/ros_comm/roswtf/test/roswtf.test ")
add_test(_ctest_roswtf_nosetests_test "/home/pi/test/build_isolated/roswtf/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/roswtf/test_results/roswtf/nosetests-test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/roswtf/test_results/roswtf" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/test/src/ros_comm/roswtf/test --with-xunit --xunit-file=/home/pi/test/build_isolated/roswtf/test_results/roswtf/nosetests-test.xml")
subdirs("gtest")
