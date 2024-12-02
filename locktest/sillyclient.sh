#!/bin/bash

#queries sillyserver to run simple commands
#

for i in $(seq 1 $#);
do
	echo ${args[$i]} > sillyserver_pipe
done