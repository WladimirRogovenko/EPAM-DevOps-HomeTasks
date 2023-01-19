#!/bin/bash


if (($# < 2)) 
then
	echo $1
elif (($# >2)) && (($#<4))
then
	numArgs=$#
	echo ${!numArgs}   # последний аргумент
	echo "${@: -1:1}"  # последний аргумент
	echo "${@}"
else
	echo "Invalid number of arguments"
fi 
