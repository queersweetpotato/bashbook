So basically the whole idea is that resource text is meant to be a string of 01010101 built up character by character
and each time command.sh is run it writes the opposite of the last character. This is meant to break when multiple scripts run simultaneously as 
the value of resource.txt will change inbetween the check for the last character and the write of a new character.

