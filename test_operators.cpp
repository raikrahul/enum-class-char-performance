#include <fstream>

enum class OrderType { BUY, SELL };
enum class OrderType2 : char { BUY='B', SELL='S' };

void test_int() {
    std::ofstream f("/dev/null");
    OrderType type = OrderType::SELL;
    f << static_cast<int>(type);  // What happens here?
}

void test_char() {
    std::ofstream f("/dev/null");
    OrderType2 type = OrderType2::SELL;
    f << static_cast<char>(type);  // What happens here?
}

int main() {
    test_int();
    test_char();
    return 0;
}
