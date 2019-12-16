from collections import namedtuple
import sys

x = 2

class Potato:

    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

a = {"a": 1, "b": 2, "c": 3}
b = Potato(1, 2, 3)

print(sys.getsizeof(a, x))
print(sys.getsizeof(b, x))

print(b.a)

