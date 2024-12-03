#!/bin/sh
echo $(($(cat input | grep -oE 'mul\([0-9]{1,3},[0-9]{1,3}\)' | tr ',' '*' | sed 's/mul/+/' | tr -d '\n' | sed 's/^/0/')))
# worked on the commandline, but not in the script. probably using a bash/zshism somewhere
