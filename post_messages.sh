#!/bin/bash

sender=$1
receiver=$2

if [ $# -lt 3 ]; then
  exit 1
fi

if [ ! -d $sender ]; then
  echo nok: user $sender does not exist
  exit 1
fi

if [ ! -d $receiver ]; then
  echo nok: user $receiver does not exist
  exit 1
fi

input=$receiver/friends.txt
while read line; do
  if [ $line==$sender ]; then
    shift 2
    echo "$sender: $@" >> $receiver/wall.txt
    echo ok: message posted! 
    exit 0
  fi
done < $input
echo nok: users $sender and $receiver are not friends
exit 1      
