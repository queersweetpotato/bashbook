#!/bin/bash
while true; do #loops infinitely
  
  read -a arguments < ty_pipe
  command=${arguments[0]}
  unset arguments[0]
  #splits the request to the server to a command used
  #in the switch case and arguments to be passed to the selected
  #command.
  case "$command" in
    create)
      ./create.sh ${arguments[@]} 
      ;;
    add)
      ./add_friend.sh ${arguments[@]}
      ;;
    post)
      ./post_messages.sh ${arguments[@]}
      ;;
    display)
      ./display_wall.sh ${arguments[@]}
      ;; 
    *)
    esac
  done

