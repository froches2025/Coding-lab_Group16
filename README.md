Hospital Monitoring Log System

The objective of this project is to develop an automated log management system that improves the healthcare monitoring through collecting, organizing and also analyzing the medical data. This will also show the proficiency use of shell scripting, log file processing and use of various linux command-line tools for data analysis.
This project simulates hospital monitoring devices and provides scripts to archive and analyze generated logs.

Components:
-Python simulators:
* heart-rate-monitor.py
* temperature-sensor.py
* water-consumption.py

Run simulators in separate terminals:
*python3 heart-rate-monitor.py start
*python3 temperature-sensor.py start
*python3 water-consumption.py start

- archive_logs.sh:
   * Interactive menu to select a log
   * Archives selected log with timestamp
   * Creates a new empty log for continued monitoring

- analyze_logs.sh:
   * Interactive menu to select a log
   * Counts entries per device
   * Records first and last log entries
   * Appends results to analysis_report.txt

Directory Structure:
hospital_data/
 ├── active_logs/
 ├── archived_logs/
 └── reports/

Core features

Data recording
The system gathers health data metrics and resource usage information in real time.

Log archiving and report generation
The system analyzes log files to calculate and see times a device has been used, showing also the first and last time it was used. These results are then inserted into a file that produces well detailed reports about the device statistics.

Skills and tools shown
* Use of interactive shell scripts with user menus
* Managing and processing log files 
* Data analysing using command-line tools such as awk, sort, grep and uniq.

