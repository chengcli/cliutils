## set up model configuration ##

if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
  set(CMAKE_BUILD_TYPE "DebugRelease")
endif()

set(NumVapors 0
  CACHE STRING "Set number of vapors in the equation of state")

# NetCDF output flag
option(UseNetCDF "Enable NetCDF output" OFF)

if (${UseNetCDF})
  find_package(NetCDF REQUIRED)
  set(NetCDFOption NETCDF_OUTPUT)
else()
  set(NetCDFOption NOT_NETCDF_OUTPUT)
endif()

# PNetCDF output flag
option(UsePNetCDF "Enable PNetCDF output" OFF)

if (${UsePNetCDF})
  find_package(PNetCDF REQUIRED)
  set(PNetCDFOption PNETCDF_OUTPUT)
else()
  set(PNetCDFOption NOT_PNETCDF_OUTPUT)
endif()

# FITS output flag
option(UsePNetCDF "Enable FITS output" OFF)

if (${UsePNetCDF})
  find_package(FITS REQUIRED)
  set(FITSOption FITS_OUTPUT)
else()
  set(FITSOption NOT_FITS_OUTPUT)
endif()

# MPI flag
option(UseMPI "Enable MPI" OFF)

if (${UseMPI})
  find_package(MPI REQUIRED)
  set(MPIOption MPI_PARALLEL)
else()
  set(MPIOption NOT_MPI_PARALLEL)
endif()

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
