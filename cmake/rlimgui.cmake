include(FetchContent)

# GIT_TAG main is needed for repositories that no longer use the "master" default branch name.
# GIT_TAG can refer to a branch name, or a commit hash to target an exact version.
FetchContent_Declare(
    rlimgui_external
    GIT_REPOSITORY https://github.com/raylib-extras/rlImGui.git
    GIT_TAG main
)


FetchContent_GetProperties(rlimgui_external)
if(NOT rlimgui_external_POPULATED)
    FetchContent_Populate(rlimgui_external)
endif()

# When populated, there are new variables added to the current cmake context
# such as x_SOURCE_DIR which lets you do the following to jury rig a git repo
# that isnt cmake, into a cmake library.
set(rlimgui_SRC_FILES
    "${rlimgui_external_SOURCE_DIR}/rlImGui.cpp"
)

add_library(rlimgui ${rlimgui_SRC_FILES})
target_link_libraries(rlimgui raylib imgui)
target_include_directories(rlimgui PUBLIC ${rlimgui_external_SOURCE_DIR})