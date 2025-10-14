#!/bin/bash

# This script appends text to all .conf files and renames all of them to .cfg
for f in ~/devops_lab/scripts/*.conf; do
echo "Backup copied from configs" >> "$f"
mv "$f" "${f%.conf}.cfg"
done

