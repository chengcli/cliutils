# Installs cliutils library
#
#   library: libcliutils_debug.o
#   library: libcliutils_release.o
#
# Define the following variables
#
#   CLIUTILS_FOUND
#   CLIUTILS_INCLUDE_DIR
#   CLIUTILS_LIBRARY_DEBUG
#   CLIUTILS_LIBRARY_RELEASE
#
# Normal usage would be:
#
#   include_directories( ${CLIUTILS_INCLUDE_DIR})
#   target_link_libraries( ${CLIUTILS_LIBRARY_DEBUG})
#

file(GLOB _src_files *.cpp)

foreach(build ${BUILD_TYPES})
  string(TOLOWER ${build} buildl)
  add_library(cliutils_${buildl}
    ${_src_files})

  #add_dependencies(cliutils_${buildl} athenapp_${buildl})

  set_target_properties(cliutils_${buildl}
    PROPERTIES
    COMPILE_FLAGS ${CMAKE_CXX_FLAGS_${build}}
    )

  target_include_directories(cliutils_${buildl}
    SYSTEM PRIVATE
    ${DEBUGGER_INCLUDE_DIR}
    ${ATHENAPP_INCLUDE_DIR}
    ${MPI_CXX_INCLUDE_PATH}
    ${CMAKE_BINARY_DIR}
    )

  target_link_libraries(cliutils_${buildl}
    ${DEBUGGER_LIBRARY_${build}}
    ${ATHENAPP_LIBRARY_${build}}
    ${MPI_CXX_LIBRARIES}
    )

  set(CLIUTILS_LIBRARY_${build} cliutils_${buildl}
    CACHE STRING 
    "cliutils library ${build}")
  mark_as_advanced(CLIUTILS_LIBRARY_${build})
endforeach()

set(CLIUTILS_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..
  CACHE PATH 
  "cliutils include directory")
set(CLIUTILS_FOUND TRUE CACHE BOOL "FIND CLIUTILS LIBRARY")
mark_as_advanced(CLIUTILS_INCLUDE_DIR)
mark_as_advanced(CLIUTILS_FOUND)
