.text
main:
        push    $ra

        li      $a0, 11
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19

        jal     sum4

        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        pop     $ra


##################
# Arguments:
#       int a in $a0
#       int b in $a1
#       int c in $a2
#       int d in $a3
sum4:
sum4__prologue:
        push    $ra
        push    $s0
        push    $s1
        push    $s2
        push    $s3
        push    $s4


        move    $s0, $a0
        move    $s1, $a1
        move    $s2, $a2
        move    $s3, $a3

        jal     sum2
        move    $s4, $v0



        move    $a0, $s2
        move    $a1, $s3
        jal     sum2


        move    $a0, $s4
        move    $a1, $v0
        jal     sum2



sum4__epilogue:
        pop     $s4
        pop     $s3
        pop     $s2
        pop     $s1
        pop     $s0
        pop     $ra

        jr      $ra

##################


##################
# Arguments:
#       int x in $a0
#       int y in $a1
sum2:
sum2__prologue:
        push    $ra

        add     $v0, $a0, $a1

sum2__epilogue:
        pop     $ra
        jr      $ra

##################