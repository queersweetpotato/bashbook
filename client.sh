#!/bin/bash

if [ ! $# -eq 1 ]; then
  exit 1
fi

id=$1
mkfifo user_pipe

echo "Accepted Commands: {create|add|post|display}"
while true; do #loops infinitely
  read -a arguments #reads user input as an array
  command=${arguments[0]} #create array command that stores the innputted comand
  command[1]=$id #add the id as the next field in the array
  unset arguments[0] #remove the command from the array arguments
  input+=( ${command[@]} ${arguments[@]} ) #create new array combining command and arguments
  echo ${input[@]} > user_pipe  #send this to server.sh through user_pipe
  read response < server_pipe #retrieve the output from server.sh
  echo $response
done
 
