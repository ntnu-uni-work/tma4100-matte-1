import math


def f(x: float) -> float:
    return 4 / (1 + x**2)


a = 0
b = 1

for n in range(1, 80):
    d_x = (b - a) / n
    I = 0

    for i in range(n):
        I += (f(a + d_x * i) + f(a + d_x * (i + 1))) * d_x / 2

    if abs(math.pi - I) <= 3e-5:
        print(n, I)
