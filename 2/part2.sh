#!/bin/sh

echo "$@" >part2

for i in $(seq $(wc -l part2))
 do
  ./separate $(sed -n "$i"'{p;q}' part2) >current
  current=$(./part1.sh "$(cat current)")
  if test $current -eq 0
   then
   else sum++
 done

echo $sum