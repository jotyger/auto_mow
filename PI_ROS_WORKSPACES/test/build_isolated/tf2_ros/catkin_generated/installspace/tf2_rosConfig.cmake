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


if(tf2_ros_CONFIG_INCLUDED)
  return()
endif()
set(tf2_ros_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(tf2_ros_SOURCE_PREFIX /home/pi/test/src/geometry2/tf2_ros)
  set(tf2_ros_DEVEL_PREFIX /home/pi/test/devel_isolated/tf2_ros)
  set(tf2_ros_INSTALL_PREFIX "")
  set(tf2_ros_PREFIX ${tf2_ros_DEVEL_PREFIX})
else()
  set(tf2_ros_SOURCE_PREFIX "")
  set(tf2_ros_DEVEL_PREFIX "")
  set(tf2_ros_INSTALL_PREFIX /home/pi/test/install_isolated)
  set(tf2_ros_PREFIX ${tf2_ros_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'tf2_ros' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(tf2_ros_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include " STREQUAL " ")
  set(tf2_ros_INCLUDE_DIRS "")
  set(_include_dirs "include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://www.ros.org/wiki/tf2_ros " STREQUAL " ")
    set(_report "Check the website 'http://www.ros.org/wiki/tf2_ros' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Tully Foote <tfoote@osrfoundation.org>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${tf2_ros_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'tf2_ros' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'tf2_ros' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/pi/test/install_isolated/${idir}'.  ${_report}")
    endif()
    _list_append_unique(tf2_ros_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "tf2_ros")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND tf2_ros_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND tf2_ros_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND tf2_ros_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/pi/test/install_isolated/lib;/home/pi/test/devel_isolated/test_nodelet_topic_tools/lib;/home/pi/test/devel_isolated/stereo_msgs/lib;/home/pi/test/devel_isolated/gazebo_msgs/lib;/home/pi/test/devel_isolated/sensor_msgs/lib;/home/pi/test/devel_isolated/nodelet_topic_tools/lib;/home/pi/test/devel_isolated/diagnostic_analysis/lib;/home/pi/test/devel_isolated/combined_robot_hw_tests/lib;/home/pi/test/devel_isolated/controller_manager_tests/lib;/home/pi/test/devel_isolated/control_toolbox/lib;/home/pi/test/devel_isolated/actionlib/lib;/home/pi/test/devel_isolated/rosbag/lib;/home/pi/test/devel_isolated/topic_tools/lib;/home/pi/test/devel_isolated/tf2_py/lib;/home/pi/test/devel_isolated/test_nodelet/lib;/home/pi/test/devel_isolated/test_diagnostic_aggregator/lib;/home/pi/test/devel_isolated/test_bond/lib;/home/pi/test/devel_isolated/self_test/lib;/home/pi/test/devel_isolated/roswtf/lib;/home/pi/test/devel_isolated/rostopic/lib;/home/pi/test/devel_isolated/rosnode/lib;/home/pi/test/devel_isolated/message_filters/lib;/home/pi/test/devel_isolated/controller_manager/lib;/home/pi/test/devel_isolated/controller_interface/lib;/home/pi/test/devel_isolated/combined_robot_hw/lib;/home/pi/test/devel_isolated/hardware_interface/lib;/home/pi/test/devel_isolated/dynamic_reconfigure/lib;/home/pi/test/devel_isolated/diagnostic_common_diagnostics/lib;/home/pi/test/devel_isolated/diagnostic_updater/lib;/home/pi/test/devel_isolated/diagnostic_aggregator/lib;/home/pi/test/devel_isolated/rosout/lib;/home/pi/test/devel_isolated/realtime_tools/lib;/home/pi/test/devel_isolated/nodelet/lib;/home/pi/test/devel_isolated/bondpy/lib;/home/pi/test/devel_isolated/bondcpp/lib;/home/pi/test/devel_isolated/roscpp/lib;/home/pi/test/devel_isolated/xmlrpcpp/lib;/home/pi/test/devel_isolated/visualization_msgs/lib;/home/pi/test/devel_isolated/urdf_parser_plugin/lib;/home/pi/test/devel_isolated/control_msgs/lib;/home/pi/test/devel_isolated/trajectory_msgs/lib;/home/pi/test/devel_isolated/tf2_eigen/lib;/home/pi/test/devel_isolated/tf2_bullet/lib;/home/pi/test/devel_isolated/tf2/lib;/home/pi/test/devel_isolated/tf2_msgs/lib;/home/pi/test/devel_isolated/std_srvs/lib;/home/pi/test/devel_isolated/shape_msgs/lib;/home/pi/test/devel_isolated/rosmsg/lib;/home/pi/test/devel_isolated/rosgraph_msgs/lib;/home/pi/test/devel_isolated/nav_msgs/lib;/home/pi/test/devel_isolated/kdl_msgs/lib;/home/pi/test/devel_isolated/kdl_conversions/lib;/home/pi/test/devel_isolated/eigen_conversions/lib;/home/pi/test/devel_isolated/geometry_msgs/lib;/home/pi/test/devel_isolated/diagnostic_msgs/lib;/home/pi/test/devel_isolated/controller_manager_msgs/lib;/home/pi/test/devel_isolated/bond/lib;/home/pi/test/devel_isolated/actionlib_msgs/lib;/home/pi/test/devel_isolated/ackermann_msgs/lib;/home/pi/test/devel_isolated/std_msgs/lib;/home/pi/test/devel_isolated/smclib/lib;/home/pi/test/devel_isolated/rqt_controller_manager/lib;/home/pi/test/devel_isolated/rostest/lib;/home/pi/test/devel_isolated/rosbag_storage/lib;/home/pi/test/devel_isolated/roslz4/lib;/home/pi/test/devel_isolated/rosconsole_bridge/lib;/home/pi/test/devel_isolated/resource_retriever/lib;/home/pi/test/devel_isolated/rosconsole/lib;/home/pi/test/devel_isolated/angles/lib;/home/pi/test/devel_isolated/rosunit/lib;/home/pi/test/devel_isolated/rosservice/lib;/home/pi/test/devel_isolated/rospy/lib;/home/pi/test/devel_isolated/rosparam/lib;/home/pi/test/devel_isolated/rosmaster/lib;/home/pi/test/devel_isolated/rosmake/lib;/home/pi/test/devel_isolated/roslint/lib;/home/pi/test/devel_isolated/roslib/lib;/home/pi/test/devel_isolated/roslaunch/lib;/home/pi/test/devel_isolated/roslang/lib;/home/pi/test/devel_isolated/rosgraph/lib;/home/pi/test/devel_isolated/rosdiagnostic/lib;/home/pi/test/devel_isolated/roscreate/lib;/home/pi/test/devel_isolated/rosclean/lib;/home/pi/test/devel_isolated/rosbuild/lib;/home/pi/test/devel_isolated/rosboost_cfg/lib;/home/pi/test/devel_isolated/rosbash/lib;/home/pi/test/devel_isolated/ros_control/lib;/home/pi/test/devel_isolated/ros_comm/lib;/home/pi/test/devel_isolated/ros/lib;/home/pi/test/devel_isolated/nodelet_core/lib;/home/pi/test/devel_isolated/mk/lib;/home/pi/test/devel_isolated/geometry2/lib;/home/pi/test/devel_isolated/geometry/lib;/home/pi/test/devel_isolated/gazebo_ros_pkgs/lib;/home/pi/test/devel_isolated/gazebo_dev/lib;/home/pi/test/devel_isolated/diff_sim/lib;/home/pi/test/devel_isolated/diagnostics/lib;/home/pi/test/devel_isolated/common_msgs/lib;/home/pi/test/devel_isolated/bond_core/lib;/home/pi/test/devel_isolated/actionlib_tools/lib;/home/pi/test/devel_isolated/genpy/lib;/home/pi/test/devel_isolated/gencpp/lib;/home/pi/test/devel_isolated/catkin/lib;/home/pi/rosbots_catkin_ws/devel/lib;/home/pi/ros_catkin_ws/build/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(tf2_ros_LIBRARY_DIRS ${lib_path})
      list(APPEND tf2_ros_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'tf2_ros'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND tf2_ros_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(tf2_ros_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${tf2_ros_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "actionlib;actionlib_msgs;geometry_msgs;message_filters;roscpp;rosgraph;tf2;tf2_msgs;tf2_py")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 tf2_ros_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${tf2_ros_dep}_FOUND)
      find_package(${tf2_ros_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${tf2_ros_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(tf2_ros_INCLUDE_DIRS ${${tf2_ros_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(tf2_ros_LIBRARIES ${tf2_ros_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${tf2_ros_dep}_LIBRARIES})
  _list_append_deduplicate(tf2_ros_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(tf2_ros_LIBRARIES ${tf2_ros_LIBRARIES})

  _list_append_unique(tf2_ros_LIBRARY_DIRS ${${tf2_ros_dep}_LIBRARY_DIRS})
  list(APPEND tf2_ros_EXPORTED_TARGETS ${${tf2_ros_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${tf2_ros_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
