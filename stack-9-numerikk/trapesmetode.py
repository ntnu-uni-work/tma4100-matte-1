def f(x: float) -> float:
    return 3 + x**2


a = 0
b = 3
n = 4

d_x = (b - a) / n

I = 0

for i in range(n):
    I += (f(a + d_x * i) + f(a + d_x * (i + 1))) * d_x / 2

print(I.as_integer_ratio())
