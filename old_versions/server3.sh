#!/bin/bash

trap "rm -f server_pipe" EXIT
if [[ ! -p server_pipe ]]; then
    mkfifo server_pipe
fi

mkfifo user_pipe

while true; do #loops infinitely  
  read -a arguments < user_pipe #receive input as an array from client.sh
  echo Recieved message: $arguments
  command=${arguments[0]}
  unset arguments[0]
  #splits the request to the server to a command used in the switch case and arguments to be passed to the selected command.
  case "$command" in
    create)
      echo "recieved create command"
      ./create.sh ${arguments[@]} > server_pipe #send output to client.sh
      ;;
    add)
      echo "recieved add command"
      ./add_friend.sh ${arguments[@]} > server_pipe
      ;;
    post)
      echo "recieved post command"
      ./post_messages.sh ${arguments[@]} > server_pipe
      ;;
    display)
      echo "recieved display command"
      ./display_wall.sh ${arguments[@]} > server_pipe
      ;;
    *)
    esac
  done

