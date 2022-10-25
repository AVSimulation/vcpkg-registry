cmake_minimum_required(VERSION 3.0)

#############################################
project(QtTools)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "My multi config types" FORCE)

IF(MSVC)
	set(CMAKE_DEBUG_POSTFIX D)
	ADD_DEFINITIONS(-D_SCL_SECURE_NO_WARNINGS)
	ADD_DEFINITIONS(-D_CRT_SECURE_NO_DEPRECATE)
ELSE(MSVC)
	SET(CMAKE_CXX_FLAGS "-O3 -Wno-deprecated -Wno-invalid-offsetof -Wno-unused-result -fext-numeric-literals -Wno-psabi -fpermissive")
	SET(CMAKE_C_FLAGS "-O3 -Wno-deprecated -Wno-unused-result -Wno-psabi")
ENDIF(MSVC)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Qt
FIND_PACKAGE(Qt5Widgets REQUIRED)
IF(WIN32)
	FIND_PACKAGE(Qt5WinExtras REQUIRED)
ENDIF(WIN32)

SET(BROWSER_HEADERS
Browser/qtbuttonpropertybrowser.h
Browser/qteditorfactory.h
Browser/qtgroupboxpropertybrowser.h
Browser/qtpropertybrowser.h
Browser/qtpropertymanager.h
Browser/qttreepropertybrowser.h
Browser/qtvariantproperty.h
Browser/QtTools.h
)

SET(BROWSER_SRC
Browser/qtbuttonpropertybrowser.cpp
Browser/qteditorfactory.cpp
Browser/qtgroupboxpropertybrowser.cpp
Browser/qtpropertybrowser.cpp
Browser/qtpropertybrowser.qrc
Browser/qtpropertybrowserutils.cpp
Browser/qtpropertybrowserutils_p.h
Browser/qtpropertymanager.cpp
Browser/qttreepropertybrowser.cpp
Browser/qtvariantproperty.cpp
)

IF(WIN32)
SET(WINMIGRATE_HEADERS
QTWinMigrate/QMfcApp
QTWinMigrate/qmfcapp.h
QTWinMigrate/QWinHost
QTWinMigrate/qwinhost.h
QTWinMigrate/QWinWidget
QTWinMigrate/qwinwidget.h
QTWinMigrate/QMfcApp
QTWinMigrate/QWinHost
QTWinMigrate/QWinWidget
)

SET(WINMIGRATE_SRC
QTWinMigrate/qmfcapp.cpp
QTWinMigrate/qtwinmigrate.pri
QTWinMigrate/qwinhost.cpp
QTWinMigrate/QWinWidget
QTWinMigrate/qwinwidget.cpp
)

set(CMAKE_MFC_FLAG 2)

ENDIF(WIN32)

add_library(QtTools SHARED
${BROWSER_HEADERS}
${BROWSER_SRC}
${WINMIGRATE_HEADERS}
${WINMIGRATE_SRC}
)

target_include_directories(QtTools PRIVATE)

target_link_libraries(QtTools 
Qt5::Widgets
)

IF(WIN32)
    target_compile_definitions(QtTools PRIVATE QT_DLL QTTOOLS_EXPORTS QT_QTWINMIGRATE_EXPORT _CRT_SECURE_NO_WARNINGS _AFXDLL)
ENDIF(WIN32)

install(TARGETS QtTools)

IF(WIN32)
install(FILES ${WINMIGRATE_HEADERS}
        DESTINATION "include/QtTools/QTWinMigrate"
)
ENDIF(WIN32)

install(FILES ${BROWSER_HEADERS}
        DESTINATION "include/QtTools/Browser"
)
