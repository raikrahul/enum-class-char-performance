#include <cstdio>

enum class Side { BUY, SELL };

const char* side_to_str(Side s) {
    return s == Side::BUY ? "B" : "S";
}

void print_sides() {
    for (int i = 0; i < 100; ++i)
        __builtin_putchar(*side_to_str(Side(i & 1)));
}
