.data
    marray: .word 66, 96
    .word 10, 9
    size: .word 2
    .eqv DATA_SIZE 4
    newline: .asciiz "\n"
    diagonalbefore: .asciiz "diagonal element before: "
    diagonalafter: .asciiz "diagonal element after: "
.text
    main:
    la $a0, marray
    lw $a1, size
    jal diagonal
    li $v0,10
    syscall
    diagonal:
    li $v0, 0
    li $t0, 0
    loop:
    la $a0, marray
    lw $a1, size
    mul $t1, $t0, $a1
    add $t1, $t1, $t0
    mul $t1, $t1, DATA_SIZE
    add $t1, $t1, $a0
    lw $t2, ($t1)
    li $v0,4
    la $a0, diagonalbefore
    syscall
    li $v0,1
    move $a0, $t2
    syscall
    li $v0,4
    la $a0, newline
    syscall
    add $t2, $t2, 3
    li $v0,4
    la $a0, diagonalafter
    syscall
    li $v0,1
    move $a0, $t2
    syscall
    li $v0,4
    la $a0, newline
    syscall
    add $v0, $v0, $t2
    addi $t0, $t0, 1
    blt $t0, $a1, loop
    jr $ra