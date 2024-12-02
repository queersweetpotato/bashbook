#!/bin/bash

#runs simple commands in parallel, to test lock functionality
#these commands will have a long sleep time and many printouts so that it's obvious if locks are working or not
#locks will try to share resource.txt without race conditions