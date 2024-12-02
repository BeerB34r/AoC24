#!/bin/sh

echo "$@" >separation

for i in $(seq $(wc -w separation | cut -f 1 -d ' '))
	do
		cat separation | tr ' ' '\n' | awk "NR!=$i" | tr '\n' ' '
		echo ""
	done
rm -f separation
