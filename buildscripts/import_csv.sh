#!/bin/bash
# fetch csv, clean up for decimal, convert to hex

cat *.csv | tr -d "0." | tr "," ' '  | sed 's/[a-zA-Z]\+//g' | tail -n +2 | grep -v '#/' | head -n -41 > csvoutput.dec


printf '%08X\n' $(< csvoutput.dec) > csvoutput.hex
split -d -n l/11 --additional-suffix='.hex' csvoutput.hex hexcsvoutput
