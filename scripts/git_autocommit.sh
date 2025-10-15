#!/bin/bash
# Git Auto Commit & Push Script
# Detects changes, commits, pushes to Github and logs all actions.

REPO_PATH=~/devops_lab

LOG_FILE=~/devops_lab/logs/git_activity.log

cd "$REPO_PATH" || { echo "❌ Repo not found!"; exit 1; }

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
COMMIT_MESSAGE="Auto commit at $TIMESTAMP"


# Check for changes

if [[ -n $(git status --porcelain) ]]; then

git add .

git commit -m "$COMMIT_MESSAGE"

# Push to github

git push origin main

echo " [$TIMESTAMP] ✅ Changes comitted & pushed: $COMMIT_MESSAGE" >> "$LOG_FILE"

echo "✅ Auto-commit & push successful!"


else

echo "[$TIMESTAMP] ⚡ No changes detected." >> "$LOG_FILE"
echo " ⚡ No changes to commit."
fi
