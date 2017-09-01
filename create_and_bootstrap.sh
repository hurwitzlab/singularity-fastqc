#!/bin/bash

set -x

echo "Hello! starting $(date)"

sudo rm -rf fastqc.img
singularity create -s 768 fastqc.img
sudo singularity bootstrap fastqc.img ubuntu.sh

echo "Goodbye! ending $(date)"
