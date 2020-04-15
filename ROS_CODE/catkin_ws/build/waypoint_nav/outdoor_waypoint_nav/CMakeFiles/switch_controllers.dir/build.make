# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/ubuntu/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/catkin_ws/build

# Include any dependencies generated for this target.
include waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/depend.make

# Include the progress variables for this target.
include waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/progress.make

# Include the compile flags for this target's objects.
include waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/flags.make

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/flags.make
waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o: /home/ubuntu/catkin_ws/src/waypoint_nav/outdoor_waypoint_nav/src/switch_controllers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o"
	cd /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o -c /home/ubuntu/catkin_ws/src/waypoint_nav/outdoor_waypoint_nav/src/switch_controllers.cpp

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.i"
	cd /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/src/waypoint_nav/outdoor_waypoint_nav/src/switch_controllers.cpp > CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.i

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.s"
	cd /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/src/waypoint_nav/outdoor_waypoint_nav/src/switch_controllers.cpp -o CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.s

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.requires:

.PHONY : waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.requires

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.provides: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.requires
	$(MAKE) -f waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/build.make waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.provides.build
.PHONY : waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.provides

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.provides.build: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o


# Object files for target switch_controllers
switch_controllers_OBJECTS = \
"CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o"

# External object files for target switch_controllers
switch_controllers_EXTERNAL_OBJECTS =

/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/build.make
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libtf.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libtf2_ros.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libactionlib.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libmessage_filters.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libroscpp.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_signals.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libtf2.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/librosconsole.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/librostime.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libcpp_common.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/libroslib.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /opt/ros/kinetic/lib/librospack.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libpython2.7.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: /usr/lib/arm-linux-gnueabihf/libtinyxml.so
/home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers"
	cd /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/switch_controllers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/build: /home/ubuntu/catkin_ws/devel/lib/outdoor_waypoint_nav/switch_controllers

.PHONY : waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/build

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/requires: waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/src/switch_controllers.cpp.o.requires

.PHONY : waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/requires

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/clean:
	cd /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav && $(CMAKE_COMMAND) -P CMakeFiles/switch_controllers.dir/cmake_clean.cmake
.PHONY : waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/clean

waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/depend:
	cd /home/ubuntu/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/src /home/ubuntu/catkin_ws/src/waypoint_nav/outdoor_waypoint_nav /home/ubuntu/catkin_ws/build /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav /home/ubuntu/catkin_ws/build/waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : waypoint_nav/outdoor_waypoint_nav/CMakeFiles/switch_controllers.dir/depend

