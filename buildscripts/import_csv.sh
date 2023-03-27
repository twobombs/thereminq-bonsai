#!/bin/bash
# fetch csv, clean up for decimal, convert to hex

cat *.csv | tr , '\n' | sed -E 's/([0-9]+\.[0-9]{5})[0-9]*/\1/g' > csvoutput.dec
printf '%08X\n' $(< csvoutput.dec) | split -d -n l/11 --additional-suffix='.dec' file hexcsvoutput
