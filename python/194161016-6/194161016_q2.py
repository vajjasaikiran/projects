#question 2
import numpy as np
from random import shuffle

def oneHotEncoding(randomArray):
    lis = ['jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec']
    m,n = randomArray.shape
    result = np.empty((m,n,n),dtype=int)
    for i in range(m):
        for j in range(n):
            currentString = randomArray[i][j]
            index = lis.index(currentString.decode('utf-8'))
            encoding = np.zeros((1,n),dtype=int)
            encoding[:,index] = 1
            result[i,j,:] = encoding
    return result
tempArray = np.array(['jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'])
randomArray = np.empty((12,12),dtype="S3")
for i in range(12):
    shuffle(tempArray)
    randomArray[i,:] = tempArray
outputArray = oneHotEncoding(randomArray)
print("One hot encoding row by row")
for i in range(12):
    print("one hot for random",end=" ")
    print(randomArray[i,:])
    print(outputArray[i,:,:])