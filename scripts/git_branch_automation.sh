#!/bin/bash

# Git Branch Automation Script

REPO_PATH=~/devops_lab

cd "$REPO_PATH" || { echo "Repo not found!"; exit 1; }

BRANCH_NAME="auto-branch-$(date '+%Y-%m-%d')"

git checkout -b "$BRANCH_NAME"

echo "Version updated on $(date '%Y-%m-%d %H:%M:%S')" >> version.txt

git add version.txt
git commit -m "Update version.txt on $BRANCH_NAME"

git checkout main

git merge "$BRANCH_NAME" --no-edit

git push origin main

echo "✅ Branch $BRANCH_NAME created ,merged, and pushed successfully!"

