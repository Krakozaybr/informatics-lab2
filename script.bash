#!/bin/bash

binary ()
{
 local num=$1
 local bin=""
 for i in {1..8}
 do
   local r=$(( $num % 2 ))
   bin="$r$bin"
   num=$(( $num / 2 ))
 done
 echo "$bin"
}

ip=$1
IFS='.'
read -ra parts <<< "$ip"
res=""
for part in "${parts[@]}"; do
if [ -z "$res" ]; then
res="$(binary $part)"
else
res="$res.$(binary $part)"
fi
done
echo "$res"
