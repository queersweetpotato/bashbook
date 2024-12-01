#!/bin/bash
if [[ $# -ne 1 ]] then
	exit 1
fi

id=$1

echo new $id > server.pipe
while true; do
	read line
	echo line > server.pipe
done