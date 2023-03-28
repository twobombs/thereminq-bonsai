#!/bin/bash
# fetch csv, clean up for decimal, convert to hex

cat *.csv | tr -d "0." | tr "," ' '  | sed 's/[a-zA-Z]\+//g' | tail -n +2 | grep -v '#/' | head -n -41 > csvoutput.dec

awk '{print $1}' csvoutput.dec > csvoutput1.dec
awk '{print $2}' csvoutput.dec > csvoutput2.dec
awk '{print $3}' csvoutput.dec > csvoutput3.dec
awk '{print $4}' csvoutput.dec > csvoutput4.dec
awk '{print $5}' csvoutput.dec > csvoutput5.dec
awk '{print $6}' csvoutput.dec > csvoutput6.dec
awk '{print $7}' csvoutput.dec > csvoutput7.dec
awk '{print $8}' csvoutput.dec > csvoutput8.dec
awk '{print $9}' csvoutput.dec > csvoutput9.dec
awk '{print $10}' csvoutput.dec > csvoutput10.dec
awk '{print $11}' csvoutput.dec > csvoutput11.dec
awk '{print $12}' csvoutput.dec > csvoutput12.dec
awk '{print $13}' csvoutput.dec > csvoutput13.dec

# printf '%08X\n' $(< csvoutput.dec) > csvoutput.hex
# split -d -n l/11 --additional-suffix='.hex' csvoutput.hex hexcsvoutput
