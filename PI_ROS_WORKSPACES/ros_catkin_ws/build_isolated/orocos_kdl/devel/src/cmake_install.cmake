# Install script for directory: /home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/pi/ros_catkin_ws/devel_isolated/orocos_kdl")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-kdl.so.1.4.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-kdl.so.1.4"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-kdl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "$ORIGIN/../lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/pi/ros_catkin_ws/build_isolated/orocos_kdl/devel/src/liborocos-kdl.so.1.4.0"
    "/home/pi/ros_catkin_ws/build_isolated/orocos_kdl/devel/src/liborocos-kdl.so.1.4"
    "/home/pi/ros_catkin_ws/build_isolated/orocos_kdl/devel/src/liborocos-kdl.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-kdl.so.1.4.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-kdl.so.1.4"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-kdl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "::::::::::::::"
           NEW_RPATH "$ORIGIN/../lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kdl" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/articulatedbodyinertia.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chain.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chaindynparam.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainfdsolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainfdsolver_recursive_newton_euler.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainfksolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainfksolverpos_recursive.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainfksolvervel_recursive.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainidsolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainidsolver_recursive_newton_euler.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainidsolver_vereshchagin.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolverpos_lma.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolverpos_nr.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolverpos_nr_jl.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolvervel_pinv.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolvervel_pinv_givens.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolvervel_pinv_nso.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainiksolvervel_wdls.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainjnttojacdotsolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/chainjnttojacsolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/frameacc.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/frameacc_io.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/frames.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/frames_io.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/framevel.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/framevel_io.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/jacobian.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/jntarray.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/jntarrayacc.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/jntarrayvel.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/jntspaceinertiamatrix.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/joint.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/kdl.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/kinfam.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/kinfam_io.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/motion.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path_circle.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path_composite.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path_cyclic_closed.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path_line.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path_point.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/path_roundedcomposite.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/rigidbodyinertia.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/rotational_interpolation.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/rotational_interpolation_sa.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/rotationalinertia.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/segment.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/solveri.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/stiffness.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/trajectory.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/trajectory_composite.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/trajectory_segment.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/trajectory_stationary.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/tree.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treefksolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treefksolverpos_recursive.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treeidsolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treeidsolver_recursive_newton_euler.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treeiksolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treeiksolverpos_nr_jl.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treeiksolverpos_online.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treeiksolvervel_wdls.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/treejnttojacsolver.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/velocityprofile.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/velocityprofile_dirac.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/velocityprofile_rect.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/velocityprofile_spline.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/velocityprofile_trap.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/velocityprofile_traphalf.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/frameacc.inl"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/frames.inl"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/framevel.inl"
    "/home/pi/ros_catkin_ws/build_isolated/orocos_kdl/devel/src/config.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kdl/utilities" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/error.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/error_stack.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/kdl-config.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/rall1d.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/rall1d_io.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/rall2d.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/rall2d_io.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/rallNd.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/traits.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/utility.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/utility_io.h"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/ldl_solver_eigen.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/scoped_ptr.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/svd_HH.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/svd_eigen_HH.hpp"
    "/home/pi/ros_catkin_ws/src/orocos_kinematics_dynamics/src/utilities/svd_eigen_Macie.hpp"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pi/ros_catkin_ws/build_isolated/orocos_kdl/devel/src/orocos-kdl.pc")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pi/ros_catkin_ws/build_isolated/orocos_kdl/devel/src/orocos_kdl.pc")
endif()

