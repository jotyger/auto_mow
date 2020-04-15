# Install script for directory: /home/ubuntu/catkin_ws/src/path_tracker_ros/src/pt_example_client

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntu/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pt_example_client/../pt_actions/action" TYPE FILE FILES "/home/ubuntu/catkin_ws/src/path_tracker_ros/src/pt_example_client/../pt_actions/action/Navigate.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pt_example_client/msg" TYPE FILE FILES
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateAction.msg"
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateActionGoal.msg"
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateActionResult.msg"
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateActionFeedback.msg"
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateGoal.msg"
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateResult.msg"
    "/home/ubuntu/catkin_ws/devel/share/pt_example_client/msg/NavigateFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu/catkin_ws/build/path_tracker_ros/src/pt_example_client/catkin_generated/installspace/pt_example_client.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pt_example_client/cmake" TYPE FILE FILES
    "/home/ubuntu/catkin_ws/build/path_tracker_ros/src/pt_example_client/catkin_generated/installspace/pt_example_clientConfig.cmake"
    "/home/ubuntu/catkin_ws/build/path_tracker_ros/src/pt_example_client/catkin_generated/installspace/pt_example_clientConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pt_example_client" TYPE FILE FILES "/home/ubuntu/catkin_ws/src/path_tracker_ros/src/pt_example_client/package.xml")
endif()

