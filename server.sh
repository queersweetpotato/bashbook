#!/bin/bash

while true; do #loops infinitely  
  read -a arguments < server_pipe #receive input as an array from client.sh
  command=${arguments[0]}
  unset arguments[0]
  id=${arguments[0]}
  mkfifo $id_pipe
  #splits the request to the server to a command used in the switch case and arguments to be passed to the selected command.
  case "$command" in
    create)
      ./create.sh ${arguments[@]} > $id_pipe #send output to client.sh
      ;;
    add)
      ./add_friend.sh ${arguments[@]} > $id_pipe
      ;;
    post)
      ./post_messages.sh ${arguments[@]} > $id_pipe
      ;;
    display)
      ./display_wall.sh ${arguments[@]} > $id_pipe
      ;; 
    *)
    esac
  done

