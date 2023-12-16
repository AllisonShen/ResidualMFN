# plot the FSC results

import matplotlib.pyplot as plt

#read the fsc.txt file
#path = /scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc
#save the plot to /scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc.png


#call the function
fsc_scale_0 = "/scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc/fsc_0.txt"

fsc_scale_1 = "/scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc/fsc_1.txt"

fsc_scale_2 = "/scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc/fsc_2.txt"
path_output = "/scratch/network/xs6153/ResidualMFN/results/10L5_180_fsc/10L5_180_fsc.png"
#now draw three curves in one plot
def plot_fsc_only_one_curve(path):
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

def plot_fsc_three_curves(path1, path2, path3, path_output):
    f1 = open(path1, 'r')
    f2 = open(path2, 'r')
    f3 = open(path3, 'r')
    lines1 = f1.readlines()
    lines2 = f2.readlines()
    lines3 = f3.readlines()
    f1.close()
    f2.close()
    f3.close()
    x1 = []
    y1 = []
    x2 = []
    y2 = []
    x3 = []
    y3 = []
    for line in lines1:
        line = line.split()
        x1.append(float(line[0]))
        y1.append(float(line[1]))
    for line in lines2:
        line = line.split()
        x2.append(float(line[0]))
        y2.append(float(line[1]))
    for line in lines3:
        line = line.split()
        x3.append(float(line[0]))
        y3.append(float(line[1]))
    plt.plot(x1, y1, label = 'scale 0')
    plt.plot(x2, y2, label = 'scale 1')
    plt.plot(x3, y3, label = 'scale 2')
    plt.xlabel('Resolution (A)')
    plt.ylabel('FSC')
    plt.legend()
    plt.savefig(path_output)
    plt.close()

plot_fsc_three_curves(fsc_scale_0, fsc_scale_1, fsc_scale_2, path_output)