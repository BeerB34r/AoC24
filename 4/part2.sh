#!/bin/sh

INPUT=$(cat input)

crossmas(){
if test $(sed -n $1p $3 | tail -c +$2 | head -c 3 \
		| grep -oE "$4" | wc -l) -eq '1'
	then	if test $(sed -n $(( $1 + 1))p $3 | tail -c +$2 | head -c 3 \
				| grep -oE '.A.' | wc -l) -eq '1'
				then	if test $(sed -n $(( $1 + 2))p $3 | tail -c +$2 \
						| head -c 3 | grep -oE "$5" | wc -l) -eq '1'
							then echo '1'
						fi
			fi
fi
}

xchecks(){
	if test $(crossmas $1 $2 $3 'M.S' 'M.S' | wc -l) -eq '1'
		then echo '1' && return
	fi
	if test $(crossmas $1 $2 $3 'M.M' 'S.S' | wc -l) -eq '1'
		then echo '1' && return
	fi
	if test $(crossmas $1 $2 $3 'S.M' 'S.M' | wc -l) -eq '1'
		then echo '1' && return
	fi
	if test $(crossmas $1 $2 $3 'S.S' 'M.M' | wc -l) -eq '1'
		then echo '1' && return
	fi
}

for i in $(seq $(( $(cat input | wc -l) - 2)))
	do
		for j in $(seq $(( $(sed -n ${i}p input | wc -c) - 3)))
			do
				xchecks $i $j input
			done
	done | wc -l
