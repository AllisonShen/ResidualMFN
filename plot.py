# plot the FSC results

import matplotlib.pyplot as plt

#read the fsc.txt file
#path = /scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc
#save the plot to /scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc.png

def plot_fsc(path):
    f = open(path + '/fsc.txt', 'r')
    lines = f.readlines()
    f.close()
    x = []
    y = []
    for line in lines:
        line = line.split()
        x.append(float(line[0]))
        y.append(float(line[1]))
    plt.plot(x, y)
    plt.xlabel('Resolution (A)')
    plt.ylabel('FSC')
    plt.savefig(path + '/fsc.png')
    plt.close()
#call the function
fsc_file = "/scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc"
path_output = "/scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc/10L5_180_fsc.png"
plot_fsc(fsc_file)