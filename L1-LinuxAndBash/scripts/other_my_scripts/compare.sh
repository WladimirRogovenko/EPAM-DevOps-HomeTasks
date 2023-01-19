#!/bin/bash
TEST="123"

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Must be 2 parametrs";
	exit;
fi

echo "Compare $1 and $2"
[[ $1 == $2 ]]
	echo "Result: qual Exit code = $?";

if [[ $1 > $2 ]]; then
	echo "Result: $1 > $2. Exit code = $?"
else
	echo "Result: $1 < $2.Exit code = $? ";
fi

[ -n "$TEST" ]
	echo "TEST=$TEST and Exit code = $?"

if [ -n "$3" ] || [ -n "$4" ]; then 
[ "$3" -ne "$4" ]; 
	echo "Compare 3 and 4 parametrs ($3 != $4 ?). Exit code =$?"; 
[ "$3" -ge "$4" ];
	 echo "Compare 3 and 4 parametrs ($3 >= $4 ?). Exit code =$?";
fi
