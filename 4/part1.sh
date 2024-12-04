#!/bin/sh

INPUT=$(cat input)
crimas(){ 
	xmas=$(grep -oe "XMAS" $1 | wc -l)
	samx=$(grep -oe "SAMX" $1 | wc -l)
	echo $((xmas + samx))
}
HORNTAL=$(crimas input)
echo "HORIZONTAL: "$HORNTAL

translate(){
	rm -f $2
	LW=$(sed -n 1p $1 | tr -d '\n' | wc -c)
	LC=$(wc -l $1 | cut -f 1 -d ' ')
	for i in $(seq $LC)
		do
			cut -b $i $1 | tr -d '\n' | sed 's/$/\n/' >>$2
		done 
}
translate input vercal
VERCAL=$(crimas vercal)
echo "VERTICAL: "$VERCAL
evilawk(){ awk -f crack.awk $1 >$2 ;}
rev input > revput
evilawk input fordy
evilawk revput hunnedthirfa

DAGON=$(crimas fordy)
DIGON=$(crimas hunnedthirfa)
DOGON=$(($DAGON + $DIGON))
echo "DAG DIG: "$DAGON $DIGON
echo "DIAGONAL: "$DOGON

TOTAL=$(($HORNTAL + $VERCAL + $DOGON))
echo "TOTAL: "$TOTAL
