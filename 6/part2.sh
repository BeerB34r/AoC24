#!/bin/sh

INPUT=$(cat input)

counter_rot(){
	rm -f $2
	LW=$(sed -n 1p $1 | tr -d '\n' | wc -c)
	LC=$(wc -l $1 | cut -f 1 -d ' ')
	for i in $(seq $LC -1 1)
		do
			cut -b $i $1 | tr '|-' '-|'| tr -d '\n' | sed 's/$/\n/' >>$2
		done
}
clock_rot(){
	rm -f $2
	LW=$(sed -n 1p $1 | tr -d '\n' | wc -c)
	LC=$(wc -l $1 | cut -f 1 -d ' ')
	for i in $(seq $LC)
		do
			cut -b $i $1 | tr '|-' '-|'| tr -d '\n' | sed 's/$/\n/' >>$2
		done
}

walk(){
	sed -r '/\^/ { s/\^/X/ ; s/\.(X)/\-X/ ; s/\|X/\+X/ ; :loop; s/[\.](\-|\+)/\-\1/; s/[\|](\-|\+)/\+\1/; t loop; s/X/\+/ ; s/#[-+]/#\^/ }' $1 > $2
}
walkboth(){
	sed -r '/\^/ {
	s/\^/X/
	s/\.X/\-X/; s/\|X/\+X/
	s/X\./X\-/; s/X\|/X\+/
	:loop
		s/[\.](\-)/\-\1/; s/[\|](\-)/\+\1/
		s/(\-)[\.]/\1\-/; s/(\-)[\|]/\1\+/
		s/\.\+/O+/
	t loop; 
	s/X/\+/ ; s/#[-+]/#\^/ 
	}
	' $1 > $2
}
echo "starting calculations"
obstacles=0
rm -f obstacles
counter_rot input rot
while [ $(grep -o '\^' rot | wc -l) -ne '0' ]
	do
		walkboth rot next
		if [ "$(grep -o 'O' next | wc -l)" -ne '0' ]
			then
				echo "potential obstacle found..."
				sed 's/O+/.^/' next >potential
				counter_rot potential rot
				if [ $(grep -oE '#.*\^' rot | wc -l) -eq '1' ]
					then
						echo "obstacle found"
						obstacles=$(($obstacles + 1))
						sed 's/.^/O+/' next >>obstacles
					else
						echo "not an obstacle"
				fi
				cat potential > rot
			else
				echo "no potential obstacles found"
				counter_rot next rot
		fi
	done
echo $obstacles
