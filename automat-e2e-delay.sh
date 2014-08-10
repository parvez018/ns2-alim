#!/bin/bash
iter=10
echo "">graph_delay.txt
for (( i = 1; i < $iter; i++ ))
do
	size=`expr $i \* 1000`
	var="ns sat-repeater.tcl $size"
	echo "$var"
	eval "$var"
	var="./sat-rep-e2edelay.awk -v size=$size sat-repeater.tr >> graph_delay.txt"
	#echo "$var"
	eval "$var"
done

xgraph -m -t End_to_end_delay vs Packetsize -x packetsize -y delay graph_delay.txt

