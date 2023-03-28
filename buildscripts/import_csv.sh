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

# checks
wc -l csvoutput*

# convert 13x32k points to hex
for a in $(< csvoutput1.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput1.flex &
for a in $(< csvoutput2.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput2.flex &
for a in $(< csvoutput3.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput3.flex &
for a in $(< csvoutput4.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput4.flex &
for a in $(< csvoutput5.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput5.flex &
for a in $(< csvoutput6.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput6.flex &
for a in $(< csvoutput7.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput7.flex &
for a in $(< csvoutput8.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput8.flex &
for a in $(< csvoutput9.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput9.flex &
for a in $(< csvoutput10.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput10.flex &
for a in $(< csvoutput11.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput11.flex &
for a in $(< csvoutput12.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput12.flex &
for a in $(< csvoutput13.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a) | grep "Hex layout" ; done > csvoutput13.flex

sleep 10

# printf '%08X\n' $(< csvoutput.dec) > csvoutput.hex
# split -d -n l/11 --additional-suffix='.hex' csvoutput.hex hexcsvoutput
