include(FetchContent)

# Here GIT_TAG refers to a branch, a popular docking branch in imgui, rather than a commit hash.
FetchContent_Declare(
    imgui_external
    GIT_REPOSITORY https://github.com/ocornut/imgui.git
    GIT_TAG docking
)

# We're not here for the cmake files inside it, so lets make sure its been
# downloaded into our _deps, rather than letting CMake extract the CMakeLists.txt.
# We do this because imgui contains internal example projects that use Cmake,
# and we are not interested in them or the errors they cause without the correct environment.
FetchContent_GetProperties(imgui_external)
if(NOT imgui_external_POPULATED)
    FetchContent_Populate(imgui_external)
endif()

# When populated, there are new variables added to the current cmake environment
# such as x_SOURCE_DIR which lets you do the following to jury rig a git repo
# that isnt cmake, into a cmake target for you to use.
# also: Remember this is based on the declaration name `imgui_external` which we gave it earlier.
set(imgui_SRC_FILES
    "${imgui_external_SOURCE_DIR}/imgui_demo.cpp"
    "${imgui_external_SOURCE_DIR}/imgui_draw.cpp"
    "${imgui_external_SOURCE_DIR}/imgui_tables.cpp"
    "${imgui_external_SOURCE_DIR}/imgui_widgets.cpp"
    "${imgui_external_SOURCE_DIR}/imgui.cpp"
)

add_library(imgui STATIC ${imgui_SRC_FILES})
target_include_directories(imgui PUBLIC ${imgui_external_SOURCE_DIR})