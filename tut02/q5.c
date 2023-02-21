// Squares a number, unless its square is too big for a 32-bit integer.
// If it is too big, prints an error message instead.

#include <stdio.h>

#define SQUARE_MAX 46340

int main(void) {
    int x, y;

    printf("Enter a number: ");
    scanf("%d", &x);

    if (x > SQUARE_MAX) {
        goto x_gt_sq_max;
    } else {
        goto x_gt_sq_max_else;
    }

    x_gt_sq_max:
    printf("square too big for 32 bits\n");
    goto end;

    x_gt_sq_max_else:
    y = x * x;
    printf("%d\n", y);

    end:

    return 0;
}


int fn2() {

    int x= 5;
    int y = 4;

    some_label:
    printf("%d\n", x);

}