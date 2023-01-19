#!/bin/bash
echo Enter filename:
read filename

let myfilesize="$(wc -c $filename | awk '{print $1}') / 1000"
echo $myfilesize

until [ $myfilesize -gt 1024 ]
do
	echo $myfilesize
	cat $filename > tmpfile
	cat tmpfile >> $filename
	#fileAll=`cat $filename`
	#echo $fileAll >> $filename
	let myfilesize="$(wc -c $filename | awk '{print $1}') / 1000"
done
	rm -f tmpfile
