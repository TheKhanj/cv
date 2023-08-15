#!/usr/bin/env sh

input="$1"
output="$2"
tempalte="$3"

markdown -S "$input" >tmp.html

while read -r line; do
	if [ "$line" = '<div>{{main-content}}</div>' ]; then
		cat tmp.html
	else
		echo "$line"
	fi
done <"$tempalte" >"$output"

rm tmp.html
