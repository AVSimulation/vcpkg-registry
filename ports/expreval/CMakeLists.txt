cmake_minimum_required(VERSION 3.0)

project(expreval)

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

install(TARGETS expreval
        COMPONENT runtime
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib)

if(NOT DISABLE_INSTALL_HEADERS)
	install(FILES ${HEADERS} DESTINATION include/expreval)
endif()
