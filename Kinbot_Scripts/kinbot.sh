#!/bin/bash
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=24:00:00
#SBATCH --job-name=Toluene_Radicals
#SBATCH --account=ucb273_peak1
#SBATCH --mail-type=ALL
#SBATCH --mail-user= Enter Email

dos2unix kinbot.json
dos2unix job_template.text
dos2unix Transfer_Files.sh
chmod 777 Transfer_Files.sh

module purge
module use /projects/nila3952/public/modules
module load miniconda
module load gaussian/16_avx2
source activate kinbot_2.2.1

kinbot kinbot.json

./Transfer_Files.sh
