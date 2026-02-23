#!/bin/bash


# This script executes all arguments as a single command on every server listed in the /vagrant/servers file by default.

# =============================================================================
# SETUP GUIDE
# =============================================================================
#
# 1. MAP HOSTNAMES TO IP ADDRESSES
#    Edit /etc/hosts on your local machine:
#      sudo nano /etc/hosts
#
#    Add a line for each server:
#      10.8.9.10  server01
#      10.8.9.11  server02
#
#    Now you can use 'server01' instead of '10.8.9.10' everywhere.
#
# 2. GENERATE AN SSH KEY PAIR (if you don't have one already)
#      ssh-keygen
#
#    Accept the default location (~/.ssh/id_rsa) and leave the
#    passphrase empty so the script can connect without interaction.
#
# 3. COPY YOUR PUBLIC KEY TO EACH SERVER
#    If the remote user matches your local user:
#      ssh-copy-id server01
#
#    If the remote user is different:
#      ssh-copy-id user01@server01
#
#    Repeat for each server in your server list.
#
# 4. CONFIGURE THE SERVER LIST FILE
#    Default location: /vagrant/servers
#    Add one entry per line. Use bare hostname or user@hostname:
#      server01
#      user01@server01   # use this if remote user differs from local user
#      server02
#
#    Or specify a custom file at runtime with the -f flag:
#      ./run-everywhere -f /tmp/myservers uptime
#
# 5. TEST YOUR CONNECTION MANUALLY BEFORE USING THE SCRIPT
#      ssh server01 uptime
#      ssh user01@server01 uptime
#
# =============================================================================

# Initial exit status.
EXIT_STATUS='0'

# A list of servers, one per line.
SERVER_LIST='/vagrant/servers'

# Options for the ssh command.
SSH_OPTIONS='-o ConnectTimeout=2'

usage() {
	echo "Usage: ${0} [-nsv] [-f FILE] COMMAND"
	echo "Executes COMMAND as a single command on every server."
	echo "	-f FILE Specify different FILE for the list of servers. Default: /vagrant/servers."
	echo "	-n Dry run mode. Display the COMMAND that would have been executed and exit."
	echo "	-s Execute the COMMAND using sudo on the remote server."
	echo "	-v Verbose mode. Displays the server name before executing COMMAND."
	exit 1
}

# Make sure the script is not being executed with superuser privileges.
if [[ "${UID}" -eq 0 ]]
then 
	echo 'Do not execute this script as root. Use the -s option instead.' >&2
	usage
	exit 1
fi

# Parse the options.
while getopts f:nsv OPTION
do 
	case ${OPTION} in 
		f) SERVER_LIST="${OPTARG}" ;;
		n) DRY_RUN='true' ;;
		s) SUDO='sudo' ;;
		v) VERBOSE='true' ;;
		?) usage ;;
	esac
done

# Remove the options while shifting the remaining arguments.
shift "$(( OPTIND - 1 ))"

# If the user doesn't supply at least one argument, give them hint.
if [[ "${#}" -lt 1 ]]
then 
	usage
	exit 1
fi

# Build the command from all remaining positional arguments after option parsing.
# All arguments are treated as a single command to be executed on each remote server.
COMMAND="${@}"

# Make sure the server list exists
if [[ ! -e "${SERVER_LIST}" ]]
then 
	echo "Cannot open the server list file ${SERVER_LIST}" >&2
	exit 1
fi

# Loop through server list.
for SERVER in $(cat $"{SERVER_LIST}")
do
	if [[ "${VERBOSE}" = 'true' ]]
	then 
		echo "${SERVER}"
	fi

	SSH_COMMAND="ssh ${SSH_OPTIONS} ${SERVER} ${SUDO} ${COMMAND}"

	# If it's a dry run, don't execute anything, just echo it.
	if [[ "${DRY_RUN}" = 'true' ]]
	then 
		echo "DRY RUN: ${SSH_COMMAND}"
	else
		${SSH_COMMAND}
		SSH_EXIT_STATUS="${?}"

		# Capture any non-zero exit status and report it to the user.
		if [[ "${SSH_EXIT_STATUS}" -ne 0 ]]
		then
			EXIT_STATUS="${SSH_EXIT_STATUS}"
			echo "Execution on server ${SERVER} failed." >&2
		fi
	fi
done

exit ${EXIT_STATUS}


