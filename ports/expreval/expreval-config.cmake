if (expreval_CONFIG_INCLUDED)
  return()
endif()
set(expreval_CONFIG_INCLUDED TRUE)

set(expreval_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../include/expreval")

set(expreval_lib_release "${lib}-NOTFOUND")
find_library(expreval_lib_release expreval
    PATHS "${CMAKE_CURRENT_LIST_DIR}/../../lib"
    NO_DEFAULT_PATH
    )

set(expreval_lib_debug "${lib}-NOTFOUND")
find_library(expreval_lib_debug exprevald
    PATHS "${CMAKE_CURRENT_LIST_DIR}/../../debug/lib"
    NO_DEFAULT_PATH
    )
if(NOT expreval_lib_release)
  message(FATAL_ERROR "Library Release '${lib}' in package expreval is not installed properly")
endif()
if(NOT expreval_lib_debug)
  message(FATAL_ERROR "Library Debug '${lib}' in package expreval is not installed properly")
endif()

set(expreval_LIBRARY
	debug ${expreval_lib_debug}
	optimized ${expreval_lib_release}
)

