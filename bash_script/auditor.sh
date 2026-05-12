#!/bin/bash

# Store username and current date in variables
USERNAME=$(whoami)
CURRENT_DATE=$(date)

# Check disk usage. Get the % for the root directory /
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

# Check if directory /tmp/backup exists, if not create it
if [ ! -d "/tmp/backup" ]; then
  mkdir -p /tmp/backup
  DIR_STATUS="Directory /tmp/backup was created"
else
  DIR_STATUS="Directory /tmp/backup already exists"
fi

# Check disk usage and print warning if above 80%
if [ "$DISK_USAGE" -gt 80 ]; then
  DISK_STATUS="WARNING: Disk usage is ${DISK_USAGE}% which is above 80%"
else
  DISK_STATUS="Disk usage is ${DISK_USAGE}% - OK"
fi

# Output everything to a report file with your name
REPORT_FILE=“report_chidiebere.txt”

echo "System Audit Report" > $REPORT_FILE
echo "User: $USERNAME" >> $REPORT_FILE
echo "Date: $CURRENT_DATE" >> $REPORT_FILE
echo "$DISK_STATUS" >> $REPORT_FILE
echo "$DIR_STATUS" >> $REPORT_FILE

echo "Report saved to $REPORT_FILE"
