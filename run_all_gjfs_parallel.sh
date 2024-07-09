#!/bin/bash
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --job-name=Rotors
#SBATCH --account=ucb273_peak2
#SBATCH --array=1-36
#SBATCH --mail-type=ALL
#SBATCH --mail-user=userid@colorado.edu


module purge
module load gaussian/g16_c.02

# Always specify a scratch directory on a fast storage space (not /home or /projects!)
export GAUSS_SCRDIR="$(pwd)"

FILES=$(ls *.gjf | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo "Processing $FILES ...."

g16 $FILES

echo "This run performed on:"
date