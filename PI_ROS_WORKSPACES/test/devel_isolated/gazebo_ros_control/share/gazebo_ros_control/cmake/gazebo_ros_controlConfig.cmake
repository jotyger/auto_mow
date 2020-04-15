# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(gazebo_ros_control_CONFIG_INCLUDED)
  return()
endif()
set(gazebo_ros_control_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(gazebo_ros_control_SOURCE_PREFIX /home/pi/test/src/gazebo_ros_pkgs/gazebo_ros_control)
  set(gazebo_ros_control_DEVEL_PREFIX /home/pi/test/devel_isolated/gazebo_ros_control)
  set(gazebo_ros_control_INSTALL_PREFIX "")
  set(gazebo_ros_control_PREFIX ${gazebo_ros_control_DEVEL_PREFIX})
else()
  set(gazebo_ros_control_SOURCE_PREFIX "")
  set(gazebo_ros_control_DEVEL_PREFIX "")
  set(gazebo_ros_control_INSTALL_PREFIX /home/pi/test/install_isolated)
  set(gazebo_ros_control_PREFIX ${gazebo_ros_control_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'gazebo_ros_control' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(gazebo_ros_control_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/pi/test/src/gazebo_ros_pkgs/gazebo_ros_control/include " STREQUAL " ")
  set(gazebo_ros_control_INCLUDE_DIRS "")
  set(_include_dirs "/home/pi/test/src/gazebo_ros_pkgs/gazebo_ros_control/include")
  if(NOT "https://github.com/ros-simulation/gazebo_ros_pkgs/issues " STREQUAL " ")
    set(_report "Check the issue tracker 'https://github.com/ros-simulation/gazebo_ros_pkgs/issues' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://ros.org/wiki/gazebo_ros_control " STREQUAL " ")
    set(_report "Check the website 'http://ros.org/wiki/gazebo_ros_control' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Jose Luis Rivero <jrivero@osrfoundation.org>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${gazebo_ros_control_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'gazebo_ros_control' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'gazebo_ros_control' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/pi/test/src/gazebo_ros_pkgs/gazebo_ros_control/${idir}'.  ${_report}")
    endif()
    _list_append_unique(gazebo_ros_control_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "gazebo_ros_control;default_robot_hw_sim")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND gazebo_ros_control_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND gazebo_ros_control_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND gazebo_ros_control_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/pi/test/devel_isolated/gazebo_ros_control/lib;/home/pi/test/devel_isolated/joint_limits_interface/lib;/home/pi/test/devel_isolated/gazebo_plugins/lib;/home/pi/test/devel_isolated/urdf/lib;/home/pi/test/devel_isolated/transmission_interface/lib;/home/pi/test/devel_isolated/tf_conversions/lib;/home/pi/test/devel_isolated/tf2_tools/lib;/home/pi/test/devel_isolated/tf2_sensor_msgs/lib;/home/pi/test/devel_isolated/tf2_kdl/lib;/home/pi/test/devel_isolated/tf2_geometry_msgs/lib;/home/pi/test/devel_isolated/gazebo_ros/lib;/home/pi/test/devel_isolated/tf/lib;/home/pi/test/devel_isolated/pure_pursuit/lib;/home/pi/test/devel_isolated/tf2_ros/lib;/home/pi/test/devel_isolated/test_nodelet_topic_tools/lib;/home/pi/test/devel_isolated/stereo_msgs/lib;/home/pi/test/devel_isolated/gazebo_msgs/lib;/home/pi/test/devel_isolated/sensor_msgs/lib;/home/pi/test/devel_isolated/nodelet_topic_tools/lib;/home/pi/test/devel_isolated/diagnostic_analysis/lib;/home/pi/test/devel_isolated/combined_robot_hw_tests/lib;/home/pi/test/devel_isolated/controller_manager_tests/lib;/home/pi/test/devel_isolated/control_toolbox/lib;/home/pi/test/devel_isolated/actionlib/lib;/home/pi/test/devel_isolated/rosbag/lib;/home/pi/test/devel_isolated/topic_tools/lib;/home/pi/test/devel_isolated/tf2_py/lib;/home/pi/test/devel_isolated/test_nodelet/lib;/home/pi/test/devel_isolated/test_diagnostic_aggregator/lib;/home/pi/test/devel_isolated/test_bond/lib;/home/pi/test/devel_isolated/self_test/lib;/home/pi/test/devel_isolated/roswtf/lib;/home/pi/test/devel_isolated/rostopic/lib;/home/pi/test/devel_isolated/rosnode/lib;/home/pi/test/devel_isolated/message_filters/lib;/home/pi/test/devel_isolated/controller_manager/lib;/home/pi/test/devel_isolated/controller_interface/lib;/home/pi/test/devel_isolated/combined_robot_hw/lib;/home/pi/test/devel_isolated/hardware_interface/lib;/home/pi/test/devel_isolated/dynamic_reconfigure/lib;/home/pi/test/devel_isolated/diagnostic_common_diagnostics/lib;/home/pi/test/devel_isolated/diagnostic_updater/lib;/home/pi/test/devel_isolated/diagnostic_aggregator/lib;/home/pi/test/devel_isolated/rosout/lib;/home/pi/test/devel_isolated/realtime_tools/lib;/home/pi/test/devel_isolated/nodelet/lib;/home/pi/test/devel_isolated/bondpy/lib;/home/pi/test/devel_isolated/bondcpp/lib;/home/pi/test/devel_isolated/roscpp/lib;/home/pi/test/devel_isolated/xmlrpcpp/lib;/home/pi/test/devel_isolated/visualization_msgs/lib;/home/pi/test/devel_isolated/urdf_parser_plugin/lib;/home/pi/test/devel_isolated/control_msgs/lib;/home/pi/test/devel_isolated/trajectory_msgs/lib;/home/pi/test/devel_isolated/tf2_eigen/lib;/home/pi/test/devel_isolated/tf2_bullet/lib;/home/pi/test/devel_isolated/tf2/lib;/home/pi/test/devel_isolated/tf2_msgs/lib;/home/pi/test/devel_isolated/std_srvs/lib;/home/pi/test/devel_isolated/shape_msgs/lib;/home/pi/test/devel_isolated/rosmsg/lib;/home/pi/test/devel_isolated/rosgraph_msgs/lib;/home/pi/test/devel_isolated/nav_msgs/lib;/home/pi/test/devel_isolated/kdl_msgs/lib;/home/pi/test/devel_isolated/kdl_conversions/lib;/home/pi/test/devel_isolated/eigen_conversions/lib;/home/pi/test/devel_isolated/geometry_msgs/lib;/home/pi/test/devel_isolated/diagnostic_msgs/lib;/home/pi/test/devel_isolated/controller_manager_msgs/lib;/home/pi/test/devel_isolated/bond/lib;/home/pi/test/devel_isolated/actionlib_msgs/lib;/home/pi/test/devel_isolated/ackermann_msgs/lib;/home/pi/test/devel_isolated/std_msgs/lib;/home/pi/test/devel_isolated/smclib/lib;/home/pi/test/devel_isolated/rqt_controller_manager/lib;/home/pi/test/devel_isolated/rostest/lib;/home/pi/test/devel_isolated/rosbag_storage/lib;/home/pi/test/devel_isolated/roslz4/lib;/home/pi/test/devel_isolated/rosconsole_bridge/lib;/home/pi/test/devel_isolated/resource_retriever/lib;/home/pi/test/devel_isolated/rosconsole/lib;/home/pi/test/devel_isolated/angles/lib;/home/pi/test/devel_isolated/rosunit/lib;/home/pi/test/devel_isolated/rosservice/lib;/home/pi/test/devel_isolated/rospy/lib;/home/pi/test/devel_isolated/rosparam/lib;/home/pi/test/devel_isolated/rosmaster/lib;/home/pi/test/devel_isolated/rosmake/lib;/home/pi/test/devel_isolated/roslint/lib;/home/pi/test/devel_isolated/roslib/lib;/home/pi/test/devel_isolated/roslaunch/lib;/home/pi/test/devel_isolated/roslang/lib;/home/pi/test/devel_isolated/rosgraph/lib;/home/pi/test/devel_isolated/rosdiagnostic/lib;/home/pi/test/devel_isolated/roscreate/lib;/home/pi/test/devel_isolated/rosclean/lib;/home/pi/test/devel_isolated/rosbuild/lib;/home/pi/test/devel_isolated/rosboost_cfg/lib;/home/pi/test/devel_isolated/rosbash/lib;/home/pi/test/devel_isolated/ros_control/lib;/home/pi/test/devel_isolated/ros_comm/lib;/home/pi/test/devel_isolated/ros/lib;/home/pi/test/devel_isolated/nodelet_core/lib;/home/pi/test/devel_isolated/mk/lib;/home/pi/test/devel_isolated/geometry2/lib;/home/pi/test/devel_isolated/geometry/lib;/home/pi/test/devel_isolated/gazebo_ros_pkgs/lib;/home/pi/test/devel_isolated/gazebo_dev/lib;/home/pi/test/devel_isolated/diff_sim/lib;/home/pi/test/devel_isolated/diagnostics/lib;/home/pi/test/devel_isolated/common_msgs/lib;/home/pi/test/devel_isolated/bond_core/lib;/home/pi/test/devel_isolated/actionlib_tools/lib;/home/pi/test/devel_isolated/genpy/lib;/home/pi/test/devel_isolated/gencpp/lib;/home/pi/test/devel_isolated/catkin/lib;/home/pi/rosbots_catkin_ws/devel/lib;/home/pi/ros_catkin_ws/build/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(gazebo_ros_control_LIBRARY_DIRS ${lib_path})
      list(APPEND gazebo_ros_control_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'gazebo_ros_control'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND gazebo_ros_control_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(gazebo_ros_control_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${gazebo_ros_control_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "roscpp;std_msgs;controller_manager;control_toolbox;pluginlib;hardware_interface;transmission_interface;joint_limits_interface;urdf;angles")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 gazebo_ros_control_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${gazebo_ros_control_dep}_FOUND)
      find_package(${gazebo_ros_control_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${gazebo_ros_control_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(gazebo_ros_control_INCLUDE_DIRS ${${gazebo_ros_control_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(gazebo_ros_control_LIBRARIES ${gazebo_ros_control_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${gazebo_ros_control_dep}_LIBRARIES})
  _list_append_deduplicate(gazebo_ros_control_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(gazebo_ros_control_LIBRARIES ${gazebo_ros_control_LIBRARIES})

  _list_append_unique(gazebo_ros_control_LIBRARY_DIRS ${${gazebo_ros_control_dep}_LIBRARY_DIRS})
  list(APPEND gazebo_ros_control_EXPORTED_TARGETS ${${gazebo_ros_control_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${gazebo_ros_control_DIR}/${extra})
  endif()
  include(${extra})
endforeach()