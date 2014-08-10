#!/bin/bash
iter=9
for (( i = 1; i < $iter; i++ ))
do
	size=`expr $i \* 2`
	var="ns sat-rep-var-node.tcl $size"
	echo "$var"
	eval "$var"
	var="./sat-repeater.awk sat-repeater.tr>graph$i.txt"
	eval "$var"
done
var="xgraph -t \"Througput for different number of nodes\" -x \"time\" -y \"througput\" "
for (( i = 1 ; i < $iter ; i = i + 1 ))
do
	var+=" graph$i.txt"	
done
eval "$var"

