.text
main:

        push $ra

        la      $a0, array
        li      $a1, 10
        jal     max

        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        li      $v0, 0

        pop $ra
        jr      $ra                     # return 0;


########################
# Arguments:
#       int array[] in $a0
#       int length in $a1

# Locals:
#       int first_element in $t1
#       int max_so_far in $t0
max:

max__prologue:
        push    $ra
        push    $s0

max__body:
        lw      $t1, ($a0)                              # int first_element = $s0 = array[0]

        bne     $a1, 1, max__length_not_one             # if (length != 1) goto max__length_not_one;

        move    $v0, $s0                                # return first_element
        b       max__epilogue

max__length_not_one:
        addi    $a0, $a0, 4                             # $a0 = array[1]
        addi    $a1, $a1, -1                            # $a1 = length - 1

        jal     max                                     # max_so_far = $t0 = max(array[1], length - 1)
        move    $t0, $v0

        ble     $s0, $t0, max__first_element_le_max_so_far # if (first_element <= max_so_far) goto max__first_element_le_max_so_far
        move    $t0, $s0                                # max_so_far = first_element

max__first_element_le_max_so_far:
        move    $v0, $t0                                # return max_so_far



max__epilogue:
        pop     $s0
        pop     $ra

        jr      $ra

########################
.data

        array: .word 1,4,6,7,8,12,16,32,2562,-5