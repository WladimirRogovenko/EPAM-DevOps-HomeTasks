#!/bin/bash
arg=$1
echo "Number of symbols in first argument is: ${#arg}"

if (( ${#arg} % 2 ))
then
	echo "Odd"
else
	echo "Even"
fi

