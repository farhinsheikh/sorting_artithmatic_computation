#!/bin/bash -x
echo "welcome to the arithmatic computation program"

declare -A computation

read -p "Enter a: " a
read -p "Enter b: " b
read -p "Enter c: " c

result1=$(( ($a+$b) * $c))
computation[result1]=$result1
echo "a+b*c = $result1"

result2=$(($a*$b+$c))
computation[result2]=$result2
echo "a*b+c = $result2"

result3=$(( ($c+$a) / $b))
computation[result3]=$result3
echo "c+a/b = $result3"

result4=$(( ($a%$b) + $c))
computation[result4]=$result4
echo "a%b+c = $result4"

count=0
echo "Stored in dictionary"

for key in ${!computation[@]}
do
	echo $key : ${computation[$key]}
	result[(count++)]=${computation[$key]}
done
echo "Stored in dictionary : ${result[@]}"
