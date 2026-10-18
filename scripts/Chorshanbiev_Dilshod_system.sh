#!/bin/bash
# Student system information script
# Author: Dilshod Chorshanbiev, group IT2-2312

INFO_FILE="Chorshanbiev_Dilshod_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo ""
echo "Name: Dilshod"
echo "Surname: Chorshanbiev"
echo "Group: IT2-2312"
echo "Student ID: 31916"
echo ""
echo "=============================="
echo "System Information"
echo "=============================="
echo ""
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " used of " $2}')"
echo ""

# Look for the info file in the current dir and the project root
if [ -f "$INFO_FILE" ] || [ -f "../$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
