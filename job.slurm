#!/bin/bash
#SBATCH --job-name=rmfn         # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=64G         # memory per cpu-core (4G is default)
#SBATCH --gres=gpu:4            # number of gpus per node
#SBATCH --time=04:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=xs6153@princeton.edu
#SBATCH --constraint=v100


module purge
module load anaconda3/2023.9
conda env list
source ~/.bashrc
conda activate resmfn
conda env list

cd /scratch/network/xs6153/ResidualMFN
# python train_cryoem.py /scratch/network/xs6153/resmfndata/1OL5_180_12A /scratch/network/xs6153/resmfndata/1AK2_180_12A/N500_snr0.1_ctf /scratch/network/xs6153/resmfndata/results/1OL5_12_180_epoch50 --epochs 50  --bacon-hidden-dim 64 --bacon-hidden-layers 3 --bacon-iter 30 
# Submitted batch job 1959062
# python train_cryoem.py /scratch/network/xs6153/resmfndata/1AK2_180 /scratch/network/xs6153/resmfndata/1AK2_180/N500_snr0.1_ctf /scratch/network/xs6153/resmfndata/results/1AK2_180_epoch50 --epochs 50  --bacon-hidden-dim 64 --bacon-hidden-layers 3 --bacon-iter 30
# Submitted batch job 1959063
python train_cryoem.py /scratch/network/xs6153/resmfndata/1AK2_180_12A /scratch/network/xs6153/resmfndata/1AK2_180/N500_snr0.1_ctf /scratch/network/xs6153/resmfndata/results/1AK2_12_epoch50 --epochs 50  --bacon-hidden-dim 64 --bacon-hidden-layers 3 --bacon-iter 30
# Submitted batch job 1959065

