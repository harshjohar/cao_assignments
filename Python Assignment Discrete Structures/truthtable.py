# Print truth table of a compound statement. 
print('p q r s t truthValue')
for p in range(2):
        for q in range(2):
                for r in range(2):
                        for s in range(2):
                                for t in range(2):
                                        ans = bool((not((p & q) & r)) | (s | t))
                                        print(p, q, r, s, t, int(ans))