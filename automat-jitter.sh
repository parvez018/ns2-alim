#!/bin/bash
iter=6
for (( i = 1; i < $iter; i++ ))
do
	size=`expr $i \* 500`
	var="ns sat-repeater.tcl $size"
	echo "$var"
	eval "$var"
	var="./sat-rep-jitter.awk -v size=$size sat-repeater.tr>graph$i.txt"
	eval "$var"
done
comm="xgraph -t \"Jitter for different packet size\" -y \"packet count\" -x \"delay\" "
for (( i = 1 ; i < $iter ; i = i + 1 ))
do
	filename="graph$i.txt"
	var=`sort $filename`
	echo "$var">$filename
	comm+=" $filename"	
done
eval "$comm"

