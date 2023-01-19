#!/bin/bash

case $1 in
 start)
	echo "Service started"
	sleep 999
 ;;
 stop)
	let idProc=$(pgrep -f my_service_case.sh)  #let позволяет брать первый id из нескольких
	echo "Service stopped"
	echo $idProc
	kill $idProc
	#pkill my_service_case.sh
	echo "Really stopped?"
 ;;
 restart)
	echo "Service restarted"
	#sudo systemctl restart test.service
 ;;
  
 *) 
 	echo "usage: my_service_case.sh [start|stop|restart]"
 ;;
esac

