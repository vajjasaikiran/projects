##question 5

import matplotlib.pyplot as plt
from matplotlib import interactive
import numpy as np
from scipy import stats
#normal distribution
plt.figure(1)
mean, sigma = 1, 0.3 # mean and standard deviation
s = np.random.default_rng().normal(mean, sigma, 100000)
count, bins, ignored = plt.hist(s, 500, density=True)
plt.plot(bins, 1/(sigma * np.sqrt(2 * np.pi)) *
                np.exp( - (bins - mean)**2 / (2 * sigma**2) ),
          linewidth=2, color='r')

plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('normal distribution')
interactive(True)
plt.show()

#multivariate normal distribution
mean = [1, 2]
covMatrix = [[1, 2], [3, 100]]
x, y = np.random.default_rng().multivariate_normal(mean, covMatrix, 100000).T
plt.figure(2)
plt.plot(x, y, 'x')
plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('multivariate normal distribution')
plt.show() 

#exponential distribution
x = np.random.default_rng().exponential(float(2), size = (100000))
plt.figure(3)
plt.hist(x, bins=50)
plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('exponential distribution')
plt.show()


#Dirichlet Distribution
s = np.random.default_rng().dirichlet((10,5,3), 20).transpose()
plt.figure(4)
plt.hist(s,bins=2)
plt.xlabel('random variable x')
plt.ylabel('distribution function')
plt.title('dirichlet distribution')
plt.show()

#Logistic Distribution
s = np.random.default_rng().logistic(5, 2, 100000)
plt.figure(5)
plt.hist(s, bins=50)
plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('logistic distribution')
plt.show()

#log normal Distribution
s = np.random.default_rng().lognormal(400,1, 100000)
plt.figure(6)
plt.hist(s, bins=50)
plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('lognormal distribution')
plt.show()

#power law distribution
rvs = np.random.power(5, 100000)
xx = np.linspace(0,1,100)
powpdf = stats.powerlaw.pdf(xx,5)
plt.figure(7)
plt.hist(rvs, bins=50, density=True)
plt.plot(xx,powpdf,'r-')
plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('power law distribution')
plt.show()


#Uniform Distribution
s = np.random.default_rng().uniform(-1,1,100000)
plt.figure(8)
plt.hist(s, 15, density=True)
plt.xlabel('random variable x')
plt.ylabel('probability density function')
plt.title('Uniform Distribution')
interactive(False)
plt.show()
