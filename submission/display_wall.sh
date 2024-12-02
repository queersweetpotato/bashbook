#!/bin/bash

id=$1

trap "./release.sh '$id/friends.txt'" EXIT #lock is released on exist so that none remain acquired if program is closed before finishing

if [ $# -ne 1 ]; then #incorrect number of arguments
  exit 1
fi

if [ ! -d $id ]; then
  echo "nok: user '$id' does not exist"
  exit 1
fi

./acquire.sh "$id/wall.txt" #get the respective wall lock

#output file with formating
echo "start_of_file"
cat $id/wall.txt 
echo "end_of_file"
exit 0
