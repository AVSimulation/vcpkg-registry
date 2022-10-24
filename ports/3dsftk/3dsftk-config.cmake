if (3dsftk_CONFIG_INCLUDED)
  return()
endif()
set(3dsftk_CONFIG_INCLUDED TRUE)

set(3dsftk_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../include")

set(3dsftk_lib_release "${lib}-NOTFOUND")
find_library(3dsftk_lib_release 3dsftk
    PATHS "${CMAKE_CURRENT_LIST_DIR}/../../lib"
    NO_DEFAULT_PATH
    )

set(3dsftk_lib_debug "${lib}-NOTFOUND")
find_library(3dsftk_lib_debug 3dsftkd
    PATHS "${CMAKE_CURRENT_LIST_DIR}/../../debug/lib"
    NO_DEFAULT_PATH
    )
if(NOT 3dsftk_lib_release)
  message(FATAL_ERROR "Library Release '${lib}' in package 3dsftk is not installed properly")
endif()
if(NOT 3dsftk_lib_debug)
  message(FATAL_ERROR "Library Debug '${lib}' in package 3dsftk is not installed properly")
endif()

set(3dsftk_LIBRARY
	debug ${3dsftk_lib_debug}
	optimized ${3dsftk_lib_release}
)

