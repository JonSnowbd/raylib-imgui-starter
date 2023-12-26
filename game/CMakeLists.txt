set(SRC 
    "${CMAKE_CURRENT_SOURCE_DIR}/src/game.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/igExtras.cpp"
)

add_executable(${GAME_NAME} ${SRC})
target_include_directories(${GAME_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${GAME_NAME} raylib imgui rlimgui)

# Windows specific configuration
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



