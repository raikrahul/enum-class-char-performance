#include <print>
#include <utility>

enum class OrderType { BUY, SELL };

int main() {
  OrderType type = OrderType::BUY;
  std::println("{}", std::to_underlying(type));
  return 0;
}
