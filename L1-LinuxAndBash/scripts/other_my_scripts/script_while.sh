#!/bin/bash

while :
do
 read i

 case $i in
  pwd)
	pwd
 ;;
 exit)
	break
 ;;
 ls\ *)
	#shablon=\"s/~/\'${HOME}\'/g\"
	#echo $shablon
	#echo $i | sed $shblon
	#echo $($i)
	eval ${i}
 ;;
 hi)
	echo "Hello $USER"
 ;;
esac

done
