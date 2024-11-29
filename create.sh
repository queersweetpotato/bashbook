#!/bin/bash
if [ $# -gt 1 ]; then
  exit 1
fi

if [ $# -eq 0 ]; then
  echo nok: no identifier provided
  exit 1
fi

if [ -d $1 ]; then
  echo nok: user already exists
  exit 1
fi

mkdir $1
touch $1/friends.txt
touch $1/wall.txt
echo ok: user created!
exit 0
