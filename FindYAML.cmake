find_path(YAML_INCLUDE_DIR NAMES yaml.h)
find_library(YAML_LIBRARY NAMES yaml)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(YAML
  REQUIRED_VARS YAML_INCLUDE_DIR YAML_LIBRARY)

mark_as_advanced(YAML_INCLUDE_DIR YAML_LIBRARY)
