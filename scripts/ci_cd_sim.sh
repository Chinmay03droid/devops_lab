#!/bin/bash

# Simple CI/CD simulation script

REPO_PATH="$HOME/devops_lab"
SRC_PATH="$REPO_PATH/src"
STAGING_PATH="$REPO_PATH/staging"
LOG_FILE="$REPO_PATH/logs/ci_cd.log"

cd "$REPO_PATH" || { echo "❌ Repo not found!"; exit 1; }

echo "🚀 Starting CI/CD pipeline at $(date)" >> "$LOG_FILE"

# Step 1: Check for Git changes

if [[ -n $(git status --porcelain) ]]; then

echo "📦 Detected changes. Running pipeline..." >> "$LOG_FILE"

else

echo "✅ No changes detected. Exiting pipeline." >> "$LOG_FILE"

exit 0

fi

# Step 2 : Run a mock test

echo "🧪 Running tests..." >> "$LOG_FILE"

python3 "$SRC_PATH/app.py" &>>"$LOG_FILE"

echo "✅ Tests passed!" >> "$LOG_FILE"

# Step 3: Deploy (copy files to staging)

echo "🚚 Deploying to staging..." >> "$LOG_FILE"

rsync -av --delete "$SRC_PATH/" "$STAGING_PATH/" &>> "$LOG_FILE"

echo "✅ Deployment completed"

# Step 4: Auto-commit and push

git add .

git commit -m "Auto CI/CD run on $(date '+%Y-%m-%d %H:%M:%S')" &>> "$LOG_FILE"

git push origin main &>> "$LOG_FILE"

echo "✅ CI/CD pipeline completed succcessfully at $(date)" >> "$LOG_FILE"

