#!/bin/bash

lhs=()
rhs=()

while read -r num1 num2; do
	lhs+=("$num1")
	rhs+=("$num2")
done

mapfile -t lsorted < <(printf "%d\n" "${lhs[@]}" | sort -n)
mapfile -t rsorted < <(printf "%d\n" "${rhs[@]}" | sort -n)

len=${#lsorted[@]}
sum=0

abs() {
	if (($1 < 0)); then
		echo $((-1 * $1))
	else
		echo "$1"
	fi
}

for ((i = 0; i < len; i++)); do
	sum=$((sum + $(abs $((lsorted[i] - rsorted[i])))))
done

printf "%d\n" "$sum"
