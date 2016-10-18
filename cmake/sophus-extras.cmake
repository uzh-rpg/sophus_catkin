# This overrides the dependency tracker with the sophus library file.
set(@PROJECT_NAME@_LIBRARIES
  @CATKIN_DEVEL_PREFIX@/lib/sophus${CMAKE_SHARED_LIBRARY_SUFFIX})
set(@PROJECT_NAME@_INCLUDE_DIR @CATKIN_DEVEL_PREFIX@/include)
