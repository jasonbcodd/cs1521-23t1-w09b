#include <stdint.h>
#include <stdio.h>

void print_to_binary(uint32_t x);

int main() {
    int x = 723;
    print_to_binary(x);
    printf("\n");
}

void print_to_binary(uint32_t x) {
    for (int i = 0; i < 32; i++) {
        printf("%d", ((x >> (32 - i - 1)) & 1));
    }
}

uint32_t set_13_bit_1(uint32_t x) {
    return x | (1 << 13);

}

uint32_t set_13_bit_0(uint32_t x) {
    return x & ~(1 << 13);

}