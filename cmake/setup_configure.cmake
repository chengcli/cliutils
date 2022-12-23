## set up model configuration ##

if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
  set(CMAKE_BUILD_TYPE "DebugRelease")
endif()

# MPI flag
option(UseMPI "Enable MPI" OFF)

if (${UseMPI})
  find_package(MPI REQUIRED)
  set(MPIOption MPI_PARALLEL)
else()
  set(MPIOption NOT_MPI_PARALLEL)
endif()

# configure athenapp
#message(STATUS "Include ${CMAKE_SOURCE_DIR}/athenapp/cmake/setup_configure.cmake")
#include(${CMAKE_SOURCE_DIR}/athenapp/cmake/setup_configure.cmake)

if (CMAKE_BUILD_TYPE MATCHES "Debug")
  if (NOT "DEBUG" IN_LIST BUILD_TYPES)
    list(APPEND BUILD_TYPES "DEBUG")
  endif()
endif()

if (CMAKE_BUILD_TYPE MATCHES "Release")
  if (NOT "RELEASE" IN_LIST BUILD_TYPES)
    list(APPEND BUILD_TYPES "RELEASE")
  endif()
endif()
