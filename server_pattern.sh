#!/bin/bash

trap "rm -f server.pipe" EXIT
if [[ ! -p server.pipe ]]; then
    mkfifo server.pipe
fi

while true; do 
	read input < server.pipe
	echo $input
done