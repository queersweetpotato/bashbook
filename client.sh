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
  #echo $response
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
    #"nok: friend '$friend' does not exist")
      #echo "ERROR: user '$friend' does not exist"
      #;;
    "ok: friend added!")
      echo "SUCCESS: friend added!"
      ;;
    "nok: user $id does not exist")
      echo "ERROR: user $id does not exist"
      ;;
    #"nok: user ${arguments[2]} does not exist")
      #echo "ERROR: user ${arguments[2]} does not exist"
      #;;
    "ok: message posted!")
      echo "SUCCESS: message posted!"
      ;;
    #"nok: users $id and ${arguments[2]} are not friends")
      #echo "ERROR: users $id and ${arguments[2]} are not friends"
      #;;
    "nok: user '$id' does not exist")
      echo "ERROR:  user '$id' does not exist"
      ;;
    #"start_of_file")
      #cat $id/wall.txt
      #;;
    *)
     ;;
  esac
done
 
