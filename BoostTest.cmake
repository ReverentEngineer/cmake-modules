#[=======================================================================[.rst:
BoostTest
----------

This module defines functions to help use the Boost Test infrastructure. 

The :command:`discover_boost_tests` discovers tests by asking the
compiled test executable to enumerate its tests.

.. command:: discover_boost_tests

  Add tests to the CTest by querying the compiled test executable
  for available tests::

  ``discover_boost_tests()`` sets up a post-build command to discover the
	tests from the Boost Test executable with the ``--list_content`` argument.
	
  The options are:

  ``target``
    Specifies the Boost Test executable target.

#]=======================================================================]

include(CMakeParseArguments)

function(discover_boost_tests)
  cmake_parse_arguments(
		BOOST_TESTS
		"" # Single
		"" # One Value
		"" # MultiValue
		${ARGN}
	)

  set(BOOST_TESTS_TARGETS ${BOOST_TESTS_UNPARSED_ARGUMENTS})
	foreach (target ${BOOST_TESTS_TARGETS})
		add_custom_command(TARGET ${target} POST_BUILD
						COMMAND ${CMAKE_COMMAND} 
						-D TEST_EXECUTABLE=$<TARGET_FILE:${target}>
						-D TEST_INCLUDE_FILENAME=${target}-tests.cmake
						-D PROJECT_NAME=${CMAKE_PROJECT_NAME}
						-P ${CMAKE_CURRENT_LIST_DIR}/DiscoverBoostTests.cmake)
    set_property(DIRECTORY
	    APPEND PROPERTY TEST_INCLUDE_FILES "${target}-tests.cmake"
    )
	endforeach(target ${BOOST_TESTS_TARGETS})
endfunction(discover_boost_tests)
