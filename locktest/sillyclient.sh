#!/bin/bash

#queries sillyserver to run simple commands
if [[ $# -eq 0 ]] then
	exit 1
fi

for i in "$@"
do
	echo $i > sillyserver_pipe
done