# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "test_bond: 0 messages, 1 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(test_bond_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" NAME_WE)
add_custom_target(_test_bond_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "test_bond" "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(test_bond
  "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/test_bond
)

### Generating Module File
_generate_module_cpp(test_bond
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/test_bond
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(test_bond_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(test_bond_generate_messages test_bond_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" NAME_WE)
add_dependencies(test_bond_generate_messages_cpp _test_bond_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(test_bond_gencpp)
add_dependencies(test_bond_gencpp test_bond_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS test_bond_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(test_bond
  "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/test_bond
)

### Generating Module File
_generate_module_eus(test_bond
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/test_bond
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(test_bond_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(test_bond_generate_messages test_bond_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" NAME_WE)
add_dependencies(test_bond_generate_messages_eus _test_bond_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(test_bond_geneus)
add_dependencies(test_bond_geneus test_bond_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS test_bond_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(test_bond
  "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/test_bond
)

### Generating Module File
_generate_module_lisp(test_bond
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/test_bond
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(test_bond_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(test_bond_generate_messages test_bond_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" NAME_WE)
add_dependencies(test_bond_generate_messages_lisp _test_bond_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(test_bond_genlisp)
add_dependencies(test_bond_genlisp test_bond_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS test_bond_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(test_bond
  "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/test_bond
)

### Generating Module File
_generate_module_nodejs(test_bond
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/test_bond
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(test_bond_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(test_bond_generate_messages test_bond_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" NAME_WE)
add_dependencies(test_bond_generate_messages_nodejs _test_bond_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(test_bond_gennodejs)
add_dependencies(test_bond_gennodejs test_bond_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS test_bond_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(test_bond
  "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/test_bond
)

### Generating Module File
_generate_module_py(test_bond
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/test_bond
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(test_bond_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(test_bond_generate_messages test_bond_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/test/src/bond_core/test_bond/srv/TestBond.srv" NAME_WE)
add_dependencies(test_bond_generate_messages_py _test_bond_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(test_bond_genpy)
add_dependencies(test_bond_genpy test_bond_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS test_bond_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/test_bond)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/test_bond
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/test_bond)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/test_bond
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/test_bond)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/test_bond
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/test_bond)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/test_bond
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/test_bond)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/test_bond\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/test_bond
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
