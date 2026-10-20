#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Bakhyt_Diyar_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Diyar"
echo "Surname: Bakhyt"
echo "Group: IT2-2301"
echo "Student ID: 38310"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " used of " $2}')"
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
