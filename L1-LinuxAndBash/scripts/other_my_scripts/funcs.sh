#!/bin/bash
rez=0
function func1 () {
local rez=$(($1 * $1))
#echo $rez
return ${rez^^}
}

function func2 () {
local rez=$(($1 + 1))
#echo $rez
return ${rez^^}

}


function myfunc3()
{
let k=$(($1+1))
#echo This is func3- $k
return $k
}

for arg in $@; do
  #echo $(func1) #так не выйдет передать параметры для функции
  func1 $arg
  func2 $?
  echo $?
done


#echo First: $(myfunc3 2) 2>&1
myfunc3 9
echo First: $k

myfunc3 44
fff=$?
echo Second way: $fff
