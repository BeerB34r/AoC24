#!/bin/sh

# grab valid codes
cat input | grep -oE -e 'mul\([0-9]{1,3},[0-9]{1,3}\)' -e 'do\(\)' -e "don"\'"t\(\)" >valid_terms
# convert mul() into something useful
cat valid_terms | tr ',' '*' | sed 's/mul/+/' >mul

cat mul | tr '\n' ' ' | sed -r 's/(\))( )([^\+])/\1\n\3/g' | tr -d ' ' >categorised
echo $(( $(cat categorised | grep -v 'don' | sed -r 's/(do\(\))?//' | tr -d '\n' | sed 's/^/0/') ))
rm -f valid_terms mul categorised
