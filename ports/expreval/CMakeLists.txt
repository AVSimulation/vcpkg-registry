cmake_minimum_required(VERSION 3.0)

project(expreval VERSION 3.5 LANGUAGES CXX)

set(CMAKE_DEBUG_POSTFIX "d")

if(MSVC)
  add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
  add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE)
endif()

# List the header files
set(HEADERS
	defs.h
	except.h
	expr.h
	expreval.h
	funclist.h
	node.h
	parser.h
	vallist.h
)

# List the source files
add_library(expreval
	${HEADERS}
	docs
	except.cpp
	expr.cpp
	func.cpp
	funclist.cpp
	node.cpp
	parser.cpp
	vallist.cpp
)


target_include_directories(expreval
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/expreval>
)

install(TARGETS expreval
  EXPORT expreval-export
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(EXPORT expreval-export
  FILE
  	exprevalTargets.cmake
  NAMESPACE
  	expreval::
  DESTINATION
    share/expreval
)

if(NOT DISABLE_INSTALL_HEADERS)
	install(FILES ${HEADERS} DESTINATION include/expreval)
endif()

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/exprevalConfig.cmake DESTINATION "share/expreval")

include(CMakePackageConfigHelpers)
write_basic_package_version_file(${CMAKE_CURRENT_BUILD_DIR}/cmake/exprevalConfigVersion.cmake
		VERSION ${PROJECT_VERSION}
		COMPATIBILITY SameMajorVersion)
install(FILES ${CMAKE_CURRENT_BUILD_DIR}/cmake/exprevalConfigVersion.cmake
		DESTINATION "share/expreval")