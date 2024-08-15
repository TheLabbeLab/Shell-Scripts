#!/bin/bash
#SBATCH --partition=amem
#SBATCH --qos=mem
#SBATCH --nodes=1
#SBATCH --ntasks=48
#SBATCH --mem=975GB
#SBATCH --time=96:00:00
#SBATCH --job-name=E1-mem1
#SBATCH --account=ucb273_peak2
#SBATCH --mail-type=ALL
#SBATCH --mail-user=prsh1291@colorado.edu
#SBATCH --exclusive

module purge
module load gaussian/g16_c.02

# Always specify a scratch directory on a fast storage space (not /home or /projects!)
export GAUSS_SCRDIR="$(pwd)"
#export GAUSS_ZDEF=${SLURM_SCRATCH},400GB,${GAUSS_SCRDIR},-1

FILES=*.gjf
for f in $FILES
do
 DATE=$(date +"%Y-%m-%d")
 name=$(echo "$f" | cut -f 1 -d ".")
 LogName="${name}_${DATE}"
 g16 <$name.gjf> $LogName.log
 echo "Processing $name file..."
done

date