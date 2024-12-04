#!/bin/sh

INPUT=$(cat input)

awk -f crack.awk input >lol
WIDTH=$(tail -n 1 lol | tr -d '\n' | wc -c)
for i in $(seq $(wc -l lol | cut -f 1 -d ' '))
	do
		LINE=$(sed -n ${i}p lol)
		CUR=$(echo $LINE | tr -d '\n'| wc -c)
		printf "%s%$((140-$CUR))s" "$LINE" " " | head -c 140 | sed 's/$/\n/'
	done >lmao
