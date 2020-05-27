#!/bin/bash -x
echo "welcome to the arithmatic computation program"

read -p "Enter a: " a
read -p "Enter b: " b
read -p "Enter c: " c

result1=$(( ($a+$b) * $c))
computation[result1]=$result1
echo "a+b*c = $result1"
