#!/bin/bash

# Define directories
LOCAL_DOWNLOADS="/Users/phobrla/Downloads"
ICLOUD_DOWNLOADS="/Users/phobrla/Library/Mobile Documents/com~apple~CloudDocs/Downloads"

# Ensure LOCAL_DOWNLOADS is a real directory, not a symlink or file
if [ -L "$LOCAL_DOWNLOADS" ]; then
    echo "$LOCAL_DOWNLOADS is a symlink. Removing and creating a real directory."
    rm "$LOCAL_DOWNLOADS"
    mkdir -p "$LOCAL_DOWNLOADS"
elif [ -e "$LOCAL_DOWNLOADS" ]; then
    if [ -d "$LOCAL_DOWNLOADS" ]; then
        echo "$LOCAL_DOWNLOADS is already a directory."
    else
        echo "$LOCAL_DOWNLOADS exists but is not a directory. Removing and creating directory."
        rm -rf "$LOCAL_DOWNLOADS"
        mkdir -p "$LOCAL_DOWNLOADS"
    fi
else
    echo "$LOCAL_DOWNLOADS does not exist. Creating directory."
    mkdir -p "$LOCAL_DOWNLOADS"
fi

# Ensure ICLOUD_DOWNLOADS exists
if [ ! -d "$ICLOUD_DOWNLOADS" ]; then
    echo "$ICLOUD_DOWNLOADS does not exist. Creating directory."
    mkdir -p "$ICLOUD_DOWNLOADS"
fi

# Fix permissions for both directories (recursive u+rwx)
echo "Fixing permissions for $LOCAL_DOWNLOADS"
sudo chmod -R u+rwx "$LOCAL_DOWNLOADS"

echo "Fixing permissions for $ICLOUD_DOWNLOADS"
sudo chmod -R u+rwx "$ICLOUD_DOWNLOADS"

echo "Done."
