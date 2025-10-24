#!/bin/bash

SOURCE_DIR="$HOME"
TARGET_DIR="$(pwd)/dotfiles/home"

message() {
    echo -e "\n\033[1;34m>>> $1\033[0m"
}

message "Starting Synchronization: Live Dotfiles to Repository"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target 'configs' directory not found at $TARGET_DIR"
    exit 1
fi

message "Searching for dotfiles already tracked in the repository..."

find "$TARGET_DIR" -maxdepth 1 -mindepth 1 | while read -r REPO_ITEM_PATH; do
    
    ITEM_NAME=$(basename "$REPO_ITEM_PATH")
    
    LIVE_ITEM_PATH="$SOURCE_DIR/$ITEM_NAME"
    
    if [ -e "$LIVE_ITEM_PATH" ]; then
        echo "  + Updating: $ITEM_NAME"
        cp -rf "$LIVE_ITEM_PATH" "$REPO_ITEM_PATH"
        
    else
        echo "  ! Warning: Live item not found for '$ITEM_NAME' at $LIVE_ITEM_PATH. Skipping."
    fi

done

message "Synchronization complete! ✨"
echo "Remember to run 'git status' and 'git commit' to save these changes."