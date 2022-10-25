vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_download_distfile(ARCHIVE
    URLS "https://master.dl.sourceforge.net/project/expreval/ExprEval%20C%2B%2B/ExprEval%203.5/expreval35.zip?viasf=1"
    FILENAME "expreval35.zip"
    SHA512 cd59a79223e80ebb6f1b9281010504af03e78bf506572056091a285fbbb13d9d852d40c934d8777238309204aa65183d246efd98eed818da578b334d229af4bf
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE} 
    NO_REMOVE_ONE_LEVEL
    # (Optional) A friendly name to use instead of the filename of the archive (e.g.: a version number or tag).
    # REF 1.0.0
    # (Optional) Read the docs for how to generate patches at: 
    # https://github.com/Microsoft/vcpkg/blob/master/docs/examples/patching.md
    PATCHES
       fix.patch
)

# # Check if one or more features are a part of a package installation.
# # See /docs/maintainers/vcpkg_check_features.md for more details
# vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
#   FEATURES # <- Keyword FEATURES is required because INVERTED_FEATURES are being used
#     tbb   WITH_TBB
#   INVERTED_FEATURES
#     tbb   ROCKSDB_IGNORE_PACKAGE_TBB
# )

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS_DEBUG -DDISABLE_INSTALL_HEADERS=1
)

vcpkg_cmake_install()

# Handle .cmake
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/expreval-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/expreval)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/expreval-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/debug/share/expreval)

vcpkg_cmake_config_fixup()

# Handle copyright
vcpkg_install_copyright(FILE_LIST ${CMAKE_CURRENT_LIST_DIR}/copyright)
