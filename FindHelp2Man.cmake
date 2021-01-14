find_program(HELP2MAN_EXECUTABLE help2man)
mark_as_advanced(HELP2MAN_EXECUTABLE)


function(help2man TARGET)
  if(NOT TARGET)
    message(FATAL_ERROR "No TARGET provided.")
  endif()

  add_custom_target("${TARGET}.1" ALL COMMAND help2man $<TARGET_FILE:${TARGET}>
    --output="${TARGET}.1" DEPENDS ${TARGET})

  if(NOT TARGET man)
    add_custom_target(man DEPENDS "${TARGET}.1") 
  else()
    add_dependencies(man "${TARGET}.1")
  endif() 

  install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.1" DESTINATION share/man/man1)
endfunction(help2man)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HELP2MAN
  REQUIRED_VARS HELP2MAN_EXECUTABLE)
