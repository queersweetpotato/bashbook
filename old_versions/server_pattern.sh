#!/bin/bash

trap "rm -f server.pipe" EXIT
if [[ ! -p server.pipe ]]; then
    mkfifo server.pipe
fi

while true; do 
	read input < server.pipe

	tok_input=($input)
	id=${tok_input[0]}
	command=${tok_input[1]}
	unset tok_input[0]
	unset tok_input[1]
	arguments=${tok_input[@]}

	case "$command" in
    create)
      echo "recieved create command"
      ./create.sh ${arguments[@]} > $id.pipe #send output to client.sh
      ;;
    add)
      echo "recieved add command"
      ./add_friend.sh ${arguments[@]} > $id.pipe
      ;;
    post)
      echo "recieved post command"
      ./post_messages.sh ${arguments[@]} > $id.pipe
      ;;
    display)
      echo "recieved display command"
      ./display_wall.sh ${arguments[@]} > $id.pipe
      ;;
    *)
    esac
done