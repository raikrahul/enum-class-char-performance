#include <cstdio>

enum class Side : char { BUY = 'B', SELL = 'S' };

void print_sides() {
  for (int i = 0; i < 100; ++i)
    __builtin_putchar(static_cast<char>(Side(i & 1)));
}
