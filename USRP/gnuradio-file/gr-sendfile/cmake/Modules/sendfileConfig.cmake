INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_SENDFILE sendfile)

FIND_PATH(
    SENDFILE_INCLUDE_DIRS
    NAMES sendfile/api.h
    HINTS $ENV{SENDFILE_DIR}/include
        ${PC_SENDFILE_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    SENDFILE_LIBRARIES
    NAMES gnuradio-sendfile
    HINTS $ENV{SENDFILE_DIR}/lib
        ${PC_SENDFILE_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SENDFILE DEFAULT_MSG SENDFILE_LIBRARIES SENDFILE_INCLUDE_DIRS)
MARK_AS_ADVANCED(SENDFILE_LIBRARIES SENDFILE_INCLUDE_DIRS)

