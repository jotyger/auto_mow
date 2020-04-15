# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kdl_msgs: 12 messages, 0 services")

set(MSG_I_FLAGS "-Ikdl_msgs:/home/pi/test/src/kdl_msgs/msg;-Istd_msgs:/home/pi/test/src/std_msgs/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kdl_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" "std_msgs/Header:kdl_msgs/Vector:kdl_msgs/Wrench"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" ""
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" "std_msgs/Header:kdl_msgs/Vector:kdl_msgs/Twist"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Twist.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/Twist.msg" "kdl_msgs/Vector"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" ""
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" "std_msgs/Header:kdl_msgs/JntArray"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" "std_msgs/Header:kdl_msgs/Vector"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Frame.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/Frame.msg" "kdl_msgs/Vector:kdl_msgs/Rotation"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" "std_msgs/Header:kdl_msgs/Rotation"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" "std_msgs/Header:kdl_msgs/Rotation:kdl_msgs/Vector:kdl_msgs/Frame"
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Vector.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/Vector.msg" ""
)

get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" NAME_WE)
add_custom_target(_kdl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kdl_msgs" "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" "kdl_msgs/Vector"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_cpp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(kdl_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kdl_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kdl_msgs_generate_messages kdl_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Twist.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Frame.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_cpp _kdl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kdl_msgs_gencpp)
add_dependencies(kdl_msgs_gencpp kdl_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kdl_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)
_generate_msg_eus(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(kdl_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(kdl_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(kdl_msgs_generate_messages kdl_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Twist.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Frame.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_eus _kdl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kdl_msgs_geneus)
add_dependencies(kdl_msgs_geneus kdl_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kdl_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)
_generate_msg_lisp(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(kdl_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kdl_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kdl_msgs_generate_messages kdl_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Twist.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Frame.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_lisp _kdl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kdl_msgs_genlisp)
add_dependencies(kdl_msgs_genlisp kdl_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kdl_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)
_generate_msg_nodejs(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(kdl_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(kdl_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(kdl_msgs_generate_messages kdl_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Twist.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Frame.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_nodejs _kdl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kdl_msgs_gennodejs)
add_dependencies(kdl_msgs_gennodejs kdl_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kdl_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Twist.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/JntArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/std_msgs/msg/Header.msg;/home/pi/test/src/kdl_msgs/msg/Rotation.msg;/home/pi/test/src/kdl_msgs/msg/Vector.msg;/home/pi/test/src/kdl_msgs/msg/Frame.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)
_generate_msg_py(kdl_msgs
  "/home/pi/test/src/kdl_msgs/msg/Wrench.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/test/src/kdl_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(kdl_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kdl_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kdl_msgs_generate_messages kdl_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/WrenchStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Rotation.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/TwistStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Twist.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArray.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/JntArrayStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Frame.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/RotationStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/FrameStamped.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/test/src/kdl_msgs/msg/Wrench.msg" NAME_WE)
add_dependencies(kdl_msgs_generate_messages_py _kdl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kdl_msgs_genpy)
add_dependencies(kdl_msgs_genpy kdl_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kdl_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kdl_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(kdl_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kdl_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(kdl_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kdl_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(kdl_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kdl_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(kdl_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kdl_msgs/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(kdl_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
