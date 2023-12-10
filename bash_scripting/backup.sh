#!/bin/bash

#########################################################
# Author: Prisca Chidimma Maduka
# Date: Oct 25, 2023
# Version: 1.0
# Description: This script backs up and verifies that
#              the backup was successful
#
#########################################################

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Welcome screen
echo -e "${GREEN}"
echo "***************************************************"
echo "*                                                 *"
echo "*              BACKUP SCRIPT                      *"
echo "*                                                 *"
echo "***************************************************"
echo -e "${NC}"

# Main function
main()
{
    backup
    verify_backup
}

# Ask user for source dir
echo "Enter source directory (e.g /path/to/directory)"
read -p "Source dir: " SOURCE_DIR

# Check if dir exists and is a directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}Source directory does not exist${NC}"
    exit 1
fi

# Ask user for backup file
echo "Enter the file or directory you want to backup. Write '.' to backup the entire contents of the source dir (e.g file.py, /dir, .)"
read -p "File/Dir: " BACKUP_FILE

# Ask user for backup dir
echo "Enter the directory where you want to store the backup (e.g /path/to/directory)"
read -p "Backup dir: " BACKUP_DIR

# Check if backup dir exists and create it if not
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Directory could not be created${NC}"
        exit 1
    fi
fi

# Get the current date in the format YYYY-MM-DD
DATE=$(date +'%Y-%m-%d')

# Backup function
backup() {
    echo -e "${GREEN}Backing up...................................."

    # Determine the absolute path of the source file/directory
    ABS_SOURCE_FILE="$SOURCE_DIR/$BACKUP_FILE"

    # Check if the source file/directory exists
    if [ -e "$ABS_SOURCE_FILE" ]; then
        # Use the base name as part of the backup file name
        BASE_NAME=$(basename "$ABS_SOURCE_FILE")
        tar -czvf "$BACKUP_DIR/$BASE_NAME""_backup$DATE.tar.gz" -C "$SOURCE_DIR" "$BACKUP_FILE"
        if [ $? -ne 0 ]; then
            echo -e "${RED}Backup failed${NC}"
            exit 1
        fi
    else
        echo -e "${RED}The file or directory does not exist in the source directory.${NC}"
        exit 1
    fi
}

# Verify backup
verify_backup()
{
    echo -e "${GREEN}Verifying backup...................................."
    # Create temp dir
    temp_dir=$(mktemp -d)

    # Determine the absolute path of the source file/directory
    ABS_SOURCE_FILE="$SOURCE_DIR/$BACKUP_FILE"

    # Extract backup
    tar -xzvf "$BACKUP_DIR/$BASE_NAME""_backup$DATE.tar.gz" -C "$temp_dir"

    # Compare source and temp dir
    if [ -e "$temp_dir/$BACKUP_FILE" ]; then
        diff_output=$(diff -r "$ABS_SOURCE_FILE" "$temp_dir/$BASE_NAME")
        if [ -z "$diff_output" ]; then
            echo -e "${GREEN}Backup Verified. All good!"
        else
            echo -e "${RED}Backup failed"
            echo "$diff_output"
        fi
    else
        echo -e "${RED}The file or directory does not exist in the backup.${NC}"
    fi

    rm -rf "$temp_dir"
}

# Call the main function
main
