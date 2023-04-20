#include <stdint.h>
#include <stdio.h>

int dat[] = {1, 8, 10, 15 ,16, 100, 127, 200};

int main() {

    for (int i = 0; i < 8; i++) {
        printf("%d, 0x%x, 0%o\n", dat[i], dat[i], dat[i]);
    }


    return 0;
}