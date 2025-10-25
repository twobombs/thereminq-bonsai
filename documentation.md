# ThereminQ Documentation

## Overview

ThereminQ is a suite of tools designed to control, extend, and visualize data from quantum circuits. It uses Qrack, ELK, Tipsy, Jupyter, CUDA, and OpenCL accelerators to provide a powerful environment for quantum simulation and visualization.

This repository contains the necessary Dockerfiles, build scripts, and run scripts to deploy and use ThereminQ.

## Project Structure

The repository is organized into the following directories:

- `Dockerfiles/`: Contains Dockerfiles for building the various environments used by ThereminQ.
- `buildscripts/`: Contains scripts for building and compiling the necessary components.
- `miscfiles/`: Contains miscellaneous files, such as data and logs.
- `runscripts/`: Contains scripts for running the simulations and visualizations.

## Getting Started

To get started with ThereminQ, you will need to have Docker and NVIDIA Docker installed on your system. You can then build the Docker images using the Dockerfiles in the `Dockerfiles/` directory.

Once the images are built, you can use the scripts in the `runscripts/` directory to run the simulations and visualizations.

## Dockerfiles

The `Dockerfiles/` directory contains the following Dockerfiles:

- `Dockerfile`: The base Dockerfile for the ThereminQ environment.
- `Dockerfile-2204`: A Dockerfile for Ubuntu 22.04.
- `Dockerfile-bonsai-qft`: A Dockerfile for the Bonsai QFT environment.
- `Dockerfile-bonsai-realtime`: A Dockerfile for the Bonsai realtime environment.
- `Dockerfile-bonsai-supreme`: A Dockerfile for the Bonsai supreme environment.
- `Dockerfile-bonsai-tnnd`: A Dockerfile for the Bonsai TNND environment.
- `Dockerfile-bonsai-validation`: A Dockerfile for the Bonsai validation environment.
- `Dockerfile-llama`: A Dockerfile for the Llama environment.
- `Dockerfile-qcircuit`: A Dockerfile for the qcircuit environment.
- `Dockerfile-qrack-precooked`: A Dockerfile for the Qrack precooked environment.

## Build Scripts

The `buildscripts/` directory contains various scripts for building and processing data. These scripts are used to prepare the data for visualization with Bonsai.

## Run Scripts

The `runscripts/` directory contains scripts for running the simulations and visualizations. These scripts are used to launch the Docker containers and run the Bonsai visualizations.

## Miscellaneous Files

The `miscfiles/` directory contains miscellaneous files, such as data and logs from the simulations.
