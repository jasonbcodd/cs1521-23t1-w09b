.text
main:
        li      $v0, 4
        la      $a0, string
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0
        mult    $t1, $t0, $t0


        li      $v0, 1
        move    $a0, $t1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        .data
string:
        .ascizz "Enter a number: "