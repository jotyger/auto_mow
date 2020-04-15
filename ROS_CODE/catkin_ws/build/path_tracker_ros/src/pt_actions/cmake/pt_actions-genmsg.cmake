# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pt_actions: 7 messages, 0 services")

set(MSG_I_FLAGS "-Ipt_actions:/home/ubuntu/catkin_ws/devel/share/pt_actions/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pt_actions_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" "pt_actions/NavigateResult:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" "actionlib_msgs/GoalStatus:pt_actions/NavigateActionGoal:pt_actions/NavigateGoal:pt_actions/NavigateActionFeedback:pt_actions/NavigateResult:pt_actions/NavigateActionResult:actionlib_msgs/GoalID:pt_actions/NavigateFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" "pt_actions/NavigateFeedback:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" NAME_WE)
add_custom_target(_pt_actions_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pt_actions" "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:pt_actions/NavigateGoal"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)
_generate_msg_cpp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
)

### Generating Services

### Generating Module File
_generate_module_cpp(pt_actions
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pt_actions_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pt_actions_generate_messages pt_actions_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_cpp _pt_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pt_actions_gencpp)
add_dependencies(pt_actions_gencpp pt_actions_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pt_actions_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)
_generate_msg_eus(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
)

### Generating Services

### Generating Module File
_generate_module_eus(pt_actions
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pt_actions_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pt_actions_generate_messages pt_actions_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_eus _pt_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pt_actions_geneus)
add_dependencies(pt_actions_geneus pt_actions_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pt_actions_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)
_generate_msg_lisp(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
)

### Generating Services

### Generating Module File
_generate_module_lisp(pt_actions
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pt_actions_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pt_actions_generate_messages pt_actions_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_lisp _pt_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pt_actions_genlisp)
add_dependencies(pt_actions_genlisp pt_actions_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pt_actions_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)
_generate_msg_nodejs(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pt_actions
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pt_actions_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pt_actions_generate_messages pt_actions_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_nodejs _pt_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pt_actions_gennodejs)
add_dependencies(pt_actions_gennodejs pt_actions_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pt_actions_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)
_generate_msg_py(pt_actions
  "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
)

### Generating Services

### Generating Module File
_generate_module_py(pt_actions
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pt_actions_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pt_actions_generate_messages pt_actions_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateAction.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateResult.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionFeedback.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/devel/share/pt_actions/msg/NavigateActionGoal.msg" NAME_WE)
add_dependencies(pt_actions_generate_messages_py _pt_actions_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pt_actions_genpy)
add_dependencies(pt_actions_genpy pt_actions_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pt_actions_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pt_actions
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(pt_actions_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(pt_actions_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pt_actions_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(pt_actions_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pt_actions
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(pt_actions_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(pt_actions_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pt_actions_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(pt_actions_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pt_actions
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(pt_actions_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(pt_actions_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pt_actions_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(pt_actions_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pt_actions
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(pt_actions_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(pt_actions_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pt_actions_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(pt_actions_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pt_actions
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(pt_actions_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(pt_actions_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pt_actions_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(pt_actions_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
