# Include your source files explicitly like this as a good habit, set can be used to make a list by
# just specifying many arguments. New lines are fine, and make editing this sane.
# CMAKE_CURRENT_SOURCE_DIR is the most relevant CMakeLists.txt's directory, so therefore its 
# referring to the CMakeLists.txt in game/ here.
set(SRC 
    "${CMAKE_CURRENT_SOURCE_DIR}/src/game.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/igExtras.cpp"
)

# Accessing the variable set in the main CMakeLists.txt
add_executable(${GAME_NAME} ${SRC})
target_include_directories(${GAME_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")

# Here we link the actual libraries, you can find the real name of the library target
# by looking through the libraries CMakeLists.txt, or referring to the name you assigned it
# with your add_library() call.
target_link_libraries(${GAME_NAME} raylib imgui rlimgui)

# Windows specific configuration, disables the terminal on release builds.
if(WIN32)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(WIN32_RELEASE_FLAGS_1 "/ENTRY:mainCRTStartup")
        set(WIN32_RELEASE_FLAGS_2 "/SUBSYSTEM:WINDOWS")
    else()
        set(WIN32_RELEASE_FLAGS_1 "-Wl,--entry,mainCRTStartup")
        set(WIN32_RELEASE_FLAGS_2 "-Wl,--subsystem,windows")
    endif()
    
    target_link_options(
        ${GAME_NAME}
        PUBLIC $<$<CONFIG:Release>:${WIN32_RELEASE_FLAGS_1}>
        PUBLIC $<$<CONFIG:Release>:${WIN32_RELEASE_FLAGS_2}>
    )
endif()



