# Solve Tower of Hanoi problem. 
def TowerOfHanoi(n, s, d, a):
    if n==1:
        print ("Move disk 1 from rod", s, "to rod", d)
        return
    TowerOfHanoi(n-1, s, a, d)
    print ("Move disk", n, "from rod", s, "to rod", d)
    TowerOfHanoi(n-1, a, d, s)
          
n = 100
TowerOfHanoi(n,'X','Y','Z')