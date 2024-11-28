#!/bin/bash
echo "Accepted Commands: {create|add|post|display}"
while true; do #loops infinitely
  read request #reads user input
  command=$(cut -f1 -d ' ' <<< $request)
  arguments=$(cut -f1 -d ' ' --complement <<< $request)
  #splits the request to the server to a command used
  #in the switch case and arguments to be passed to the selected
  #command.
  case "$command" in
    create)
      ./create.sh $arguments
      ;;
    add)
      ./add_friend.sh $arguments
      ;;
    post)
      ./post_messages.sh $arguments
      ;;
    display)
      ./display_wall.sh $arguments
      ;;
    *)
      echo "Accepted Commands: {create|add|post|display}"
 esac
done

