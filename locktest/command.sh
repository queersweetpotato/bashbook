#!/bin/bash

if [[ $# -ne 1 ]] then
	exit 1
fi

sleeptime=$1

str=$(cat resource.txt) #reads in file 
lastchar=${str:0-1} #gets last char

#sleep $sleeptime #sleeps here, maximising chance of something else overwriting file before it can write a new char

case $lastchar in #if stored lastchar is 0 write 1, if it is 1 write 0
	1)
		echo -n "0" >> resource.txt
		;;
	0)
		echo -n "1" >> resource.txt
		;;
	*)
esac