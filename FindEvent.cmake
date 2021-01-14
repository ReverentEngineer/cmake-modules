find_path(EVENT_INCLUDE_DIR event2/event.h)
mark_as_advanced(EVENT_INCLUDE_DIR)

find_library(EVENT_LIBRARY event)
mark_as_advanced(EVENT_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(EVENT
  REQUIRED_VARS EVENT_INCLUDE_DIR EVENT_LIBRARY)
