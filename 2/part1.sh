#!/bin/sh

echo "$@" >part1
sum=0
for i in $(seq $(wc -l part1 | cut -f 1 -d ' '))
	do
		sum=$(( $sum + $(./nominal.sh $(sed -n "$i"'{p;q}' part1)) ))
	done
echo $sum
