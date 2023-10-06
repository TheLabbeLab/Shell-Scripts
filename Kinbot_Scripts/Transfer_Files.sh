#!/bin/bash
# make Tansfer folder
mkdir Transfer
mkdir Mess_Inputs
mkdir log_Files
mkdir chk_Files
mkdir ase_Files
mkdir com_Files
mkdir py_Files
mkdir sbatch_Files
mkdir slurm_Files

# moves files to the folder according to the file extension
mv me Mess_Inputs
mv *.mess Mess_Inputs 
mv *.log log_Files
mv *.chk chk_Files
mv *.ase ase_Files
mv *.com com_Files
mv *.py py_Files
mv *.sbatch sbatch_Files 
mv slurm* slurm_Files

#Transfer the Pesviewer.inp, XYZ folder, Log Folder and mess files folder into the Transfer folder
mv pesviewer.inp Transfer
mv xyz Transfer 
mv Mess_Inputs Transfer
mv log_Files Transfer
mv summary* Transfer
