# List the integer solutions of a constrained linear equation.
# x1 + x2 + x3 = 10
cnt = 0
for x1 in range(11):
        for x2 in range(11):
                for x3 in range(11):
                        cnt += (x1 + x2 + x3 == 10)
                        if(x1+x2+x3==10):
                            print(x1, x2, x3)
print(cnt)
