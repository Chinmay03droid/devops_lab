#!/bin/bash
# 🔧 Universal File Extension Renamer (safe version)

read -p "Enter folder path: " folder_path
read -p "Enter current file extension (e.g. .conf): " old_ext
read -p "Enter new file extension (e.g. .cfg): " new_ext

# Go to the given folder (handle ~ correctly)
cd ~/"${folder_path#\~\/}" 2>/dev/null || { echo "❌ Folder not found!"; exit 1; }

count=0
found=0

for f in *"$old_ext"; do
    # Skip if no matching files found
    [ -e "$f" ] || continue

    found=1
    new_name="${f%$old_ext}$new_ext"

    if [[ "$f" == "$new_name" ]]; then
        echo "⚠️ Skipped (same name): $f"
        continue
    fi

    mv "$f" "$new_name"
    echo "✅ Renamed: $f → $new_name"
    ((count++))
done

if [[ $found -eq 0 ]]; then
    echo "⚠️ No files found with extension $old_ext"
else
    echo "🎯 Done! Total renamed files: $count"
fi

