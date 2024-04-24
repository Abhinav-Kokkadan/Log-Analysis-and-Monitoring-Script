# Log Analysis and Monitoring Script
This script automates the analysis and monitoring of log files, fulfilling the requirements outlined in the DevOps Internship Assignment.
Usage
To use the script, run the following command:

bash: 
  ./log_monitor.sh <log_file>

  eg: ./log_monitor.sh text.txt
(Replace <log_file> with the path to the log file you want to monitor.)

Functionality:-
The script performs the following functionalities:
   * Continuously monitors a specified log file for new entries.
   * Uses tail to track and display new log entries in real time.
   * Allows you to stop the monitoring loop by pressing Ctrl+C.
   * Counts occurrences of specific keywords (error, warning, critical) in the log file.
   * Generates a summary report of keyword occurrences.
   * Backs up the log file with a timestamp in the backup directory.

Error Handling and Logging:
The script includes basic error handling and logging to provide feedback on script execution.

Additional Features:
 The script backs up the log file with a timestamp for historical data preservation.

Prerequisites:
 Bash shell environment.
 Log file to monitor.
