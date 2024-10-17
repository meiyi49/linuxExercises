#!/bin/bash

usage() {
    echo "usage: $0 <column> [file.csv]" >&2
}


if [ $# -lt 1 ]; then
    usage
    exit 1
fi

column=$1
file=${2:-/dev/stdin}  


cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read -r value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done
    if [ $count -ne 0 ]; then
        mean=$(echo "scale=2; $sum / $count" | bc)
        echo "Mean: $mean"
    else
        echo "no valid line." >&2
    fi
}
