# bashbook

This assignment is supposed to mimic a social media application such as Facebook. In order to use it, one should first give themselves proper permissions for all scripts. Then start running server.sh (no arguments) in one terminal window and client.sh (one argument; the user ID) in one or more other terminal windows. Input commands into the client terminals to use the application.


Guide on specific commands:

create - this creates a user. It takes no arguments and must be run before any other commands.

add - this makes a user friends with another user. It takes one command, the ID of the user that the client would like to be friends with. Friendship is not symmetrical, so if two users would like to be friends with each other they must each send a friend request. Users can friend themselves if they wish.

post - this posts a message onto a user's wall. It takes two or more commands, first the ID of the user that the client would like to send a message to, and the remaining arguments are the messages. In order to post onto someone's wall, you must be on their friends list.

display - this displays a user's wall. It takes no arguments and prints out the current client's wall.

