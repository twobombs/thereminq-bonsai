#!/bin/bash
# pre cooked cpu generatel 8-27 qubits at 100 samples
# 4x24 lines

for run in {1..4}; do

echo $run 

./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=8 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_8_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 8_$run.txt  
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=9 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_9_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 9_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=10 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_10_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 10_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=11 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_11_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 11_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=12 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_12_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 12_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=13 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_13_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 13_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=14 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_14_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 14_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=15 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_15_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 15_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=16 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_16_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 16_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=17 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_17_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 17_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=18 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_18_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 18_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=19 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_19_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 19_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=20 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_20_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 20_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=21 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_21_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 21_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=22 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_22_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 22_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=23 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_23_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 23_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=24 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_24_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 24_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=25 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_25_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 25_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=26 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_26_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 26_$run.txt
./benchmarks --optimal-cpu --layer-qtensornetwork --proc-bdt-hybrid --devices=0,0,0,0 --use-host-dma --measure-shots=100 --single -m=27 --benchmark-depth=33 --samples=1 --measure-output=/var/log/qrack/"measured_cosmos_graph_27_$run-$(date +%F_%R_%S).log" test_qft_cosmology > 27_$run.txt

done

cd /thereminq-bonsai/buildscripts && /usr/bin/time ./10k48.sh
