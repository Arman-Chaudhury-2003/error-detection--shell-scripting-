#!/bin/bash


LOG_DIR="/home/oreo/logs"
# APP_LOG_FILE="application.log"
# SYSTEM_LOG_FILE="system.log"
LOG_REPORT_FILE="/home/oreo/logs/log_report.txt"


ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "analysing log files" > "$LOG_REPORT_FILE"
echo "===========================================================" >> "$LOG_REPORT_FILE"

echo -e  "\nlist of log files updated in last 24 hours" >> "$LOG_REPORT_FILE"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo $LOG_FILES >> "$LOG_REPORT_FILE"

for LOG_FILE in $LOG_FILES; do
  echo -e  "\nseaching for "${ERROR_PATTERNS[0]}" in $LOG_FILE" >> "$LOG_REPORT_FILE"
  grep "${ERROR_PATTERNS[0]}" "$LOG_FILE" >> "$LOG_REPORT_FILE"

  echo -e "\nnumber of "${ERROR_PATTERNS[0]}" in $LOG_FILE" >> "$LOG_REPORT_FILE"
  grep -c "${ERROR_PATTERNS[0]}" "$LOG_FILE" >> "$LOG_REPORT_FILE"

  echo -e "\nnumber of "${ERROR_PATTERNS[1]}" in $LOG_FILE" >> "$LOG_REPORT_FILE"
  grep -c "${ERROR_PATTERNS[1]}" "$LOG_FILE" >> "$LOG_REPORT_FILE"
 
  echo -e "\nnumber of "${ERROR_PATTERNS[2]}" in $LOG_FILE" >> "$LOG_REPORT_FILE"
  grep -c "${ERROR_PATTERNS[2]}" "$LOG_FILE" >> "$LOG_REPORT_FILE"

  echo -e "\nsearching for "${ERROR_PATTERNS[2]}" in $LOG_FILE" >> "$LOG_REPORT_FILE"
  grep "${ERROR_PATTERNS[2]}" "$LOG_FILE" >> "$LOG_REPORT_FILE"
done

echo -e "\nLog analysis completed check "/home/oreo/logs/log_report.txt""