#!/bin/bash

mkfifo user_pipe

while true; do #loops infinitely  
  read -a arguments < user_pipe #receive input as an array from client.sh
  command=${arguments[0]}
  unset arguments[0]
  #splits the request to the server to a command used in the switch case and arguments to be passed to the selected command.
  case "$command" in
    create)
      ./create.sh ${arguments[@]} > server_pipe #send output to client.sh
      ;;
    add)
      ./add_friend.sh ${arguments[@]} > server_pipe
      ;;
    post)
      ./post_messages.sh ${arguments[@]} > server_pipe
      ;;
    display)
      ./display_wall.sh ${arguments[@]} > server_pipe
      ;;
    *)
    esac
  done

