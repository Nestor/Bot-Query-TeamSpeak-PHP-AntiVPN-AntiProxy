
#! /bin/bash

while true;do
    pgrep start >  /dev/null 2>&1
    	if [ "$?" != "0" ];then
    		php bot.php
    		
    	fi
    sleep 60 
done
