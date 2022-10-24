vcpkg_check_linkage(ONLY_STATIC_LIBRARY)


vcpkg_from_gitlab(
	GITLAB_URL "https://gitlab.avs.lan/"
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "scaner_externals/3dsftk"
	REF "2134c052a06c3a902fab7704dc1c012aedaecdc3"
	SHA512 "785ddef74725c203f7f913a62e2b68f0c2e37c8e4c17790b640a384fd7b87db1cd8fd9a6b7067844289f6e87055aae57f8efd0a5e1ee71ae99af4c79e2f1d11f"
	HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS_DEBUG -DDISABLE_INSTALL_HEADERS=1
)

vcpkg_cmake_install()

# Handle .cmake
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/3dsftk-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/3dsftk)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/3dsftk-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/debug/share/3dsftk)

vcpkg_cmake_config_fixup()

# Handle copyright
vcpkg_install_copyright(FILE_LIST ${CMAKE_CURRENT_LIST_DIR}/copyright)


