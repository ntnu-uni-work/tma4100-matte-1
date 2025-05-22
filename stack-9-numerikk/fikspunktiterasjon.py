import math


def f(x: float) -> float:
    return 3 + 1 / 3 * math.sin(x)


x = 0.3

for i in range(3):
    x = f(x)


print(x)
