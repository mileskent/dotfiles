bake() {
    local build_dir="build"

    if [[ "$1" == "help" ]] || [[ "$1" == "--help" ]]; then
        # Print usage instructions
        echo "Bake Usage:"
        echo "To build:                                       bake"
        echo "To clean build files:                           bake clean"
        echo "To build & run (assumes 'run' custom target):   bake run"
        echo "To purge (delete build):                        bake purge"
        return 0
    fi

    RUN=""
    if [[ "$1" == "run" ]]; then
        RUN="--target run"
    fi

    if [[ "$1" == "clean" ]]; then
        echo "Running cmake --build $build_dir --target clean..."
        cmake --build "$build_dir" --target clean || { echo "Bake: Clean failed"; return 1; }
        return 0
    fi

    if [[ "$1" == "purge" ]]; then
        echo "Bake: Purging the build directory: $build_dir"
        rm -rf "$build_dir" || { echo "Bake: Purge failed"; return 1; }
        echo "Bake: Build directory purged."
        return 0
    fi

    echo "Bake: Building CMake Project!"
    cmake -B "$build_dir" || { echo "Bake: CMake configuration failed"; return 1; }
    cmake --build "$build_dir" --parallel $RUN || { echo "Bake: Build failed"; return 1; }
}
