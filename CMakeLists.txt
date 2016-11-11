cmake_minimum_required(VERSION 2.8.3)
project(sophus_catkin)

find_package(catkin_simple REQUIRED)

catkin_simple()

include(ExternalProject)

file(MAKE_DIRECTORY ${CATKIN_DEVEL_PREFIX}/include/sophus)

ExternalProject_Add(sophus_src
  GIT_REPOSITORY https://github.com/strasdat/Sophus
  GIT_TAG a9e75b54701e13143dd0d2d75e628641a7765cec
  UPDATE_COMMAND ""
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CATKIN_DEVEL_PREFIX} -DCMAKE_BUILD_TYPE:STRING=Release
  BUILD_COMMAND make
  INSTALL_COMMAND make install
)

cs_add_library(${PROJECT_NAME} src/dependency_tracker.cc)
add_dependencies(${PROJECT_NAME} sophus_src)

cs_install()
install(DIRECTORY ${CATKIN_DEVEL_PREFIX}/include/sophus/
  DESTINATION ${CATKIN_GLOBAL_INCLUDE_DESTINATION}
  FILES_MATCHING
  PATTERN "*.hpp"
)

cs_export(INCLUDE_DIRS ${CATKIN_DEVEL_PREFIX}/include/sophus/
  CFG_EXTRAS sophus-extras.cmake)
