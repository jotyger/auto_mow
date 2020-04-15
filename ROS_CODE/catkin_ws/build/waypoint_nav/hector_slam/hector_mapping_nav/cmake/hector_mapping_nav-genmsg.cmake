# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hector_mapping_nav: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ihector_mapping_nav:/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hector_mapping_nav_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" NAME_WE)
add_custom_target(_hector_mapping_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hector_mapping_nav" "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" "hector_mapping_nav/HectorIterData"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" NAME_WE)
add_custom_target(_hector_mapping_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hector_mapping_nav" "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hector_mapping_nav
)
_generate_msg_cpp(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hector_mapping_nav
)

### Generating Services

### Generating Module File
_generate_module_cpp(hector_mapping_nav
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hector_mapping_nav
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hector_mapping_nav_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hector_mapping_nav_generate_messages hector_mapping_nav_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_cpp _hector_mapping_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_cpp _hector_mapping_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hector_mapping_nav_gencpp)
add_dependencies(hector_mapping_nav_gencpp hector_mapping_nav_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hector_mapping_nav_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hector_mapping_nav
)
_generate_msg_eus(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hector_mapping_nav
)

### Generating Services

### Generating Module File
_generate_module_eus(hector_mapping_nav
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hector_mapping_nav
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hector_mapping_nav_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hector_mapping_nav_generate_messages hector_mapping_nav_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_eus _hector_mapping_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_eus _hector_mapping_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hector_mapping_nav_geneus)
add_dependencies(hector_mapping_nav_geneus hector_mapping_nav_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hector_mapping_nav_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hector_mapping_nav
)
_generate_msg_lisp(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hector_mapping_nav
)

### Generating Services

### Generating Module File
_generate_module_lisp(hector_mapping_nav
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hector_mapping_nav
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hector_mapping_nav_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hector_mapping_nav_generate_messages hector_mapping_nav_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_lisp _hector_mapping_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_lisp _hector_mapping_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hector_mapping_nav_genlisp)
add_dependencies(hector_mapping_nav_genlisp hector_mapping_nav_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hector_mapping_nav_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hector_mapping_nav
)
_generate_msg_nodejs(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hector_mapping_nav
)

### Generating Services

### Generating Module File
_generate_module_nodejs(hector_mapping_nav
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hector_mapping_nav
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hector_mapping_nav_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hector_mapping_nav_generate_messages hector_mapping_nav_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_nodejs _hector_mapping_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_nodejs _hector_mapping_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hector_mapping_nav_gennodejs)
add_dependencies(hector_mapping_nav_gennodejs hector_mapping_nav_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hector_mapping_nav_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hector_mapping_nav
)
_generate_msg_py(hector_mapping_nav
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hector_mapping_nav
)

### Generating Services

### Generating Module File
_generate_module_py(hector_mapping_nav
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hector_mapping_nav
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hector_mapping_nav_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hector_mapping_nav_generate_messages hector_mapping_nav_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorDebugInfo.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_py _hector_mapping_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/waypoint_nav/hector_slam/hector_mapping_nav/msg/HectorIterData.msg" NAME_WE)
add_dependencies(hector_mapping_nav_generate_messages_py _hector_mapping_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hector_mapping_nav_genpy)
add_dependencies(hector_mapping_nav_genpy hector_mapping_nav_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hector_mapping_nav_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hector_mapping_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hector_mapping_nav
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hector_mapping_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hector_mapping_nav
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hector_mapping_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hector_mapping_nav
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hector_mapping_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hector_mapping_nav
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hector_mapping_nav)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hector_mapping_nav\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hector_mapping_nav
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
