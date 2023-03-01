N_SIZE = 10

        .text

        # int i in $t0
main:

        li      $t0, 0                          # int i = 0;


        la      $t1, numbers                    # $t1 = &numbers[0]

main__while_i_lt_n_size:
        bge     $t0, N_SIZE, main__end_while_i_lt_n_size

        li      $v0, 5
        syscall

        # do something

        mul     $t2, $t0, 4
        add     $t2, $t2, $t1
        sw      $v0, ($t2)


        addi    $t0, $t0, 1                     # i++;
        b       main__while_i_lt_n_size
main__end_while_i_lt_n_size:



        li      $t0, 0                          # i = 0
main__while_i_print:
        bge     $t0, N_SIZE, main__end_while_i_print


        lw      $a0, ($t1)
        addi    $a0, $a0, 1
        sw      $a0, ($t1)
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t1, $t1, 4

        addi    $t0, $t0, 1                     # i++;
        b main__while_i_print
main__end_while_i_print:

        li      $t0, 0                          # i = 0
main__while_i_print2:
        bge     $t0, N_SIZE, main__end_while_i_print2

        mul     $t2, $t0, 4

        lw      $a0, numbers($t2)
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        addi    $t1, $t1, 4

        addi    $t0, $t0, 1                     # i++;
        b main__while_i_print2
main__end_while_i_print2:


        li      $v0, 0
        jr      $ra
        .data
numbers: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0