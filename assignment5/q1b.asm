.data
    mdarray:.word 2, 5
            .word 3, 7
    md2array: .word 3,4
              .word 5,6
    newLine: .asciiz "\n"
    .eqv DATA_SIZE 4
.text
    main:
    la $a2,md2array#loading base address of array
    la $a1,mdarray # loading base address of array
    j sum
    #end the program
    exit:
    li $v0, 10
    syscall
    sum:
    add $t0,$zero,0
    mul_loop:
    add $v0,$zero,0
    la $a2,md2array#loading base address of array
    la $a1,mdarray # loading base address of array
    bgt $t0,2,exit
    mul $t1,$t0,DATA_SIZE
    add $t1,$a1,$t1
    lw $t2,($t1)#
    add $t1,$t1,DATA_SIZE
    lw $t3,($t1)#
    lw $t4,($a2)#
    mul $t4,$t4,$t2
    add $v0,$t4,0#v0 to store result
    add $a2,$a2,DATA_SIZE
    add $a2,$a2,DATA_SIZE
    lw $t4,($a2)
    mul $t4,$t4,$t3
    add $v0,$v0,$t4
    #print the sum
    move $a0,$v0
    li $v0,1
    syscall
    li $v0,4
    la $a0,newLine
    syscall
    #NEXT SUM
    la $a2,md2array
    add $a2,$a2,DATA_SIZE
    lw $t4,($a2)#
    mul $t4,$t4,$t2
    add $v0,$t4,0#v0 to store result
    add $a2,$a2,DATA_SIZE
    add $a2,$a2,DATA_SIZE
    lw $t4,($a2)
    mul $t4,$t4,$t3
    add $v0,$v0,$t4
    #print the sum
    move $a0,$v0
    li $v0,1
    syscall
    li $v0,4
    la $a0,newLine
    syscall
    add $t0,$t0,2
    j mul_loop
