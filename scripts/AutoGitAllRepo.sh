#!/bin/bash

explore_directories() {
    local depth=$2
    local git_command=$1
    for dir in "$3"/*; do
        if [ -d "$dir" ]; then
            echo "----------Entering directory: $dir----------"
            cd "$dir"
            $git_command status  # Execute the dynamic git command
            if [ $depth -gt 1 ]; then
                explore_directories "$dir" $((depth - 1)) "$git_command"
            fi
            cd ..
            echo "Returning back to: $(pwd) 
            "
        fi
    done
}

# Set the maximum depth of exploration
max_depth=1


# Call the function with the current directory, maximum depth, and git command
explore_directories "$1" $max_depth "$(pwd)"
