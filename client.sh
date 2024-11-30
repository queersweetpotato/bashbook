#!/bin/bash

if [ ! $# -eq 1 ]; then
  exit 1
fi

id=$1
mkfifo ty_pipe

echo "Accepted Commands: {create|add|post|display}"
while true; do #loops infinitely
  read -a arguments #reads user input
  command=${arguments[0]}
  command[1]=$id
  unset arguments[0]
  input+=( ${command[@]} ${arguments[@]} )
  echo ${input[@]} > ty_pipe  
  read response < server_pipe
  echo $response
done
rm ty_pipe 
