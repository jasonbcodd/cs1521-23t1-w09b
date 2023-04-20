#include <stdint.h>
#include <stdio.h>

int main() {

    int32_t res;
    int32_t a = 30000;
    int32_t b = 30000;x
    res = a + b;

    printf("%d\n", res);

}


uint32_t extract_six_middle(uint32_t input) {
    return input >> (16 - 3) & ((1 << 6) - 1);
}