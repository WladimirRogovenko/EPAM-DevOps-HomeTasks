#!/bin/bash

function favoritIP(){
	cut $source -f 1 -d " " | sort |uniq -c | sort -r -n | head -n1
}

function mostReqPage(){
	cat $source | sed -n 's_.*\(http://[^/]*\).*_\1_p' | sort |uniq -c | sort -r -n | head -n1
}

function mostReqByIP(){
	cut $source -f 1 -d " " | sort |uniq -c | sort -r -n
}

function badReq(){
	cat $source | grep 'HTTP/1.0" 404 ' | wc -l
}

function mostReqByTime(){
	echo "--- By hours top 5:"
	cat $source | sed -n 's_.*\[\(.*:[0-2][0-9]\):[0-5][0-9]:[0-5][0-9].*\(http://[^/]*\).*_\1 \2_p' |sort | uniq -c | sort -n -r -k 1 | head -n5
	echo "--- By minutes top 5:"
	cat $source | sed -n 's_.*\[\(.*:[0-2][0-9]:[0-5][0-9]\):[0-5][0-9].*\(http://[^/]*\).*_\1 \2_p' |sort | uniq -c | sort -n -r -k 1 | head -n5
}

function UAIP(){
	cat $source |  sed -n 's_^\(.*\) - -.* "-" "\(.*\)(.*;\(.*[Bb]ot.*\);.*_\1\t\2\t\3_p' | sort -k 1 | uniq | sort -k 2 #work 2

	#this commnd with less conditions
	#cat example_log.log |  sed -n 's_^\(.*\) - -.*;\(.*[Bb]ot.*\);.*_\1\t\2_p' | sort -k 1 | uniq | sort -k 2 #work fine
}
if [ $# -eq 0 ]
	then
	echo "Must be one argument - source filename!"
	exit 0
fi
source=$1
if [ $# -eq 2 ]
	then
	dest=$2
else
	dest="/dev/stdout"
fi

echo "Please select quastion for solve:"
echo "1. From which ip were the most requests?"
echo "2. What is the most requested page?"
echo "3. How many requests were there from each ip?"
echo "4. What non-existent pages were clients referred to?"
echo "5. What time did site get the most requests?"
echo "6. What search bots have accessed the site? (UA + IP)"

echo "q - for Quit"
exec 6<&1
while : ; do
   exec 1<&6
   echo -n "Your choise:"
   read UserSelect
   exec 1>>$dest
   case $UserSelect in
	1) echo "Calculete and find IP witch most requests"
	   favoritIP
	   ;;
	2) echo "Most requests page is:"
	   mostReqPage
	   ;;
	3) echo "Requests by IP:"
	   mostReqByIP
	   ;;
	4) echo -n "Non-existent pages were clients referred is "
	   badReq
	   ;;
	5) echo "Time when site get the most requests"
	   mostReqByTime
	   ;;
	6) echo "Search bots who have accessed the site (UA + IP)"
	   UAIP
	   ;;
	[qQ]) exit 0
           ;;
	*) echo "Invalid input, Please select 1-6 or "q" for exit"
	  ;;
   esac
done
