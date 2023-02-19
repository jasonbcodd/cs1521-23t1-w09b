#include <stdio.h>

void print_array_iterative(int nums[], int len) {
    for (int i = 0; i < len; i++) {
        printf("%d\n", nums[i]);
    }
}

void print_array_recursive(int nums[], int index, int len) {
    if (index == len) {
        return;
    }

    printf("%d\n", nums[index]);
    print_array_recursive(nums, index + 1, len);
}


int main(void) {
    int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    printf("ITERATIVE:\n");
    print_array_iterative(nums, 10);
    printf("RECURSIVE:\n");
    print_array_recursive(nums, 0, 10);

    return 0;
}
