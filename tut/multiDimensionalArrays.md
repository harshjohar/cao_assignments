# Truth abt memory
Memory is just a single dimensional array, therefore a multi-dimensional array is implemented as sets of single dimensional arrays.

# ways to implement
## Row Major (most used)
Elements are arranged in the memory row-wise, i.e., one row after other

```Address = baseAddr + (rowIndex * colSize + colIndex) * dataSize```
## Column Major
Elements are arranged column wise, i.e., one column after other

```Address = baseAddr + (colIndex * rowSize + rowIndex) * dataSize```

# Implementation
It is implemented in [MultiDimensionalArray](./multiDimensionalArrays.asm)