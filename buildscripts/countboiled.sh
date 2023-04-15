#!/bin/bash

for i in {4..32}; do
 echo -n "$i" '- '
 cat t_cc_nn_boil"$i"* | grep -v ",-1" | grep -v Measurement | grep t_cc_nn | wc -l;
 cat t_cc_nn_boil"$i"* | grep -v ",-1" | grep -v Measurement | grep t_cc_nn > t_cc_nn_boil_"$i"_values.txt
done
