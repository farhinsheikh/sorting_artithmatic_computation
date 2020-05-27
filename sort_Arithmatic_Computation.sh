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

for ((i=0; ${result[i]}; i++))
do
	for ((j=$(($i+1)); $j<$count; j++))
	do
		if (( ${result[i]}<${result[j]} ))
		then
			temp=${result[i]}
			result[$i]=${result[j]}
			result[$j]=$temp
		fi
	done
done
echo "Result in descending order : ${result[@]}"

for ((i = 0; i<4; i++))
do
	for ((j = 0; j<4-i-1; j++))
	do
		if [[ ${result[j]} -gt ${result[$(($j+1))]} ]]
		then
			temp=${result[j]}
			result[$j]=${result[$(($j+1))]}
			result[$(($j+1))]=$temp
		fi
	done
done
echo "Result in ascending order: ${result[@]}"
