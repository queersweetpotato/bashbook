#!/bin/bash

if [[ $# -ne 1 ]] then
	exit 1
fi

sleeptime=$1

sleep $sleeptime 
str=$(cat resource.txt)  
case "${str:0-1}"  in
	1)
		echo -n "0" >> resource.txt
		;;
	0)
		echo -n "1" >> resource.txt
		;;
	*)
esac