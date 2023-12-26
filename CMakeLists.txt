cmake_minimum_required(VERSION 3.19)

project(raylib_imgui_boilerplate VERSION 0.0.1)

# variable sets will be available to the `include` and `add_subdirectory` calls
set(GAME_NAME "imgui_template")

set(CMAKE_CXX_STANDARD 17)

# `set` can be used to overwrite default cmake variables, for example this
# puts the output into the bin folder. This may not be a great idea, but for this
# simple project, a top level bin folder works fine.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# I highly recommend putting all your library dependencies into their own cmake file.
# .cmake files included like this, are the exact same as #include in c++, it can be imagined purely
# as copy pasting the entire file into the location.

# This one consumes and runs the cmakelists.txt inside of the raylib git repo
include(cmake/raylib.cmake) 

# This one clones a git repo and creates a library from outside the source.
include(cmake/imgui.cmake)

# Same as above, except it also shows that you can link the previous two libraries without
# forward declaration
include(cmake/rlimgui.cmake)

# This is similar to include, but it finds its the cmakelists.txt itself.
add_subdirectory(game)