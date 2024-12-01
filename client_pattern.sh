#!/bin/bash
if [[ $# -ne 1 ]] then
	exit 1
fi

id=$1

trap "rm -f $id.pipe" EXIT
if [[ ! -p $id.pipe ]]; then
    mkfifo $id.pipe
fi

while true; do
	read -a line
	output=( ${id[@]} ${line[@]} )
	echo ${output[@]}
	echo ${output[@]} > server.pipe

	read input < $id.pipe
	echo $input
done