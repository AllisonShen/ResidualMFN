#visulize the particle images: particle_stack.npy

import numpy as np
import matplotlib.pyplot as plt
import os
import sys
import glob
path = "/scratch/network/xs6153/ResidualMFN/data/1OL5_180_1A/N500_snr0.1_ctf/particle_stack.npy"
output = "/scratch/network/xs6153/ResidualMFN/data/1OL5_180_1A/N500_snr0.1_ctf/imgs"

def visulize_particle(path, output):
    if not os.path.exists(output):
        os.makedirs(output)
    imgs = np.load(path)
    #print shape
    print(imgs.shape)
    # for i in range(imgs.shape[0]):
    #     plt.imshow(imgs[i])
    #     plt.savefig(output + '/' + str(i) + '.png')
    #     plt.close() 
visulize_particle(path, output)
