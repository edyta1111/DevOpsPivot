#!/bin/bash

# This script creates a new user on the local system.
# Provide username and full name as command-line arguments.
# The username, password, and the host for the account will be displayed.

# Verify if user is root
if [[ $UID -ne 0 ]]; then
	echo "Please run with sudo or as root." >&2
	exit 1
fi

# Verify if username was provided as an argument or provide help
if [[ "${#}" -lt 1  ]]; then
	echo "USAGE: ./add-new-local-user.sh USER_NAME [COMMENT]..." >&2
	exit 1
fi


# Save username
USERNAME="${1}"

# Save real name
COMMENT="${@:2}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create user
useradd -c "${COMMENT}" -m "${USERNAME}" &> /dev/null

# Check if useradd succeeded 
if [[ "${?}" -ne 0 ]]; then
	echo "Adding user was not successful. Please try again." >&2
	exit 1
fi

# Set password
echo "${PASSWORD}" | passwd --stdin "${USERNAME}" &> /dev/null 

# Check if passwd succeeded
if [[ "${?}" -ne 0 ]]; then
	echo "Setting password was not successful. Please try again." >&2
	exit 1
fi

# Force password expire
passwd -e "${USERNAME}" &> /dev/null

# Display the username, password, and the host where the user was created
echo "Created user:"
echo "Username: ${USERNAME}"
echo "Name: ${COMMENT}"
echo "Temp password: ${PASSWORD}"
echo "Host: ${HOSTNAME}"
exit 0
