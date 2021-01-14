find_path(JSONC_INCLUDE_DIR json-c/json.h)
mark_as_advanced(JSONC_INCLUDE_DIR)

find_library(JSONC_LIBRARY json-c)
mark_as_advanced(JSONC_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(JSONC
  REQUIRED_VARS JSONC_INCLUDE_DIR JSONC_LIBRARY)
