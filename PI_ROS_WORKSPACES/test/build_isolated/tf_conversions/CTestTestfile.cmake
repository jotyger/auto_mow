# CMake generated Testfile for 
# Source directory: /home/pi/test/src/geometry/tf_conversions
# Build directory: /home/pi/test/build_isolated/tf_conversions
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_tf_conversions_gtest_test_eigen_tf "/home/pi/test/build_isolated/tf_conversions/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions/gtest-test_eigen_tf.xml" "--return-code" "/home/pi/test/devel_isolated/tf_conversions/lib/tf_conversions/test_eigen_tf --gtest_output=xml:/home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions/gtest-test_eigen_tf.xml")
add_test(_ctest_tf_conversions_gtest_test_kdl_tf "/home/pi/test/build_isolated/tf_conversions/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions/gtest-test_kdl_tf.xml" "--return-code" "/home/pi/test/devel_isolated/tf_conversions/lib/tf_conversions/test_kdl_tf --gtest_output=xml:/home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions/gtest-test_kdl_tf.xml")
add_test(_ctest_tf_conversions_nosetests_test.posemath.py "/home/pi/test/build_isolated/tf_conversions/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions/nosetests-test.posemath.py.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions" "/usr/bin/nosetests-2.7 -P --process-timeout=60 /home/pi/test/src/geometry/tf_conversions/test/posemath.py --with-xunit --xunit-file=/home/pi/test/build_isolated/tf_conversions/test_results/tf_conversions/nosetests-test.posemath.py.xml")
subdirs("gtest")
