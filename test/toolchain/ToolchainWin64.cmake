set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR "64")
set(ARCH_TYPE
    "64"
    CACHE STRING "")

set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc-posix)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++-posix)
set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)

set(TOOLCHAIN_COMPILE_OPTIONS
    "-O2 -Wa,-mbig-obj -static -static-libgcc -static-libstdc++ -lgcc -lstdc++ -Wl,-Bstatic -lpthread"
    CACHE STRING "Compile options specified by the toolchain file")
set(TOOLCHAIN_LINK_OPTIONS
    "-Bstatic -static-libgcc -static-libstdc++"
    CACHE STRING "Compile options specified by the toolchain file")

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static -static-libgcc -static-libstdc++")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
