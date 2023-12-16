#!/bin/bash
#SBATCH --job-name=test         # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=16G         # memory per cpu-core (4G is default)
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --time=00:05:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=xs6153@princeton.edu

module purge
module load anaconda3/2023.9
conda env list
source ~/.bashrc
conda activate resmfn
conda env list

cd /scratch/network/xs6153/ResidualMFN
python train.py /scratch/network/xs6153/resmfndata/ /scratch/network/xs6153/resmfndata/N5_snr0.1_ctf /scratch/network/xs6153/resmfndata/recon --epochs 3