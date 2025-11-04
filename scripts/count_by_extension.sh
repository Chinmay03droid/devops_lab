#!/bin/bash

# Script to count files by extension

read -p "Enter folder path: " folder
read -p "Enter file extension (e.g. .txt, .py): " ext

# Expand ~ to $HOME
folder="${folder/#\~/$HOME}"

# Add dot if missing

[[ $ext != .* ]] && ext = ".$ext"

# Check if folder exists
if [ ! -d "$folder" ]; then
    echo "❌ Folder not found!"
    exit 1
fi

# Count files
count=$(ls "$folder" | grep "$ext$" | wc -l)

echo "Number of files with extension '$ext' in $folder: $count"


