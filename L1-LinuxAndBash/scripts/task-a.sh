#!/bin/bash

#help function
function show_help(){
	echo "This script does next actions:"
	echo "--all 		displays the IP addresses and symbolic names of all hosts in the current subnet."
	echo "--target  	displays a list of open system TCP ports."
	echo "--help,nothing 	show this help"
}

#
function subnet_hosts(){
	echo
	#get our ip address for 2 ways:
	#myIP=`ip route get 8.8.8.8 | head -1 | cut -d' ' -f7`
	myIP=`hostname -I | cut -d' ' -f1`
	echo $myIP
}

#
function show_open_TCP_ports(){
	echo "Scan localhost for open TCP ports:"
	nmap localhost -p1-65535 | sed -n '/PORT/,/Nmap/p' | sed '$d'
}

#check number of args
if [ $# -eq 0 ]; then
	show_help
	exit 0
fi

#select key handler
case $1 in
	"--help"|"-h")
		show_help
	;;
	"--all")
		subnet_hosts
	;;
	"--target")
		show_open_TCP_ports
	;;

	*)
		echo "Error: key unknown, use --help for list of enabled keys"
	;;
esac
