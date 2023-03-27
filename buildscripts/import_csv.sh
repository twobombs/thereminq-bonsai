#!/bin/bash
# fetch csv, clean up for decimal, convert to hex

cat *.csv | tr , '\n' | sed -E 's/([0-9]+\.[0-9]{5})[0-9]*/\1/g' > csvoutput.dec
printf '%08X\n' $(< csvoutput.dec) > csvoutput.hex
split -d -n l/11 --additional-suffix='.hex' csvoutput.hex hexcsvoutput
