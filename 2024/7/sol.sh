#!/bin/bash

ans=0
line=1

# Bash does not support recursive functions very well
# so I had to come up with this hack
# It takes very long to execute.

while IFS=: read -r res ops; do
	res=$(echo "$res" | xargs)
	read -r -a numbers <<<"$(echo "$ops" | xargs)"

	n=${#numbers[@]}
	found=false

	operator_combinations=$((1 << (n - 1)))

	for ((i = 0; i < operator_combinations; i++)); do
		expression="${numbers[0]}"
		for ((j = 0; j < n - 1; j++)); do
			if (((i >> j) & 1)); then
				expression+=" * ${numbers[j + 1]}"
			else
				expression+=" + ${numbers[j + 1]}"
			fi
		done

		result=$(bc <<<"$expression")

		if ((result == res)); then
			printf "%d True \t %d: %s\n" "$line" "$res" "$expression"
			found=true
			break
		fi
	done

	if $found; then
		ans=$((ans + res))
	else
		printf "%d False \t %d\n" "$line" "$res"
	fi

	((line++))
done

printf "\n\n%d\n" "$ans"
