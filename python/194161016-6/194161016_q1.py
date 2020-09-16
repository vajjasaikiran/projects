import numpy as np
randomArray = np.random.randint(1,11,size=(10,10))
outputArray = np.zeros((1,10),dtype=int)
i=1
print(randomArray)
for row in randomArray:
   for val in row:
     outputArray[0][val-1] += 1
   print("output array values: for row ",i,end=":")
   i = i+1
   print(outputArray[0])
   outputArray = np.zeros((1,10),dtype=int)