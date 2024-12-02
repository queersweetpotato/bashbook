#!/bin/bash
trap "rm -f server_pipe ; exit 0" SIGINT #closes pipe on interrupt signal (control c) and exits with success code 

if [[ ! -p server_pipe ]] then
    mkfifo server_pipe
  fi

while true; do #loops infinitely  
  read -a arguments < server_pipe #receive input as an array from client.sh
  command=${arguments[0]}
  id=${arguments[1]}
  unset arguments[0]
  #splits the request to the server to a command used in the switch case and arguments to be passed to the selected command.
  case "$command" in #check which command was used --> call the correct script
    create)
      ./create.sh ${arguments[@]} > ${id}_pipe & #send output to client.sh
      ;;
    add)
      ./add_friend.sh ${arguments[@]} > ${id}_pipe &
      ;;
    post)
      ./post_messages.sh ${arguments[@]} > ${id}_pipe &
      ;;
    display)
      ./display_wall.sh ${arguments[@]} > ${id}_pipe &
      ;; 
    *)
    esac
done

