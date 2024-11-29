#!/bin/bash

if [ ! $# -eq 1 ]; then
  exit 1
fi

id = $1
echo "Accepted Commands: {create|add|post|display}"
while true; do #loops infinitely
  read request #reads user input
  command=$(cut -d ' ' -f1 < $request)
  arguments=$(cut -d ' ' -f1 --complement < $request)
  echo $command $id $arguments > $id_pipe #this is supposed to send the arguments through a pipe to be received from server.sh, I'm not sure if this works???
  #smth that reads the output of server.sh and gives user-friendly output accordingly
done
 
