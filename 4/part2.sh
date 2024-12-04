#!/bin/sh

INPUT=$(cat input)
SUM=0
SUM=$(cat input | tr -d '\n' | grep -oEe 'M.S.{7}.A..{7}M.S' -e 'M.M.{7}.A..{7}S.S' -e 'S.S.{7}.A..{7}M.M' -e 'S.M.{7}.A..{7}S.M' | wc -l)
echo $SUM
