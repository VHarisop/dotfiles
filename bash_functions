#!/usr/bin/bash

# starts eclim when a user logs in
# Put this at the bottom of your .bashrc and make sure
# $ECLIPSE_HOME has been exported correctly!
eclim_start() {
	# check if Xvfb is running
	ps cax | grep -e "Xvfb" > /dev/null
	if [ $? -eq 0 ]; then
		echo "Xvfb is running!"
	else
		Xvfb :1 -screen 0 1024x768x24 &>/dev/null &
		echo "Startd Xvfb!"
	fi

	# check if eclim is running
	ps aux | grep -E "java.*eclim" | grep -v "grep" > /dev/null
	if [ $? -eq 0 ]; then
		echo "Eclim is running!"
	else
		# start eclimd, put it in the background
		DISPLAY=:1 $ECLIPSE_HOME/eclimd -b &>/dev/null
		echo "Started Eclim!"
	fi
}

# Usage: t_push <remote>
# If inside a git repo, pushed to the testing branch
# of the given remote
t_push() 
{
	[ -d .git ] && git push $1 testing
}

# Browsable dmesg output with colours
alias hdmesg='dmesg --color=always | tail -R'
