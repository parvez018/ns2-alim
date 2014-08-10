#!/bin/bash
iter=3
comm[0]="basic"
comm[1]="basic_tracing"
comm[2]="poisson"
for (( i = 1; i < $iter; i++ ))
do
	
	var="echo \"\">baloha$i.txt"
	eval "$var"
	
done
for (( i = 1; i < $iter; i++ ))
do
	size=`expr $i \* 1000`

	var="ns sat-aloha.tcl ${comm[$i]}"
	echo "$var"
	eval "$var"
	var="./sat-aloha.awk sat-aloha.tr>>baloha$i.txt"
	var="./sat-aloha.awk sat-aloha.tr"
	eval "$var"
done
var="xgraph -t \"Througput vs Packetsize\" -x \"time\" -y \"througput\" "
for (( i = 1 ; i < $iter ; i = i + 1 ))
do
	var+=" baloha$i.txt"	
done
#eval "$var"

