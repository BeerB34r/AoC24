#!/bin/sh


ID=$(cat ../session_id)
YEAR=$(basename $(cd .. && pwd) | sed 's/AoC/20/')
DAY=$(basename $(pwd))
URL="https://adventofcode.com/$YEAR/day/$DAY"
COOKIE="Cookie: session=$ID"

curl -s -H "$COOKIE" $URL/input >input
cp -n ../boilerplate.sh part1.sh
cp -n ../boilerplate.sh part2.sh
