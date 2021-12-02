# Write a recursive function to compute gcd of two numbers.
def __gcd(a, b):
        if not a:
                return b
        return __gcd(b%a, a)
a, b = map(int, input().split())
print(__gcd(a, b))
        