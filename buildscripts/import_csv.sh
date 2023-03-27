#!/bin/bash

cat *.csv | sed 's/[^0-9]*//g' | tr ',,' '' | sed 's/|,|/\n/g' | csvoutput.dec
printf '%08X\n' $(< csvoutput.dec) | split -d -n l/11 --additional-suffix='.dec' file hexcsvoutput
