if (QtTools_CONFIG_INCLUDED)
  return()
endif()
set(QtTools_CONFIG_INCLUDED TRUE)

set(QtTools_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../include/QtTools")

set(QtTools_lib_release "${lib}-NOTFOUND")
find_library(QtTools_lib_release QtTools
    PATHS "${CMAKE_CURRENT_LIST_DIR}/../../lib"
    NO_DEFAULT_PATH
    )

set(QtTools_lib_debug "${lib}-NOTFOUND")
find_library(QtTools_lib_debug QtToolsd
    PATHS "${CMAKE_CURRENT_LIST_DIR}/../../debug/lib"
    NO_DEFAULT_PATH
    )
if(NOT QtTools_lib_release)
  message(FATAL_ERROR "Library Release '${lib}' in package QtTools is not installed properly")
endif()
if(NOT QtTools_lib_debug)
  message(FATAL_ERROR "Library Debug '${lib}' in package QtTools is not installed properly")
endif()

set(QtTools_LIBRARY
	debug ${QtTools_lib_debug}
	optimized ${QtTools_lib_release}
)

