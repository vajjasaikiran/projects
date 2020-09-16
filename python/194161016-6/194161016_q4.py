###question 4
import numpy as np
import random
A = np.random.randint(1,11,size=(10,10))
x = np.random.randint(1,11,size=(10,1))
b = np.dot(A,x)
x1 = np.linalg.solve(A,b)
print("solution for generated 10 by 10 system of equations in A*x = b form")
print("coefficient matrix:")
print(A)
print("b vector")
print(b)
print("solution for Ax = b")
print(x1)