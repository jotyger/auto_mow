# CMake generated Testfile for 
# Source directory: /home/pi/test/src/diagnostics/diagnostic_updater
# Build directory: /home/pi/test/build_isolated/diagnostic_updater
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_diagnostic_updater_rostest_test_diagnostic_updater_test.xml "/home/pi/test/build_isolated/diagnostic_updater/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/diagnostic_updater/test_results/diagnostic_updater/rostest-test_diagnostic_updater_test.xml" "--return-code" "/home/pi/test/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/pi/test/src/diagnostics/diagnostic_updater --package=diagnostic_updater --results-filename test_diagnostic_updater_test.xml --results-base-dir \"/home/pi/test/build_isolated/diagnostic_updater/test_results\" /home/pi/test/src/diagnostics/diagnostic_updater/test/diagnostic_updater_test.xml ")
add_test(_ctest_diagnostic_updater_rostest_test_diagnostic_updater_fast_test.xml "/home/pi/test/build_isolated/diagnostic_updater/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/diagnostic_updater/test_results/diagnostic_updater/rostest-test_diagnostic_updater_fast_test.xml" "--return-code" "/home/pi/test/src/ros_comm/rostest/scripts/rostest --pkgdir=/home/pi/test/src/diagnostics/diagnostic_updater --package=diagnostic_updater --results-filename test_diagnostic_updater_fast_test.xml --results-base-dir \"/home/pi/test/build_isolated/diagnostic_updater/test_results\" /home/pi/test/src/diagnostics/diagnostic_updater/test/diagnostic_updater_fast_test.xml ")
subdirs("gtest")
