#!/bin/bash

sender=$1
receiver=$2

trap "./release.sh '$receiver/friends.txt'; ./release.sh '$receiver/walls.txt'" EXIT #lock is released on exist so that none remain acquired if program is closed before finishing

if [ $# -lt 3 ]; then
  exit 1
fi

if [ ! -d $sender ]; then
  echo nok: user '$sender' does not exist
  exit 1
fi

if [ ! -d $receiver ]; then
  echo nok: user '$receiver' does not exist
  exit 1
fi

./acquire.sh "$receiver/friends.txt"

if ! grep "^$sender" "$receiver"/friends.txt > /dev/null; then
  echo nok: users $sender and $receiver are not friends
  exit 1
fi

./acquire.sh "$receiver/wall.txt"

shift 2
echo "$sender: $@" >> $receiver/wall.txt
echo ok: message posted! 
exit 0
    
