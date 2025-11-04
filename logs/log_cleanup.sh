#!/bin/bash

# Directory containing logs

LOG_DIR=~/devops_lab/logs

BACKUP_DIR=/tmp/log_backups

mkdir -p "$BACKUP_DIR"

old_logs=$(find "$LOG_DIR" -type f -name "*.log" -mtime +7)

if [ -z "$old_logs" ]; then
echo "No old logs found to archive"
exit 0
fi

# Create timestamped acheieve file

archive_name="logs_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Compress old logs

tar -czf "$BACKUP_DIR/$archive_name" $old_logs

# Verify compressions and delete old logs

if [ $? -eq 0 ]; then
echo "Backup successful: $BACKUP_DIR/$archive_name"
echo "Deleting old logs..."
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -delete

else

echo "Backup failed!"
exit 1

fi

echo "Archived and deleted old logs successfully."
echo "Files included in the backup:"
tar -tzf "$BACKUP_DIR/$archive_name"
