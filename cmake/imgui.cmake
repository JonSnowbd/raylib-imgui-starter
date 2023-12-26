include(FetchContent)

FetchContent_Declare(
    imgui_external
    GIT_REPOSITORY https://github.com/ocornut/imgui.git
    GIT_TAG docking
)

# We're not here for the cmake files inside it, so lets make sure its been
# downloaded into our _deps
FetchContent_GetProperties(imgui_external)
if(NOT imgui_external_POPULATED)
    FetchContent_Populate(imgui_external)
endif()

# When populated, there are new variables added to the current cmake context
# such as x_SOURCE_DIR which lets you do the following to jury rig a git repo
# that isnt cmake, into a cmake library.
set(imgui_SRC_FILES
    "${imgui_external_SOURCE_DIR}/imgui_demo.cpp"
    "${imgui_external_SOURCE_DIR}/imgui_draw.cpp"
    "${imgui_external_SOURCE_DIR}/imgui_tables.cpp"
    "${imgui_external_SOURCE_DIR}/imgui_widgets.cpp"
    "${imgui_external_SOURCE_DIR}/imgui.cpp"
)

add_library(imgui STATIC ${imgui_SRC_FILES})
target_include_directories(imgui PUBLIC ${imgui_external_SOURCE_DIR})