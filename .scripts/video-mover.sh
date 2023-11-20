#!/bin/bash

# Absolute path of folder the video is first downloaded in
downloadFolder=""

# Absolute path of folder to move the video into
finalFolder=""

# Name of desired final video file
# Make sure to add the full file extension
finalName=""

if [ -d ${downloadFolder} ]; then
	cd ${downloadFolder}
	recentFile=$(ls -Art | tail -n 1)
	if [ -d ${finalFolder} ]; then
		mv ./${recentFile} $finalFolder/$finalName
		echo "File move complete"
		exit
	fi
	echo "Error, final folder does not exist"
	exit
fi
echo "Error, download folder does not exist"
exit
