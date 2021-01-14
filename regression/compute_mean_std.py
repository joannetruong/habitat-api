

import numpy as np
import scipy.stats

#mean = [0.017, 0.042]
#cov = [0.007, 0.023]

mean = [0.031]
cov = [0.026]

#mean = [0.001, 0.005]
#cov = [0.001, 0.004]

#mean = [0.043]
#cov = [0.017]


#mean = [0.014, 0.009]
#cov = [0.006, 0.005]

#mean = [0.008]
#cov = [0.004]

#mean = [0.003, 0.003]
#cov = [0.002, 0.003]

#mean = [0.023] 
#cov = [0.012]

sample = np.zeros_like(mean)
cov = np.diag(cov)
for i in range(len(mean)):
    stdev = np.sqrt(cov[i, i])
    mean1 = mean[i]
    print('mean: ', mean1)
    print('std: ', stdev)
    print('var: ', stdev**2)
