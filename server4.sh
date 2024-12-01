#!/bin/bash

while true; do #loops infinitely  
  read -a arguments < server_pipe #receive input as an array from client.sh
  echo "I received the command ${arguments[0]}"
  command=${arguments[0]}
  id=${arguments[1]}
  unset arguments[0]
  mkfifo ${id}_pipe
  #splits the request to the server to a command used in the switch case and arguments to be passed to the selected command.
  case "$command" in
    create)
      ./create.sh ${arguments[@]} > ${id}_pipe #send output to client.sh
      ;;
    add)
      ./add_friend.sh ${arguments[@]} > ${id}_pipe
      ;;
    post)
      ./post_messages.sh ${arguments[@]} > ${id}_pipe
      ;;
    display)
      ./display_wall.sh ${arguments[@]} > ${id}_pipe
      ;; 
    *)
    esac
  done

