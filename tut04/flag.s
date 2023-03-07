FLAG_ROWS = 6
FLAG_COLS = 12

.text
main:
main__for_row_begin:
        li      $t0, 0                                  # int row = 0;
main__for_row_cond:
        bge     $t0, FLAG_ROWS, main__for_row_end
main__for_col_begin:
        li      $t1, 0                                  # int col = 0;
main__for_col_cond:
        bge     $t1, FLAG_COLS, main__for_col_end


        la      $t2, flag                               # $t2 = &flag[0][0]
        mul     $t3, $t0, FLAG_COLS
        add     $t2, $t2, $t3                           # $t2 = &flag[row][0]
        add     $t2, $t2, $t1                           # $t2 = &flag[row][col]

        lb      $t2, ($t2)                              # $t2 = flag[row][col]

        move    $a0, $t2
        li      $v0, 11
        syscall                                         # printf("%c", flag[row][col])


        addi    $t1, $t1, 1                             # col++
        b       main__for_col_cond
main__for_col_end:

        li      $a0, '\n'
        li      $v0, 11
        syscall                                         # printf("%c", '\n')

        addi    $t0, $t0, 1                             # row++
        b       main__for_row_cond
main__for_row_end:

        li      $v0, 0
        jr      $ra                                     # return 0


.data
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'