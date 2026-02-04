#!/bin/bash

echo "Select the number that correspond to the log fileto analyze:"

echo "Menu"

echo "1) Heart Rate (heart_rate.log)"

echo "2) Temperature (temperature.log)"

echo "3) Water Usage (water_usage.log)"

echo "Enter choice (1-3)"

read user

case $user in
	1)
		echo "You have been redirected to the heart_rate.log"

		TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

		mv active_logs/heart_rate_log.log hospital_data/archived_logs/heart_data_archive/heart_rate_log_$TIMESTAMP.log

		touch active_logs/heart_rate_log.log

		echo "Successfully archived to heart_data_archive/heart_rate_$TIMESTAMP.log"

		;;
        2)
                echo "You have been redirected to the temperature.log"

		TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

		mv active_logs/temperature_log.log hospital_data/archived_logs/temperature_data_archive/temperature_log_$TIMESTAMP.log
		touch active_logs/temperature_log.log

		echo "Successfully archived to temperature_data_archive/temperature_$TIMESTAMP.log"

		;;

        3)
                echo "You have been redirected to the water_usage.log"

		TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

		mv active_logs/water_usage_log.log hospital_data/archived_logs/water_usage_data_archive/water_usage_log_$TIMESTAMP.log
		touch active_logs/water_usage_log.log

		echo "Successfully archived to water_usage_data_archive/water_usage_$TIMESTAMP.log"

		;;

esac
