#!/bin/bash

#releases specified lock

if [[ $# -ne 1 ]] then
	echo "No resource with such name exists"
	exit 1
fi