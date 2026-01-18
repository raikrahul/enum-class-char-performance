#include <iostream>

enum class OrderType { BUY, SELL };

constexpr char to_char(OrderType o) noexcept {
  return o == OrderType::BUY ? 'B' : 'S';
}

int main() {
  OrderType type = OrderType::BUY;
  std::cout << to_char(type);
  return 0;
}
