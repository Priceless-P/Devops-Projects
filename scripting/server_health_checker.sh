#!/bin/bash

#########################################################
# Author: Prisca Chidimma Maduka
# Date: Oct 13, 2023
# Version: 1.1
# Description: This script automates the collection
#              and reporting of system metrics and
#              status health information.
#########################################################

# Configuration Variables
SLACK_API_ENDPOINT="https://slack.com/api/files.upload"
SLACK_BEARER_TOKEN="Bearer YOUR_SLACK_API_TOKEN"
SLACK_CHANNELS="CHANNEL_ID"  # You can specify multiple channels separated by commas if needed
SLACK_INITIAL_COMMENT="Server health check completed for server: $SERVERS"

log_message() {
    current_date=$(date +"%Y-%m-%d")
    log_file="/path/to/log_directory/health_checker_${current_date}_$2.txt"
    echo "$current_date - $1" >> "$log_file"
}

check_server_health() {
    SERVER=$1
    read -p "Enter the path to your SSH key file for $SERVER: " SSH_KEY_PATH

    # Check if the SSH key file exists
    if [ ! -f "$SSH_KEY_PATH" ]; then
        echo "SSH key file does not exist: $SSH_KEY_PATH"
        return
    fi

    # Collect server health information and store it
    SERVER_RESPONSE=$(ssh -i "$SSH_KEY_PATH" "$SERVER" "
        MEMORY=\$(free -h)
        CPU=\$(mpstat -P ALL)
        DISK=\$(df -h)
        NETWORK=\$(netstat -i)
        UPTIME=\$(uptime)
        SECURITY_UPGRADES=\$(sudo apt list --upgradable)
        OPEN_PORT=\$(netstat -tuln)
        LOG=\$(tail -5 /var/log/syslog)
        echo \"Memory Usage:
\$MEMORY

CPU Usage:
\$CPU

Disk Usage:
\$DISK

Network Usage:
\$NETWORK

Uptime:
\$UPTIME

Security Updates available:
\$SECURITY_UPGRADES

Open Ports:
\$OPEN_PORT

Recent Log Errors:
\$LOG\"
")

    # Log the server health information
    log_message "Server: $SERVER" "$SERVER"
    log_message "$SERVER_RESPONSE" "$SERVER"
}

# Prompt user to enter servers to check
echo "Enter the list of servers to be checked (comma separated, e.g., server1,server2):"
read -p "Servers: " SERVERS

IFS=',' read -ra SERVER_LIST <<< "$SERVERS"

for SERVER in "${SERVER_LIST[@]}"; do
    check_server_health "$SERVER"
done

# Send logs to Slack
for SERVER in "${SERVER_LIST[@]}"; do
    current_date=$(date +"%Y-%m-%d")
    FILE_PATH="/path/to/log_directory/health_checker_${current_date}_$SERVER.txt"
    echo "Log file path: $FILE_PATH"
    # Send the file as an attachment using curl
    if [ -f "$FILE_PATH" ]; then
        echo "Sending Slack message for $SERVER"
        curl -F "file=@$FILE_PATH" -F "initial_comment=$SLACK_INITIAL_COMMENT" -F "channels=$SLACK_CHANNELS" -H "Authorization: $SLACK_BEARER_TOKEN" "$SLACK_API_ENDPOINT"
        echo "Slack message sent for $SERVER"
    fi
done

echo "Done. Check Slack channel for output"
