        .text
main:
for_x__init:                    # for (int x = 24; x < 42, x += 3) {
        # int x in $t0
        li      $t0, 24
for_x__cond:
        bge     $t0, 42, for_x__end
a:
        li      $v0, 1
b:
        move    $a0, $t0
c:
        syscall                 # printf("%d", x);
d:
        li      $v0, 11
        li      $a0, '\n'       # printf("%c", '\n');
        syscall

for_x__iter:
        addi    $t0, $t0, 3     # x += 3
        b       for_x__cond

for_x__end:


        li      $v0, 0
        jr      $ra