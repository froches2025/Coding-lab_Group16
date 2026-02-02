#!/bin/bash
# Script to analyze hospital logs and create reports

# Create archive folders if missing (prevents errors)
mkdir -p hospital_data/reports

# Show menu
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Set log file based on choice
case $choice in
  1) logfile="active_logs/heart_rate_log.log"; logname="Heart Rate" ;;
  2) logfile="active_logs/temperature_log.log"; logname="Temperature" ;;
  3) logfile="active_logs/water_usage_log.log"; logname="Water Usage" ;;
  *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

# Check log exists
printf "Checking for log file...\n"
if [ ! -f "$logfile" ]; then
  echo "Error: $logfile does not exist!"
  exit 1
fi

touch hospital_data/reports/analysis_report.txt

# Append analysis to report
printf "Creating report\n"
echo "Analysis for $logname on $(date)" >> hospital_data/reports/analysis_report.txt
echo "Device counts:" >> hospital_data/reports/analysis_report.txt

# Count devices
awk '{print $2}' "$logfile" | sort | uniq -c | wc -l >> hospital_data/reports/analysis_report.txt

# Get first and last timestamp
first_time=$(head -n 1 "$logfile" | awk '{print $2}')
last_time=$(tail -n 1 "$logfile" | awk '{print $2}')

echo "First entry: $first_time" >> hospital_data/reports/analysis_report.txt
echo "Last entry: $last_time" >> hospital_data/reports/analysis_report.txt
echo "--------------------------------------" >> hospital_data/reports/analysis_report.txt

printf "Report created successfully. Check hospital_data/reports/analysis_report.txt to view\n"
