#!/bin/bash
iter=10
for (( i = 1; i < $iter; i++ ))
do
	size=`expr $i \* 1000`
	var="ns sat-repeater.tcl $size"
	echo "$var"
	eval "$var"
	var="./sat-repeater.awk sat-repeater.tr>graph$i.txt"
	eval "$var"
done
var="xgraph -t \"Througput vs time, for different packet size\" -x \"time\" -y \"througput\" "
for (( i = 1 ; i < $iter ; i = i + 1 ))
do
	var+=" graph$i.txt"	
done
eval "$var"

