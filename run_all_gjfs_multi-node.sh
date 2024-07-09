#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --partition=atesting
#SBATCH --job-name=test_{$myvar}
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --output=test%j.out
#SBATCH --constraint=ib
 
module load gaussian/g16_c.02
 
for n in `scontrol show hostname | sort -u`; do
echo ${n}
done | paste -s -d, > tsnet.nodes.$SLURM_JOBID

# Always specify a scratch directory on a fast storage space (not /home or /projects!)
export GAUSS_SCRDIR=/scratch/alpine/$USER/$SLURM_JOBID
mkdir $GAUSS_SCRDIR
 
# the next line prevents OpenMP parallelism from conflicting with Gaussian's internal parallelization
export OMP_NUM_THREADS=1
 
# the next line increases the verbosity of Linda output messages
export GAUSS_LFLAGS="-v"
 
date # put a date stamp in the output file for timing/scaling testing
#g16 -m=20gb -p=${SLURM_CPUS_PER_TASK} -w=`cat tsnet.nodes.$SLURM_JOBID` 1g_2g.com
g16 -m=20gb -p=${SLURM_CPUS_PER_TASK} -w=`cat tsnet.nodes.$SLURM_JOBID` my_input.com
date

rm tsnet.nodes.$SLURM_JOBID
