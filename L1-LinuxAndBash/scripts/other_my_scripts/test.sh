#!/bin/bash

#echo "Start"

# NAME="12w"

v1="abc"
v2="abc111"

[[ $v1 == $v2 ]]
rez1=$?

echo "rez= $($v1 == $v2)  --"
echo "rez1= $rez1"



#echo "через доллар $?"

# echo $NAME

: '
#test for Integer compare
#  for Integer vars 2 ways:
  #if [[ $v1 -eq $v2 ]]
  #if (("$v1" >= "$v2"))
'

#for string vars 2 ways:
#if [[ $v1 == $v2 ]]
if [ "$v1" == "$v2" ]
  then
	#for integer vars:
	#echo "TRUE - $(("$v1" >= "$v2"))"
	#for string vars
	echo "TRUE -" # $[[$v1 == $v2]]"
  else
	#for ineger vars
	#echo "FALSE- $(("$v1" >= "$v2"))"
	echo "FALSE- "
fi

echo "Finish"
