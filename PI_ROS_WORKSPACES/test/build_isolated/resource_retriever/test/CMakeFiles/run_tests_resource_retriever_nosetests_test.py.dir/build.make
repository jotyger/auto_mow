# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/test/src/resource_retriever

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/test/build_isolated/resource_retriever

# Utility rule file for run_tests_resource_retriever_nosetests_test.py.

# Include the progress variables for this target.
include test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/progress.make

test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py:
	cd /home/pi/test/build_isolated/resource_retriever/test && ../catkin_generated/env_cached.sh /usr/bin/python /home/pi/test/src/catkin/cmake/test/run_tests.py /home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever/nosetests-test.py.xml "/usr/bin/cmake -E make_directory /home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever" "/usr/bin/nosetests-2.7 -P --process-timeout=60 /home/pi/test/src/resource_retriever/test/test.py --with-xunit --xunit-file=/home/pi/test/build_isolated/resource_retriever/test_results/resource_retriever/nosetests-test.py.xml"

run_tests_resource_retriever_nosetests_test.py: test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py
run_tests_resource_retriever_nosetests_test.py: test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/build.make

.PHONY : run_tests_resource_retriever_nosetests_test.py

# Rule to build all files generated by this target.
test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/build: run_tests_resource_retriever_nosetests_test.py

.PHONY : test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/build

test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/clean:
	cd /home/pi/test/build_isolated/resource_retriever/test && $(CMAKE_COMMAND) -P CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/clean

test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/depend:
	cd /home/pi/test/build_isolated/resource_retriever && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/test/src/resource_retriever /home/pi/test/src/resource_retriever/test /home/pi/test/build_isolated/resource_retriever /home/pi/test/build_isolated/resource_retriever/test /home/pi/test/build_isolated/resource_retriever/test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/run_tests_resource_retriever_nosetests_test.py.dir/depend
