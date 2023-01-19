#!/bin/bash

let count=1
for i in ${@}; do
 echo $i
 mas[count]=$i
 ((count++))
done


for ((i=1;i<=${#@}; i++)); do

 if [ $i -eq ${#@} ]
	then
	  let next=mas[1]
	else
	  let next=mas[$i+1]
 fi

 echo -n "$((${mas[$i]} + $next)) "
done
echo

