#!/bin/bash

id=$1
if [ $# -lt 1 ] || [ $# -gt 1 ]; then
  exit 1
fi

if [ ! -d $id ]; then
  echo "nok: user '$id' does not exist"
  exit 1
fi

echo "start_of_file"
cat $id/wall.txt 
echo "end_of_file"
exit 0
