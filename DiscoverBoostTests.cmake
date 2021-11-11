if (NOT DEFINED TEST_EXECUTABLE)
  message(FATAL_ERROR "TEST_EXECUTABLE is not defined.")
endif()

if (NOT EXISTS ${TEST_EXECUTABLE})
	message(FATAL_ERROR "TEST_EXECUTABLE does not exist.")
endif()

execute_process(
  COMMAND ${TEST_EXECUTABLE} --list_content
  RESULT_VARIABLE result
	ERROR_VARIABLE output)

if (NOT ${result} EQUAL "0")
  message(FATAL_ERROR "Failed to get test list")
endif()

string(REGEX MATCHALL "([^* \n])+" test_names ${output})

foreach(test_name ${test_names})
		set(boost_test_name ${test_name})
		if (DEFINED TEST_SUITE_NAME)
		  set(test_name ${TEST_SUITE_NAME}/${test_name}) 
		endif()
		if (DEFINED PROJECT_NAME)
		  set(test_name ${PROJECT_NAME}/${test_name}) 
		endif()
    list(APPEND test_include_content "add_test(${test_name} ${TEST_EXECUTABLE} -t ${boost_test_name})\n")

endforeach()

string(CONCAT test_include_content ${test_include_content})

if (DEFINED TEST_INCLUDE_FILENAME)
  file(WRITE ${TEST_INCLUDE_FILENAME} ${test_include_content})
else()
  message(${test_include_content})
endif()
