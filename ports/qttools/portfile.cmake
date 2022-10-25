


vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
    REPO AVSimulation/QtTools
    REF main
    SHA512 b08719006a63dbcaa54decadc918a0d395ee62d09fc203d7791e4ffb32ba62db9846e718832696f81064b10509458ef2aa8fa79633b04a23dd3a1e7700be5406
    HEAD_REF main

)

# Patch CMakeLists.txt with a VCPKG compatible version
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()

# Handle .cmake
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/QtTools-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/QtTools)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/QtTools-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/debug/share/QtTools)

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
vcpkg_install_copyright(FILE_LIST ${CMAKE_CURRENT_LIST_DIR}/copyright)
