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

# Update outdated PyPI packages in user-site
update_user_outdated_pip () {
	pip list --outdated --user --format=freeze | cut -d = -f 1 \
		| xargs -n1 pip install -U --user
}

# Update all outdated PyPI packages
update_outdated_pip () {
	# First, update packages in user-site
	update_user_outdated_pip && \
	pip list --outdated --format=freeze | cut -d = -f 1 \
		| xargs -n1 pip install -U
}

# Clean all .pyc files and __pycache__ directory
cleanpyc () {
	[ -d "__pycache__" ] && rm -r __pycache__
	rm *.pyc
}

# Quick-and-dirty conversion of all mp3 files in a folder to
# VBR 160k quality.
convert_audio_vbr () {
	for i in *.mp3; do
		# Convert everything
		ffmpeg -i "$i" -q:a 4 -threads 4 "${i%.*}_vbr.mp3";
	done
}

# Browsable dmesg output with colours
alias hdmesg='dmesg --color=always | less -R'
