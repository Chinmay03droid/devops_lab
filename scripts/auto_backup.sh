#!/bin/bash

# Automated Backup Script

SOURCE_DIR=~/devops_lab
BACKUP_DIR=~/devops_lab/backups
LOG_FILE=~/devops_lab/logs/backup_report.txt

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')

tar -czf "$BACKUP_DIR/devops_lab_backup_$TIMESTAMP.tar.gz" -C "$SOURCE_DIR" $(ls "$SOURCE_DIR")

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup created: devops_lab_backup_$TIMESTAMP.tar.gz" >> "$LOG_FILE"

echo "✅ Backup created successfuly!"
