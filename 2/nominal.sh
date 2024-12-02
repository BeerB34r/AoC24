#!/bin/sh

report=$(echo $@)

count=$(echo $report | tr ' ' '\n' | wc -l)
uniquecount=$(echo $report | tr ' ' '\n' | sort -u | wc -l)
isunique=$(if test $count -eq $uniquecount; then echo "1"; else echo "0"; fi)

reverse=$(echo $report | tr ' ' '\n' | sort -rn | tr '\n' ' ')
obverse=$(echo $report | tr ' ' '\n' | sort -n | tr '\n' ' ')
echo $report >orders
echo $reverse >>orders
echo $obverse >>orders
stable=$(sort orders | uniq -c | awk '{if ($1 == 2) print "1"}')
stable=$(echo ${stable:=0})
rm -f orders

for i in $(seq $(( $count - 1)))
	do
		j=$(( $i + 1))
		echo $report | cut -f $i -d ' ' | tr '\n' '-' >math
		echo $report | cut -f $j -d ' ' >>math
		cat math | bc | tr -d '-'
		rm -f math
	done | sort -u | awk '{if ($1 >= 4) print $1}' >maths

if test $(wc maths | cut -f 1 -d ' ') -eq 0
	then
		magnitude=1
	else
		magnitude=0
fi
rm maths

echo $isunique >stats
echo $stable >>stats
echo $magnitude >>stats
nominal=$(cat stats | sort | uniq -c | awk '{if ($2 != 1) print "0"}')
rm -f stats
nominal=$(echo ${nominal:=1})

echo $nominal
