# List subsets of set {1, 2, 3, …, n} where n is from 1 to 10 
output = []
def subsets(arr, i, subset):
    global output
    if i == len(arr):
        a = subset.copy()
        output.append(a)
        return
    subsets(arr, i + 1, subset)
    subset.append(arr[i])
    subsets(arr, i + 1, subset)
    subset.pop()
    return

arr = [int(x) for x in input().split()]
subsets(arr, 0, [])
print(output)
