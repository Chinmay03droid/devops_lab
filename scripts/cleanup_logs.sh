#!/bin/bash

read -p "Do u want to delete all .log and .tmp files? (y/n): " choice

if [[ $choice == "y" ]]; then

report_file="$HOME/devops_lab/logs/cleanup_report.txt"

echo "Cleanup started..." > "$report_file"

for file in "$HOME/devops_lab/logs"/*.{log,tmp}; do

if [[ -f "$file" ]]; then

echo "Deleting:" $file

echo "Deleted: $(basename "$file")" >>"$report_file"

rm "$file"

fi

done

echo "Cleanup complete! Report saved to cleanup_report.txt"

else

echo "Cleanup cancelled." 
fi

