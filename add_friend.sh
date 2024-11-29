#!/bin/bash

id=$1
friend=$2

if [ $# -lt 2 ] || [ $# -gt 2 ]; then
  exit 1
fi

if [ ! -d $user ]; then
  echo "nok: user '$id' does not exist"
  exit 1
fi

if [ ! -d $friend ]; then
  echo "nok: friend '$friend' does not exist"
  exit 1
fi

if ! grep "^$friend" "$id"/friends.txt > /dev/null; then
  echo "$friend" >> "$id"/friends.txt
  echo "ok: friend added!"
  exit 0
fi


