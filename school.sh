#!/bin/bash
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 | { sum=0; count=0; while read value; do sum=$(echo "$sum + $value" | bc); count=$((count + 1)); done; echo "sum: $sum"; echo "mean: $(echo "scale=2; $sum / $count" | bc)"; }
