# Options.cmake


# Implemented 
option(PUGL_STATIC "Static build" ON)
option(BUILD_OPENGL "Enable support for the OpenGL graphics API" ON)

# Not implemented
option(BUILD_EXAMPLES "Build example programs" OFF)
option(BUILD_DOCS "Build documentation" OFF)
option(BUILD_DOCS_CPP "Attempt to build C++ documentation for development" OFF)
option(BUILD_STUB "Build stub backend" OFF)
option(SUPPORT_XCURSOR "Support changing the cursor on X11" OFF)
option(SUPPORT_XRANDR "Support accessing the refresh rate on X11" OFF)
option(SUPPORT_XSYNC "Support timers on X11" OFF)



# Outside scope (presently)
option(BUILD_TESTS "Build tests" OFF)
option(BUILD_VULKAN "Enable support for the Vulkan graphics API" OFF)
option(RUN_LINT "Run code quality checks" OFF)
option(BUILD_CAIRO "Enable support for the Cairo graphics API" OFF)
