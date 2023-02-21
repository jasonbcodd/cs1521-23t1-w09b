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



        bgt             $t0, SQUARE_MAX, x_gt_sq_max
        b               x_gt_sq_max_else


x_gt_sq_max:
        li              $v0, 4
        la              $a0, input_too_big
        syscall
        b               end



x_gt_sq_max_else:
        mul             $t1, $t0, $t0   # y = x * x


        li              $v0, 1
        move            $a0, $t1
        syscall                         # print("%d", y);

        li              $v0, 11
        li              $a0, '\n'       # printf("%c", \n);
        syscall

        b               end

end:

        li              $v0, 0
        jr              $ra             # return 0;


        .data
print_prompt:
        .asciiz "Enter a number: "

input_too_big:
        .asciiz "square too big for 32 bits\n"
