#!/bin/bash
#SBATCH --job-name=rmfn         # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=32G         # memory per cpu-core (4G is default)
#SBATCH --time=01:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=xs6153@princeton.edu



module purge
module load anaconda3/2023.9
conda env list
source ~/.bashrc
conda activate eman-dev
conda env list

cd /scratch/network/xs6153/eman2/programs
python e2proc3d.py /scratch/network/xs6153/resmfndata/results/1oL5_180_epoch25/epoch_24/predicted_vol_scale2.mrc /scratch/network/xs6153/resmfndata/results/10L5_180_align/align.mrc --align rotate_translate_3d_tree --alignref /scratch/network/xs6153/resmfndata/1OL5_180/volume.mrc

# python e2proc3d.py /scratch/network/xs6153/resmfndata/results/10L5_180_epoch25/epoch_24/predicted_vol_scale1.mrc /scratch/network/xs6153/resmfndata/results/10L5_180_align/align_1.mrc --align rotate_translate_3d_tree --alignref /scratch/network/xs6153/resmfndata/1OL5_180/volume.mrc

# python e2proc3d.py /scratch/network/xs6153/resmfndata/results/10L5_180_align/align_0.mrc /scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc/fsc_0.txt --calcfsc /scratch/network/xs6153/resmfndata/1OL5_180/volume.mrc