#!/bin/bash

#runs many instances of command.sh (which all manipulate resource.txt) in parallel

trap "rm -f sillyserver_pipe ; cat resource.txt" EXIT
if [[ ! -p sillyserver_pipe ]] then
	mkfifo sillyserver_pipe
fi

while true; do
	read input < sillyserver_pipe
	./command.sh $input & # runs command.sh instances asynchronously
done