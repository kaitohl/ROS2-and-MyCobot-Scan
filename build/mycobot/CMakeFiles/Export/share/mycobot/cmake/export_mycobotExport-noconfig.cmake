#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mycobot::mycobot" for configuration ""
set_property(TARGET mycobot::mycobot APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(mycobot::mycobot PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libmycobot.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS mycobot::mycobot )
list(APPEND _IMPORT_CHECK_FILES_FOR_mycobot::mycobot "${_IMPORT_PREFIX}/lib/libmycobot.a" )

# Import target "mycobot::wiggle" for configuration ""
set_property(TARGET mycobot::wiggle APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(mycobot::wiggle PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/bin/wiggle"
  )

list(APPEND _IMPORT_CHECK_TARGETS mycobot::wiggle )
list(APPEND _IMPORT_CHECK_FILES_FOR_mycobot::wiggle "${_IMPORT_PREFIX}/bin/wiggle" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
