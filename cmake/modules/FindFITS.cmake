# - Find FITS
# Find the FITS include and library
#
#   FITS_INCLUDE_DIR  - where to find fitsio.h
#   FITS_LIBRARY      - link library
#   FITS_FOUND        - True if FITS found include requried interfaces
#
# Normal usage would be:

find_path(FITS_INCLUDE_DIR fitsio.h
  HINTS
  $ENV{HOME}/opt/include
  )

find_library(FITS_LIBRARY NAMES cfitsio
  HINTS
  $ENV{HOME}/opt/lib
  )

if (FITS_INCLUDE_DIR)
  mark_as_advanced(FITS_LIBRARY)
  mark_as_advanced(FITS_INCLUDE_DIR)

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(FITS DEFAULT_MSG
    FITS_LIBRARY FITS_INCLUDE_DIR)
endif()
