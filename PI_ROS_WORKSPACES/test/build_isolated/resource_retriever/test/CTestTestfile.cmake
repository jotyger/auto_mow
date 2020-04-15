# CMake generated Testfile for 
# Source directory: /home/pi/test/src/resource_retriever/test
# Build directory: /home/pi/test/build_isolated/resource_retriever/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_resource_retriever_gtest_resource_retriever_utest "/home/pi/test/build_isolated/resource_retriever/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever/gtest-resource_retriever_utest.xml" "--return-code" "/home/pi/test/devel_isolated/resource_retriever/lib/resource_retriever/resource_retriever_utest --gtest_output=xml:/home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever/gtest-resource_retriever_utest.xml")
add_test(_ctest_resource_retriever_nosetests_test.py "/home/pi/test/build_isolated/resource_retriever/catkin_generated/env_cached.sh" "/usr/bin/python" "/home/pi/test/src/catkin/cmake/test/run_tests.py" "/home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever/nosetests-test.py.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever" "/usr/bin/nosetests-2.7 -P --process-timeout=60 /home/pi/test/src/resource_retriever/test/test.py --with-xunit --xunit-file=/home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever/nosetests-test.py.xml")
