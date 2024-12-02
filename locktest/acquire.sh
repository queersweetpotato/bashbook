#!/bin/bash

# Acquires lock if available, waits if unavailable
if [[ $# -ne 1 ]] then
	echo "No resource specified"
	exit 1
fi

resource=$1
lock=${resource}_lock

while ! ln -s "$resource" "$lock"; do
	sleep 1
done

echo "FINISHED WAITING FOR LOCK $lock"

ln -s $resource $lock

echo "RELOCKED RESOURCE $resource with lock $lock"