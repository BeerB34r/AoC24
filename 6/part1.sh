#!/bin/sh

INPUT=$(cat input)

rotate(){
	rm -f $2
	LW=$(sed -n 1p $1 | tr -d '\n' | wc -c)
	LC=$(wc -l $1 | cut -f 1 -d ' ')
	for i in $(seq $LC -1 1)
		do
			cut -b $i $1 | tr -d '\n' | sed 's/$/\n/' >>$2
		done
}

walk(){
	sed -r '/\^/ { :loop; s/[\.X](\^|Y)/YY/; t loop; s/#Y/#^/; s/Y/X/g }' $1 > $2
}
echo "starting calculations"
rotate input rot
while [ "$(grep -o '\^' rot | wc -l)" -ne '0' ]
	do
		walk rot next
		rotate next rot
	done
grep -o 'X' rot | wc -l
