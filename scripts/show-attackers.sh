#!/bin/bash

# This script counts failed login attempts by IP address. The script doesn't take into account any private IP addresses. 
# If there are any IPs with over LIMIT failures, display the count, IP, and location.
# Use fake-secure.log to test the script.

LIMIT='2'
LOG_FILE="${1}"

# Make sure a log file was supplied as an argument.
if [[ ! -e "${LOG_FILE}" ]]
then
	echo "Please provide log file as an argument. Use fake-secure.log to test the script." <&2
	exit 1
fi

# Display the CSV header.
echo 'Count,IP,Location'

# Loop through the list of failed attempts and corresponding email addresses
grep Failed $LOG_FILE | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
	# If the number of failed attempts is greater than the limit, display count, IP, and location.
	if [[ "${COUNT}" -gt "${LIMIT}" ]]
	then
		# Skip private IP ranges
		if [[ "${IP}" =~ ^10\. ]] || \
		   [[ "${IP}" =~ ^192\.168\. ]] || \
		   [[ "${IP}" =~ ^172\.(1[6-9]|2[0-9]|3[0-1])\. ]] || \
		   [[ "${IP}" =~ ^123\. ]]
		then
			continue
		fi

		LOCATION=$(curl -s ipinfo.io/${IP}/country)
		echo "${COUNT},${IP},${LOCATION}"
	fi
done
exit 0
