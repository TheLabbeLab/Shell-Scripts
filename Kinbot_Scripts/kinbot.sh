#!/bin/bash
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=24:00:00
#SBATCH --job-name=Toluene_Radicals
#SBATCH --account=ucb273_peak2
#SBATCH --mail-type=ALL
#SBATCH --mail-user= Enter Email

dos2unix kinbot.json
dos2unix job_template.text
dos2unix Transfer_Files.sh
chmod 777 Transfer_Files.sh

module purge
module use /projects/nila3952/public/modules
module load miniconda
module load gaussian/g16_c.02
source activate kinbot_2.2.1

# Always specify a scratch directory on a fast storage space (not /home or /projects!)
export GAUSS_SCRDIR="$(pwd)"

kinbot kinbot.json

./Transfer_Files.sh
