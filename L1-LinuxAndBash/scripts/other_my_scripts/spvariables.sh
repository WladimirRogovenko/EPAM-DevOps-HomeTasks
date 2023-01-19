#!/bin/bash

#homework with envirounment vars

echo "Name of the script: $0"
count=1
for i in "$@"; do
	echo "Параметр $count = $i";
	count=$((count+1))
done

echo "Total number of argumets is $#"
echo "Second argument = $2"
echo "Third argument = $4"
[[ $1 -eq $2 ]]
echo "Result of [[$1 -eq $2]] = $?"

