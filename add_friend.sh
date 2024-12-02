#!/bin/bash

id=$1
friend=$2

trap "./release.sh '$id/friends.txt'" EXIT

if [ $# -lt 2 ] || [ $# -gt 2 ]; then
  exit 1
fi

if  [ ! -d $id ]; then
  echo "nok: user '$id' does not exist"
  exit 1
fi

if [ ! -d $friend ]; then
  echo "nok: user '$friend' does not exist"
  exit 1
fi

./acquire.sh "$id/friends.txt"

if ! grep "^$friend" "$id"/friends.txt > /dev/null; then
  echo "$friend" >> "$id"/friends.txt
  echo "ok: friend added!"
  exit 0
fi


