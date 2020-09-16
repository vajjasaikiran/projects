##question 3
import numpy as np
matrixSize = input("Enter the size of the square matrix:\n")
randomArray = np.random.randint(1,101,size=(int(matrixSize),int(matrixSize)))

print("random Array generated:")
print(randomArray)
#matrix transpose
print("Matrix transpose:")
print(np.transpose(randomArray))

#matrix determinant
print("Matrix determinant:")
print(np.linalg.det(randomArray))

#matrix trace
print("Matrix trace")
print(np.trace(randomArray))

#matrix inverse
print("Matrix inverse:")
print(np.linalg.inv(randomArray))

#matrix moore-penrose pseudo-inverse of matrix
print("Matrix moore-penrose pseudo-inverse:")
print(np.linalg.pinv(randomArray))

#QR decomposition
print("QR decomposition of matrix:")
q,r = np.linalg.qr(randomArray)
print("Q unitary matrix:")
print(q)
print("R upper triangular matrix:")
print(r)

i=1
#eigenvalues and eigen vectors
eigenValues, eigenVectors = np.linalg.eig(randomArray)
print("eigenValues:")
for eigValue in eigenValues:
    print("eigenValue",i)
    print(eigValue)
    i += 1
print("eigen Vectors:")
m,n = np.shape(eigenVectors)
# print(eigenVectors)
for i in range(n):
    print("eigen Vector",i+1)
    print(eigenVectors[:,i])