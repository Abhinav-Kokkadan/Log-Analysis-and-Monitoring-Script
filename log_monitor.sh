#!/bin/bash

# Check if the user provided a log file as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <log_file>"
  exit 1
fi

LOG_FILE="$1"
BACKUP_DIR="backup"
KEYWORDS=("error" "warning" "critical")

# Function to count occurrences of keywords in the log file
count_keywords() {
  local keyword="$1"
  grep -o -i "${keyword}" "${LOG_FILE}" | wc -l
}

# Function to display new log entries in real time
tail_log() {
  tail -Fn0 "${LOG_FILE}" | while read LINE; do
    echo "New entry: ${LINE}"
  done
}

# Function to generate a summary report of keyword occurrences
generate_summary() {
  echo "Summary report:"
  for keyword in "${KEYWORDS[@]}"; do
    echo "- ${keyword}: $(count_keywords "${keyword}")"
  done
}

# Function to backup the log file with a timestamp
backup_log() {
  local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
  local backup_file="${BACKUP_DIR}/${LOG_FILE}_${timestamp}"
  cp "${LOG_FILE}" "${backup_file}"
  echo "Log file backed up to ${backup_file}"
}

# Main loop to monitor the log file and perform analysis
while true; do
  clear
  echo "Monitoring log file: ${LOG_FILE}"
  tail_log &
  sleep 5
  clear
  echo "Performing analysis on ${LOG_FILE}"
  generate_summary
  read -p "Press [Enter] to continue or Ctrl+C to exit..."
  backup_log
done
