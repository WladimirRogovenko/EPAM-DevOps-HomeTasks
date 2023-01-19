#!/bin/bash

let sum=0
let argNum=0


for i in ${@}; do
  let sum+=$i
  let argNum++
done
echo "Sum: $sum"
echo "Args: $argNum"
echo "Result: $((sum/argNum))"
 
