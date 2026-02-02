#!/bin/bash
# Script to analyze hospital logs and create reports

# Create archive folders if missing (prevents errors)
mkdir -p hospital_data/archives/heart_data_archive
mkdir -p hospital_data/archives/temperature_data_archive
mkdir -p hospital_data/archives/water_data_archive
mkdir -p reports

# Show menu
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Set log file based on choice
case $choice in
  1) logfile="hospital_data/active_logs/heart_rate.log"; logname="Heart Rate" ;;
  2) logfile="hospital_data/active_logs/temperature.log"; logname="Temperature" ;;
  3) logfile="hospital_data/active_logs/water_usage.log"; logname="Water Usage" ;;
  *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

# Check log exists
if [ ! -f "$logfile" ]; then
  echo "Error: $logfile does not exist!"
  exit 1
fi

# Append analysis to report
echo "Analysis for $logname on $(date)" >> reports/analysis_report.txt
echo "Device counts:" >> reports/analysis_report.txt

# Count devices
awk '{print $2}' "$logfile" | sort | uniq -c >> reports/analysis_report.txt

# Get first and last timestamp
first_time=$(head -n 1 "$logfile" | awk '{print $1}')
last_time=$(tail -n 1 "$logfile" | awk '{print $1}')

echo "First entry: $first_time" >> reports/analysis_report.txt
echo "Last entry: $last_time" >> reports/analysis_report.txt
echo "--------------------------------------" >> reports/analysis_report.txt
