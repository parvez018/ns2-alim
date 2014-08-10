#!/bin/bash
filename="graph5.txt"
var=`sort $filename`
echo "$var">$filename
echo "$var"