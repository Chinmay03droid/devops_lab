#!/bin/bash

# Script to count files and directories in the current folder

FILE_COUNT=$(ls -l | grep "^-" | wc -l)

DIR_COUNT=$(ls -l | grep "^d" | wc -l)

echo "Number of directories: $DIR_COUNT"

echo "Number of files: $FILE_COUNT"

