#!/bin/bash

#releases specified lock

if [[ $# -ne 1 ]] then
	echo "No resource specified"
	exit 1
fi

resource=$1
lock=${resource}_lock

echo $resource
echo $lock

rm -f "$lock"