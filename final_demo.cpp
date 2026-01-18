#include <iostream>

enum class OrderType { BUY, SELL };
enum class OrderType2 : char { BUY='B', SELL='S' };

int main() {
    OrderType t1 = OrderType::SELL;
    OrderType2 t2 = OrderType2::SELL;
    
    std::cout << "int enum value: " << static_cast<int>(t1) << "\n";
    std::cout << "char enum value: " << static_cast<char>(t2) << "\n";
    
    return 0;
}
