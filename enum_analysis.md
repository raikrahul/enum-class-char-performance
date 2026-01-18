# Pure Enum Performance Analysis (No I/O)

## Test Code
```cpp
enum class OrderType { BUY, SELL };           // BUY=0, SELL=1
enum class OrderType2 : char { BUY='B', SELL='S' };  // BUY=66, SELL=83

for (int i = 0; i < 100000000; ++i) {
    OrderType type = (i & 1) ? OrderType::SELL : OrderType::BUY;
    sink_int = static_cast<int>(type);  // Store 0 or 1
}

for (int i = 0; i < 100000000; ++i) {
    OrderType2 type = (i & 1) ? OrderType2::SELL : OrderType2::BUY;
    sink_char = static_cast<char>(type);  // Store 66 or 83
}
```

## Results
```
int enum:  251-265ms
char enum: 295-302ms

char enum is 15-20% SLOWER
```

## Assembly Analysis

### int enum (FAST)
```asm
# Ternary: (i & 1) ? 1 : 0
movl    -12(%rbp), %edx        # Load i
andl    $1, %edx               # i & 1
xorl    %eax, %eax             # eax = 0 (BUY)
movl    $1, %ecx               # ecx = 1 (SELL)
cmpl    $0, %edx               # Compare (i & 1) with 0
cmovnel %ecx, %eax             # Conditional move: if != 0, eax = 1

# Store enum
movl    %eax, -16(%rbp)        # type = eax (0 or 1)

# Cast and sink
movl    -16(%rbp), %eax        # Load type
movl    %eax, sink_int(%rip)   # Store to volatile

Total: 8 instructions
```

### char enum (SLOW)
```asm
# Ternary: (i & 1) ? 'S' : 'B'
movl    -12(%rbp), %ecx        # Load i
andl    $1, %ecx               # i & 1
movb    $83, %al               # al = 'S' (83)
movb    $66, %dl               # dl = 'B' (66)
movb    %dl, -42(%rbp)         # Spill 'B' to stack
cmpl    $0, %ecx               # Compare (i & 1) with 0
movb    %al, -41(%rbp)         # Spill 'S' to stack
jne     .LBB4_6                # Jump if != 0
movb    -42(%rbp), %al         # Reload 'B' from stack
movb    %al, -41(%rbp)         # Spill to another location
.LBB4_6:
movb    -41(%rbp), %al         # Reload result
movb    %al, -13(%rbp)         # type = al

# Cast and sink
movb    -13(%rbp), %al         # Load type
movb    %al, sink_char(%rip)   # Store to volatile

Total: 14 instructions with multiple stack spills
```

## Why char enum is slower

### Problem 1: Immediate values too large for conditional move
```
int enum:  0 and 1 (small, fit in cmovne)
char enum: 66 and 83 (ASCII values, compiler can't use cmovne efficiently)
```

### Problem 2: Register pressure
```
int enum:  Uses 32-bit registers (eax, ecx, edx) - plenty available
char enum: Uses 8-bit registers (al, dl) - limited, causes spills
```

### Problem 3: Stack spills
```
int enum:  No spills, values stay in registers
char enum: 4 stack operations (2 stores, 2 loads) per iteration
```

### Problem 4: Branch instead of conditional move
```
int enum:  cmovnel (branchless, 1 cycle)
char enum: jne + movb (branch, 10-20 cycles on misprediction)
```

## Instruction Count Breakdown

| Operation | int enum | char enum |
|-----------|----------|-----------|
| Load i | 1 | 1 |
| AND operation | 1 | 1 |
| Load constants | 2 | 2 |
| Conditional | 1 (cmovne) | 1 (jne) + branch |
| Stack spills | 0 | 4 |
| Store enum | 1 | 1 |
| Load enum | 1 | 1 |
| Store to sink | 1 | 1 |
| **Total** | **8** | **14** |

## Memory Operations

```
int enum:  2 memory ops (load from stack, store to volatile)
char enum: 6 memory ops (4 stack spills + load + store to volatile)
```

## Why the Original Benchmark Showed 3.5× Speedup

Original test:
```cpp
std::cout << static_cast<int>(type);   // 335ms - calls operator<<(int)
std::cout << static_cast<char>(type);  // 95ms  - calls operator<<(char)
```

The speedup was NOT from the enum.
The speedup was from operator<<(char) being 3.5× faster than operator<<(int).

operator<<(int):
- Sign checking
- Division by 10 (slow)
- Modulo by 10 (slow)
- ASCII conversion
- ~50 instructions

operator<<(char):
- Direct byte write
- ~10 instructions

## Conclusion

**Without I/O:**
- int enum: FASTER (simpler assembly, no spills, conditional move)
- char enum: SLOWER (complex assembly, stack spills, branches)

**With cout:**
- int enum: SLOWER (operator<<(int) does int-to-string conversion)
- char enum: FASTER (operator<<(char) writes byte directly)

**The enum itself doesn't determine performance.**
**The operation you perform on it does.**

## Key Insight

The 3.5× speedup was a RED HERRING.

It wasn't:
- movb vs movl (negligible)
- 1 byte vs 4 bytes (negligible for single values)
- char enum vs int enum (char is actually slower)

It was:
- operator<<(char) vs operator<<(int) (3.5× difference)
- Avoiding int-to-string conversion (the real win)

The enum's type just happened to select the faster operator<< overload.
