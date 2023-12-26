# Raylib ImGui Boilerplate

Boilerplate build configuration for raylib and ImGui based projects,
with comments designed to help developers with knowledge in other 
languages learn cmake to build projects that use external libraries,
without making it a pain for windows users and the dreaded `find-package`

## Support

Tested and found working on:
- Windows x64 GCC/Mingw
- Windows x64 MSVC

## Credit
[Based on this project boilerplate](https://github.com/lucas-inacio/raylib_boilerplate)

Uses the following libraries:
- [Raylib](https://github.com/raysan5/raylib)
- [ImGui](https://github.com/ocornut/imgui)
- [RLImGui](https://github.com/raylib-extras/rlImGui)

## Required tools
- [CMake](https://cmake.org/)

## Building
From the repository's root directory type:
```shell
mkdir build
cd build
cmake ..
cmake --build . --config Release
```

## Details
* The project downloads dependencies at configuration time using CMake's FetchContent.
* Release configuration on Windows sets appropriate flags so no console window is used.