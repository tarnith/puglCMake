cmake_minimum_required(VERSION 3.5)

project(puglCMake)

include(Options.cmake)


# Common sources 
set(COMMON_SOURCES
    pugl/src/common.c 
    pugl/src/internal.c
 
)

# Common header imports 
set(COMMON_HEADERS 
    pugl/src/attributes.h
    pugl/src/macros.h
    pugl/src/platform.h
    #src/stub.h
    pugl/src/types.h

)

# Platform-specific source files

# Need logic for which backend here based on opts
if (WIN32)
    set(PLATFORM_SOURCES
        pugl/src/win.c
        pugl/src/win_gl.c
        #src/win_stub.c
    )
    find_library(USER32_LIBRARY user32)
    find_library(SHLWAPI_LIBRARY shlwapi)
    find_library(DWMAPI_LIBRARY dwmapi)

if(NOT USER32_LIBRARY)
    message(FATAL_ERROR "user32 library not found")
endif()

if(NOT SHLWAPI_LIBRARY)
    message(FATAL_ERROR "shlwapi library not found")
endif()

if(NOT DWMAPI_LIBRARY)
    message(FATAL_ERROR "dwmapi library not found")
endif()


# Not implemented TODO
elseif (APPLE)
    set(PLATFORM_SOURCES
      
    )
elseif (UNIX)
    set(PLATFORM_SOURCES
      
    )
endif ()

# This is temporary, until static/dynamic is implemented. Only builds static for now TODO 
if(NOT DEFINED PUGL_STATIC)
  set(PUGL_STATIC ON)
endif()

if(PUGL_STATIC)

# Create the static library
add_library(pugl_static STATIC ${COMMON_SOURCES} ${COMMON_HEADERS} ${PLATFORM_SOURCES})
target_compile_definitions(pugl_static PRIVATE PUGL_STATIC)
find_package(OpenGL REQUIRED)
if(WIN32)

add_compile_definitions(
    -DWINVER=0x0500
    -D_WIN32_WINNT=0x0500
    -DWIN32_LEAN_AND_MEAN
    -DNOGDICAPMASKS
    -DNOSYSMETRICS
    -DNOKEYSTATES
    -DOEMRESOURCE
    -DNOATOM
    -DNOCOLOR
    -DNODRAWTEXT
    -DNOKERNEL
    -DNOMB
    -DNOMEMMGR
    -DNOMETAFILE
    -DNOMINMAX
    -DNOOPENFILE
    -DNOSCROLL
    -DNOSERVICE
    -DNOSOUND
    -DNOWH
    -DNOCOMM
    -DNOKANJI
    -DNOHELP
    -DNOPROFILER
    -DNODEFERWINDOWPOS
    -DNOMCX
)
target_link_libraries(pugl_static PRIVATE ${USER32_LIBRARY} ${SHLWAPI_LIBRARY} ${DWMAPI_LIBRARY} OpenGL::GL)
endif()



# Include directories
target_include_directories(pugl_static
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/pugl/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/pugl/bindings/cpp/include/>
    $<INSTALL_INTERFACE:pugl/include>
)

endif()
