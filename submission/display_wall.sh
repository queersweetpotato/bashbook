#!/bin/bash

id=$1

trap "./release.sh '$id/friends.txt'" EXIT #lock is released on exist so that none remain acquired if program is closed before finishing

if [ $# -lt 1 ] || [ $# -gt 1 ]; then
  exit 1
fi

if [ ! -d $id ]; then
  echo "nok: user '$id' does not exist"
  exit 1
fi

./acquire.sh "$id/wall.txt"

echo "start_of_file"
cat $id/wall.txt 
echo "end_of_file"
exit 0
