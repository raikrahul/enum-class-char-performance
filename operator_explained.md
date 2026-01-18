# Understanding operator<< from First Principles

## Axiom 1: Functions
```cpp
int add(int a, int b) { return a + b; }
```
- Function takes inputs → produces output
- `add(2, 3)` → `5`

## Axiom 2: Operators are Functions
```cpp
int operator+(int a, int b) { return a + b; }
```
- `2 + 3` is syntax sugar for `operator+(2, 3)`
- `a + b` === `operator+(a, b)`

## Axiom 3: Custom Operators
```cpp
struct Point { int x, y; };
Point operator+(Point a, Point b) {
    return Point{a.x + b.x, a.y + b.y};
}
```
- You can define `+` for your own types
- `p1 + p2` calls your custom function

## Axiom 4: The << Operator
```cpp
// This is just a function named "operator<<"
ReturnType operator<<(LeftType left, RightType right) {
    // do something
    return something;
}
```
- `cout << 5` === `operator<<(cout, 5)`
- Left side: `cout` (the stream object)
- Right side: `5` (the value to print)

## Axiom 5: References
```cpp
int x = 10;
int& ref = x;  // ref is an alias for x
ref = 20;      // x is now 20
```
- `&` after type = reference (alias)
- Changes to reference affect original
- No copying, just another name

## Axiom 6: Return by Reference for Chaining
```cpp
ostream& operator<<(ostream& out, int value) {
    // print value
    return out;  // Return the same stream
}
```
- Returns reference to same object
- Enables: `cout << 1 << 2 << 3`
- `(cout << 1) << 2` → `cout << 2`

## Now the Actual Code:

```cpp
operator<<(basic_ostream<char, _Traits>& __out, char __c)
```

**Translation:**
- Function name: `operator<<`
- Parameter 1: `__out` - reference to stream object
- Parameter 2: `__c` - the character to print
- Returns: reference to the same stream

**Line by line:**

```cpp
if (__out.width() != 0)
```
- Check if user set a minimum width
- `width()` returns 0 by default
- If width set (e.g., 5), need padding

```cpp
return __ostream_insert(__out, &__c, 1);
```
- If width != 0, use special function for padding
- `&__c` = address of the character
- `1` = print 1 character
- Return early (skip rest of function)

```cpp
__out.put(__c);
```
- Normal case: no width set
- `put()` = write one byte to buffer
- Directly writes `__c` to output

```cpp
return __out;
```
- Return the stream object
- Allows chaining: `cout << 'A' << 'B'`

## Complete Flow:

```
cout << 'S'
  ↓
operator<<(cout, 'S')
  ↓
width = 0? → YES
  ↓
cout.put('S')
  ↓
buffer[pos] = 83
pos++
  ↓
return cout
```

## Why This Matters:

**Printing char:**
```cpp
cout << 'S'  →  put(83)  →  1 byte write  →  FAST
```

**Printing int:**
```cpp
cout << 1  →  convert 1 to "1"  →  multiple operations  →  SLOW
```

That's why `enum class : char` is faster - it uses the simple char path!
