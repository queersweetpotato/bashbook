#!/bin/bash

if [ ! $# -eq 1 ]; then #insufficent args
  exit 1
fi

id=$1
trap "rm -f ${id}_pipe ; exit 0" SIGINT #close pipe on interupt signal (control c) and exits with success code

  if [[ ! -p ${id}_pipe ]] then #only makes pipe if one doesn't exit (avoids annoying error message)
    mkfifo ${id}_pipe
  fi

while true; do #loops infinitely
  echo "Accepted Commands: {create|add|post|display}"
  read -a arguments #reads user input as an array

  command=${arguments[0]} #create array command that stores the inputted comand
  command[1]=$id #add the id as the next field in the array
  unset arguments[0] #remove the command from the array arguments
  input=( ${command[@]} ${arguments[@]} ) #create new array combining command and arguments

  echo ${input[@]} > server_pipe  #send this to server.sh through user_pipe

  read response < ${id}_pipe #receive the output
  case "$response" in
    "nok: user already exists")
      echo "ERROR: user already exists"
      ;;
    "ok: user created!")
      echo "SUCCESS: user created!"
      ;;
    "nok: user '$id' does not exist")
      echo "ERROR: user '$id' does not exist"
      ;;
    "ok: friend added!")
      echo "SUCCESS: friend added!"
      ;;
    "nok: user '${input[2]}' does not exist")
      echo "ERROR: user '${input[2]}' does not exist"
      ;;
    "ok: message posted!")
      echo "SUCCESS: message posted!"
      ;;
    "nok: users $id and ${input[2]} are not friends")
      echo "ERROR: users $id and ${input[2]} are not friends"
      ;;
    "start_of_file")
      cat $id/wall.txt
      ;;
    *)
     ;;
  esac
done
