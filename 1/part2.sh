#!/bin/sh

init_a=$(echo "$@" | awk -v a="" '{ a=a$1" "}; END {print a}')
init_b=$(echo "$@" | awk -v b="" '{ b=b$2" "}; END {print b}')

echo $init_b | tr ' ' '\n' | sort | uniq -c >occurences

for i in $init_a
	do
		echo $i | join -2 2 - occurences | tr ' ' '*' | bc
	done >scores
rm -f occurences

sum=0
for i in $(cat scores)
	do
		sum=$(( $sum + $i))
	done
		echo $sum
rm -f scores
