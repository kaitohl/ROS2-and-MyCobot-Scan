#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mycobot_hardware_interface::mycobot_hardware_interface" for configuration ""
set_property(TARGET mycobot_hardware_interface::mycobot_hardware_interface APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(mycobot_hardware_interface::mycobot_hardware_interface PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libmycobot_hardware_interface.so"
  IMPORTED_SONAME_NOCONFIG "libmycobot_hardware_interface.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS mycobot_hardware_interface::mycobot_hardware_interface )
list(APPEND _IMPORT_CHECK_FILES_FOR_mycobot_hardware_interface::mycobot_hardware_interface "${_IMPORT_PREFIX}/lib/libmycobot_hardware_interface.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
