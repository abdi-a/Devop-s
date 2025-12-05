#!/bin/bash

# --- CHALLENGE: BACKUP SCRIPT ---
# Your task is to write a script that backs up a specific directory.

# 1. Define two variables:
SOURCE_DIR="src"
BACKUP_DIR="backups"

# 2. Check if the SOURCE_DIR exists.
# The ! means "NOT". So this reads: "If directory does NOT exist"
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# 3. If the SOURCE_DIR exists:
echo "Source directory found. Starting backup..."

# Create the BACKUP_DIR (if it doesn't exist).
mkdir -p "$BACKUP_DIR"

# Copy the contents. 
# To avoid overwriting, let's create a specific backup folder with date
CURRENT_DATE=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_PATH="${BACKUP_DIR}/src_backup_${CURRENT_DATE}"

cp -r "$SOURCE_DIR" "$BACKUP_PATH"

echo "Backup completed! Saved to: $BACKUP_PATH"
ls -l "$BACKUP_DIR"

