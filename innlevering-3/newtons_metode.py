import math
from typing import Callable


def f(x: float) -> float:
    return 4 - x + math.sin(x) / 3


def derivert(
    f: Callable[[float], float], d_x: float = 1e-4
) -> Callable[[float], float]:
    return lambda x: (f(x + d_x) - f(x)) / d_x


def newtons_metode(
    x: float, f: Callable[[float], float], presisjon: float = 1e-4
) -> float:
    while abs(f(x)) > presisjon:
        x = x - f(x) / derivert(f)(x)

    return x


def main() -> None:
    r = newtons_metode(x=0.32, f=f)

    print(f"{r = }")


if __name__ == "__main__":
    main()
