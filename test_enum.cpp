// clang-format off
#include <print>
// clang-format on

enum class OrderType { BUY, SELL };
enum class OrderType2 : char { BUY='B', SELL='S' };

constexpr char to_char(OrderType o) noexcept {
  return o == OrderType::BUY ? 'B' : 'S';
}

int main() {
  OrderType type = OrderType::SELL;
  std::println("{}", static_cast<int>(type));
  std::println("{}", to_char(type));
  
  OrderType2 type2 = OrderType2::SELL;
  std::println("{}", static_cast<char>(type2));
  return 0;
}
