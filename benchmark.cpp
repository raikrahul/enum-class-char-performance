#include <iostream>
#include <cstdio>
#include <chrono>
#include <fstream>

void benchmark_cout() {
    auto start = std::chrono::high_resolution_clock::now();
    
    std::ofstream null_stream("/dev/null");
    for (int i = 0; i < 1000000; ++i) {
        null_stream << i;
        null_stream << 'A';
        null_stream << i;
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "cout time: " << duration.count() << " microseconds\n";
}

void benchmark_printf() {
    auto start = std::chrono::high_resolution_clock::now();
    
    FILE* null_file = fopen("/dev/null", "w");
    for (int i = 0; i < 1000000; ++i) {
        fprintf(null_file, "%d", i);
        fprintf(null_file, "%c", 'A');
        fprintf(null_file, "%d", i);
    }
    fclose(null_file);
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "printf time: " << duration.count() << " microseconds\n";
}

int main() {
    std::cout << "Running benchmarks (no optimization)...\n\n";
    
    benchmark_cout();
    benchmark_printf();
    
    return 0;
}
