#!/bin/bash

# Serial job script used for debugging, profiling, etc. Will 
# run specific-sim.R which is a modification of siusims.R to 
# only run a specific sim from simparms. 
# This makes use of the idx column of simparms.

# original sequence that was giving NA's because [.()] data.table
# works differently than plain 'ol [ 
#sims=$(seq 47 56) 

# sims that are repeatedly giving slow times in a parallel context
# 1. verifiying this is also the case in serial
# 2. if so, then profiling.
#sims=(409 410 411 412 413 414)
sims=(318 320 322)

export OMP_NUM_THREADS=1
for sim in "${sims[@]}"
do
    time R --no-echo --no-restore --file=Analysis/specific-sim.R --args $sim
done
