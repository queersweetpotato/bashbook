#!/bin/bash

#releases specified lock

if [[ $# -ne 1 ]] then
	echo "No resource specified, use ./release.sh resourcename"
	exit 1
fi

resource=$1
lock=${resource}_lock

rm -f "$lock" #removes shortcut file with the specified name, unlocking the resource