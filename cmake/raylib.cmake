# include can be used to include modules from cmake itself.
include(FetchContent)

# This simply declares `raylib_external` and where it is.
# Does not pull anything or populate any variables.
# Try to name it in a way that would avoid collisions, you're not
# naming the library here, just a target to a git repo.
FetchContent_Declare(
    raylib_external
    GIT_REPOSITORY https://github.com/raysan5/raylib.git
)

# MakeAvailable will do all the heavy lifting, it will pull the repo into
# your build
FetchContent_MakeAvailable(raylib_external)
