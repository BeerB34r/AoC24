#!/bin/sh

echo "$@" >part2

sum=0;
for i in $(seq $(wc -l part2 | cut -f 1 -d ' '))
	do
		./separate.sh $(sed -n "$i"'{p;q}' part2) >current
		current=$(./part1.sh "$(cat current)")
	if test $current -eq 0
  		then
			sum=$sum;
		else
			sum=$(( $sum + 1))
	fi
	done
rm -f part2 current
echo $sum
