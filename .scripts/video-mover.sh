#!/bin/bash

# Absolute path of folder the video is first downloaded in
downloadFolder=""

# Absolute path of folder to move the video into
finalFolder=""

# Name of desired final video file
# Make sure to add the full file extension
finalName=""

################################################
###                                          ###
###  Below is the code, above is the config  ###
###                                          ###
################################################

if [ -z "${downloadFolder}" ] || [ -z "$finalFolder" ] || [ -z "$finalName" ]; then
	echo "Error, script not set up properly! Please configure the script before running."
	exit
elif ! [ -d "${downloadFolder}" ]; then
	echo "Error, download folder does not exist"
	exit
elif ! [ -r "${downloadFolder}" ]; then
	echo "Error, download folder cannot be read. Please adjust folder permissions"
	exit
elif ! [ -d "${finalFolder}" ]; then
	echo "Error, final folder does not exist"
	exit
elif ! [ -w "${finalFolder}" ]; then
	echo "Error, final folder cannot be written to. Please adjust folder permissions"
	exit
fi

cd "${downloadFolder}" || exit

recentFile=$(find . -maxdepth 1 -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ")

if [ -z "${recentFile}" ]; then
	echo "Error, no files found to move"
	exit
fi

mv "${recentFile}" "$finalFolder"/"$finalName"

echo "File move complete"
exit
