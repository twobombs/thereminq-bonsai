#!/bin/bash
# extract https://github.com/twobombs/thereminq-bonsai/blob/main/miscfiles/validation_method_comparison_all.tar.gz
# this script fetches the csv, cleans up for decimals, convert to hex, bin and tipsy format
#
# visualisation is a csv import of validation odt as delivered by dan strano https://github.com/unitaryfund/qrack
# this visualisation is semi-custom made to display the 12 validation modes
# adheres to basic csv import filters with a custom 12x 31k datapoint mod

# the 12 validation models are:

# Gold standard
# Mirror
# Y
# X
# X_0
# MARP 
# Intercept
# SST
# SSR
# Residuals
# Residual w/ Intercept
# Y
# Residual w/ Intercept

# note: some datapoints are invisible as they have negative values and can only be displayed using the p button

cat *.csv | tr "," ' '  | sed 's/[a-zA-Z]\+//g' | tail -n +2 | grep -v '#/' | head -n -41 > csvoutput.dec

awk '{print $1}' csvoutput.dec | tr " " "\n" > csvoutput1.dec
awk '{print $2}' csvoutput.dec | tr " " "\n" > csvoutput2.dec
awk '{print $3}' csvoutput.dec | tr " " "\n" > csvoutput3.dec
awk '{print $4}' csvoutput.dec | tr " " "\n" > csvoutput4.dec
awk '{print $5}' csvoutput.dec | tr " " "\n" > csvoutput5.dec
awk '{print $6}' csvoutput.dec | tr " " "\n" > csvoutput6.dec
awk '{print $7}' csvoutput.dec | tr " " "\n" > csvoutput7.dec
awk '{print $8}' csvoutput.dec | tr " " "\n" > csvoutput8.dec
awk '{print $9}' csvoutput.dec | tr " " "\n" > csvoutput9.dec
awk '{print $10}' csvoutput.dec | tr " " "\n" > csvoutput10.dec
awk '{print $11}' csvoutput.dec | tr " " "\n" > csvoutput11.dec
awk '{print $12}' csvoutput.dec | tr " " "\n" > csvoutput12.dec
awk '{print $13}' csvoutput.dec | tr " " "\n" > csvoutput13.dec

# pad SDRP value in row 0 to 3 decs to make m & x value sane
# for a in $(< csvoutput0.dec); do printf "000\r%s\n" $a ; done > csvoutput1.dec

# count the total amount of lines for one layer and dim for that
wc -l csvoutput1.dec | tr " " "\n"| grep -v csvoutput1.dec > collumns.dec
cat collumns.dec

# derive tipsy factor
tipsy=0.1

# convert 13x32k points to hex
for a in $(< csvoutput1.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput1.flex &
for a in $(< csvoutput2.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput2.flex &
for a in $(< csvoutput3.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput3.flex &
for a in $(< csvoutput4.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput4.flex &
for a in $(< csvoutput5.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput5.flex &
for a in $(< csvoutput6.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput6.flex &
for a in $(< csvoutput7.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput7.flex &
for a in $(< csvoutput8.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput8.flex &
for a in $(< csvoutput9.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput9.flex &
for a in $(< csvoutput10.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput10.flex &
for a in $(< csvoutput11.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput11.flex &
for a in $(< csvoutput12.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput12.flex &
for a in $(< csvoutput13.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/$tipsy | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > csvoutput13.flex

sleep 10

# checks
wc -l csvoutput*

# ==== here starts tipsy header declarations ======
# T = time
echo "0000000000000000" > time.hex
echo "00030000" > ndim.hex
echo "00000000" > nsph.hex
echo "00000000" > ndark.hex
echo "00010000" > version.hex
# ==== here end tipsy special declarations =========

# create flex compatible file
paste csvoutput1.flex csvoutput2.flex  csvoutput1.flex csvoutput3.flex csvoutput1.flex csvoutput4.flex csvoutput1.flex csvoutput5.flex  csvoutput1.flex csvoutput6.flex csvoutput1.flex csvoutput7.flex csvoutput1.flex csvoutput8.flex  csvoutput1.flex csvoutput9.flex  csvoutput1.flex csvoutput10.flex  csvoutput1.flex csvoutput11.flex  csvoutput1.flex csvoutput12.flex csvoutput1.flex csvoutput13.flex | sed 's/\t\t*/\n/g' > measured.flex
# ... and checks
wc -l measured.flex

# count the total amount of lines for local ans all values
wc -l measured.flex | tr " " "\n"| grep -v measured.flex > rows.dec
# wc -l csvoutput1.dec | tr " " "\n"| grep -v csvoutput1.dec > collumns.dec

# create collumn coordinades in flex
# for i in `cat square.dec` ; do cat 

# derive the amount of measured points for array dimension declaration
rows=$(<rows.dec)
echo $(( rows / 2 )) > points.dec
printf '%08X\n' $(< points.dec) > points.hex

# add velocity nullpointers for xyz displacements in hex/flex
yes 00000000 | head -n `cat points.dec` > displacex.hex
cp displacex.hex displacey.hex
cp displacex.hex displacez.hex
cp displacex.hex dummy.hex

# dim a square by making a real sqr of the amount of points with margin
points=$(<points.dec)
pointssqr=$(echo "$points" | awk '{print sqrt($1)}')

# integer the sqrt, subtract margin
square=$( echo $pointssqr | awk '{printf "%.0f\n", $1}')
margin=$(( 1 ))
square=$((square - margin))
echo $square > cube.dec

# announce and declare raw points
# make real and tipsy scaling 
# cube dimensions and convert value to hex for header
echo "original amount of measured values" $points
echo "view will be "$square "x" $square

# create y coordinates in dec/flex for stacking teh layercaek
collumns=$(<collumns.dec)
seq 1 1 12 > collumnsy.dec
for a in $(< collumnsy.dec); do /root/.local/bin/crackNum -f sp -- $(echo $a/0.1 | bc -l) | grep "Hex layout" ; done | tr -d ' ' | tr -d 'Hexlayout:' > collumnsy.flex
cat collumnsy.flex | awk '{for(i=0;i<31106;i++)print}' > collumnsy.fhex

# construct hex header
paste time.hex points.hex ndim.hex nsph.hex ndark.hex points.hex version.hex > header.hex

# create flex compatible file
cat csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex csvoutput1.flex > csvoutput1.fhex
cat csvoutput2.flex csvoutput3.flex csvoutput4.flex csvoutput5.flex csvoutput6.flex csvoutput7.flex csvoutput8.flex csvoutput9.flex csvoutput10.flex csvoutput11.flex csvoutput12.flex csvoutput13.flex > csvoutputx.fhex 

# assemble/weave final hex, convert to bin
paste header.hex csvoutputx.fhex csvoutput1.fhex collumnsy.fhex csvoutputx.fhex displacex.hex displacey.hex displacez.hex dummy.hex dummy.hex csvoutput1.fhex csvoutputx.fhex > tipsy-csv.hex

# convert int hex string data as a bin file
xxd -r -p tipsy-csv.hex tipsy-csv.bin
# aaaand convert to little indian
hexdump -v -e '1/4 "%08x"' -e '"\n"' tipsy-csv.bin | xxd -r -p >tipsy-csv_hexdump.bin
