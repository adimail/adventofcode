#!/bin/bash

lhs=()
rhs=()

while read -r num1 num2; do
	lhs+=("$num1")
	rhs+=("$num2")
done

declare -A rhscount
for item in "${rhs[@]}"; do
	((rhscount[$item]++))
done

ans=0

for i in "${lhs[@]}"; do
	frequence="${rhscount[$i]}"

	ans=$((ans + $((frequence * i))))
done

printf "%d\n" "$ans"
