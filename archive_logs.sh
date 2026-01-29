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

		mv hospital_data/active_logs/heart_rate.log hospital_data/archives/heart_data_archive/heart_rate_$TIMESTAMP.log

		touch hospital_data/active_logs/heart_rate.log

		echo "Successfully archived to heart_data_archive/heart_rate_$TIMESTAMP.log"

		;;
        2)
                echo "You have been redirected to the temperature.log"

		TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

		mv hospital_data/active_logs/temperature.log hospital_data/archives/temperature_data_archive/temperature_$TIMESTAMP.log
		touch hospital_data/active_logs/temperature.log

		echo "Successfully archived to temperature_data_archive/temperature_$TIMESTAMP.log"

		;;

        3)
                echo "You have been redirected to the water_usage.log"

		TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

		mv hospital_data/active_logs/water_usage.log hospital_data/archives/water_usage_data_archive/water_usage_$TIMESTAMP.log
		touch hospital_data/active_logs/water_usage.log

		echo "Successfully archived to water_usage_data_archive/water_usage_$TIMESTAMP.log"

		;;

esac

