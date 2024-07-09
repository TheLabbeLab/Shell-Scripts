#!/bin/bash
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --time=24:00:00
#SBATCH --job-name=m062x
#SBATCH --account=ucb273_peak2
#SBATCH --mail-type=ALL
#SBATCH --mail-user=prsh1291@colorado.edu

module purge
module load gaussian/g16_c.02

# Always specify a scratch directory on a fast storage space (not /home or /projects!)
export GAUSS_SCRDIR="$(pwd)"

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
