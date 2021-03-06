set(PCRE2_VERSION 10.32)
include(vcpkg_common_functions)
vcpkg_download_distfile(ARCHIVE
    URLS "https://ftp.pcre.org/pub/pcre/pcre2-${PCRE2_VERSION}.zip" "https://sourceforge.net/projects/pcre/files/pcre2/${PCRE2_VERSION}/pcre2-${PCRE2_VERSION}.zip/download"
    FILENAME "pcre2-${PCRE2_VERSION}.zip"
    SHA512 4e556059ee25940a2ace4219ffc338636dd00a924d846aea81221ab563b5cba3be18fc9ea77ceb8c83e6345485ec120ed9b8eaea198816e0a5242b3c6154b73f)

vcpkg_extract_source_archive_ex(
    ARCHIVE ${ARCHIVE}
    OUT_SOURCE_PATH SOURCE_PATH
    PATCHES fix-space.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DPCRE2_BUILD_PCRE2_8=ON
        -DPCRE2_BUILD_PCRE2_16=ON
        -DPCRE2_BUILD_PCRE2_32=ON
        -DPCRE2_SUPPORT_JIT=ON
        -DPCRE2_SUPPORT_UNICODE=ON
        -DPCRE2_BUILD_TESTS=OFF
        -DPCRE2_BUILD_PCRE2GREP=OFF)

vcpkg_install_cmake()

file(READ ${CURRENT_PACKAGES_DIR}/include/pcre2.h PCRE2_H)
if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    string(REPLACE "defined(PCRE2_STATIC)" "1" PCRE2_H "${PCRE2_H}")
else()
    string(REPLACE "defined(PCRE2_STATIC)" "0" PCRE2_H "${PCRE2_H}")
endif()
file(WRITE ${CURRENT_PACKAGES_DIR}/include/pcre2.h "${PCRE2_H}")

# don't install POSIX wrapper
file(REMOVE ${CURRENT_PACKAGES_DIR}/include/pcre2posix.h)
file(REMOVE ${CURRENT_PACKAGES_DIR}/lib/pcre2-posix.lib ${CURRENT_PACKAGES_DIR}/debug/lib/pcre2-posixd.lib)
file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/pcre2-posix.dll ${CURRENT_PACKAGES_DIR}/debug/bin/pcre2-posixd.dll)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/man)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/share/doc)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/man)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(COPY ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/pcre2)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/pcre2/COPYING ${CURRENT_PACKAGES_DIR}/share/pcre2/copyright)
