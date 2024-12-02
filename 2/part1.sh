#!/bin/sh

echo "$@" >input
sum=0
for i in $(seq $(wc -l input | cut -f 1 -d ' '))
	do
		sum=$(( $sum + $(./nominal.sh $(sed -n "$i"'{p;q}' input)) ))
	done
echo $sum
