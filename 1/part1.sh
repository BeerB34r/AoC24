#!/bin/sh

Initial_a=$(echo "$@" | awk -v a="" '{ a=a$1" "}; END {print a}')
Initial_b=$(echo "$@" | awk -v b="" '{ b=b$2" "}; END {print b}')

Sorted_a=$(echo $Initial_a | tr ' ' '\n' | sort -n)
Sorted_b=$(echo $Initial_b | tr ' ' '\n' | sort -n)

echo $Initial_a '=>' $Sorted_a
echo $Initial_b '=>' $Sorted_b

for i in $(seq $(echo $Sorted_a | wc -w))
	do
		echo $Sorted_a"\n"$Sorted_b | cut -f $i -d ' ' | tr '\n' '-'\
		| sed 's/-$/\n/' | bc | tr -d '-'
	done >distances

for i in $(cat distances)
	do
		sum=$(( $sum + $i))
	done
		echo $sum
rm -f distances
