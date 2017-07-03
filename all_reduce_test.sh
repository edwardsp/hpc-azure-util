#!/bin/sh

for NPROCS in 1 2 4 8 16 32 64; do
        for PPN in 1 2 4 8 10 12 14 15 16; do
                NP=$(bc <<< "$NPROCS * $PPN")
                mpirun -np $NP -ppn $PPN -machinefile ~/bin/hostlist IMB-MPI1 Allreduce -npmin $NP 2>&1 | tee IMB_Allreduce_${NP}_${NPROCS}x${PPN}.log
        done
done


