SQUARE_MAX = 46340

        .text
main:
        # int x in $t0
        # int y in $t1



        li              $v0, 4
        la              $a0, print_prompt
        syscall                         # printf("Enter a number: ");


        li              $v0, 5
        syscall
        move            $t0, $v0        # scanf("%d", &x);

        mul             $t1, $t0, $t0   # y = x * x


        li              $v0, 1
        move            $a0, $t1
        syscall                         # print("%d", y);

        li              $v0, 11
        li              $a0, '\n'       # printf("%c", \n);
        syscall

        li              $v0, 0
        jr              $ra             # return 0;



        .data
print_prompt:
        .asciiz "Enter a number: "
