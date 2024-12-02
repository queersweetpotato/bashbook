#!/bin/bash

# Acquires for specified resource if available, waits if unavailable
# Resource argument may include a path to the lock e.g. friend/wall.txt

if [[ $# -ne 1 ]] then
	echo "No resource specified, use ./acquire.sh resourcename"
	exit 1
fi

resource=$1 #first argument set to resource
lock=${resource}_lock #generates lockname based on resource name

while ! ln -s "$resource" "$lock" 2> /dev/null; do 
#attempts to acquire the lock every second, if unable it idles, forcing the process calling this script to wait until the lock is released
	sleep 1
done