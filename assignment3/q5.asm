.data
    idarray: .space 400
    array: .space 80
    size: .word 20
    string: .space 20000
    NumberOfEmployees: .asciiz "Enter the array length: \n"
    prompt1: .asciiz "Enter the Employee Name: "
    prompt2: .asciiz "Enter the Employee ID: "
    text: .asciiz "The array of string is:"
    newline: .asciiz "\n"
.text
    main:
    li $v0,4
    la $a0,NumberOfEmployees
    syscall
    li $v0,5
    syscall
    addi $s0,$v0,0
    add $t0,$zero,$zero
    addi $t1,$zero,1
    la $s2,string
    read_string:
    bgt $t1,$s0,done
    li $v0,4
    la $a0,prompt2
    syscall
    li $v0, 5
    syscall
    sw $v0, idarray($t0)
    li $v0, 4
    la $a0,prompt1
    syscall
    move $a0,$s2
    li $a1,20
    li $v0,8
    syscall
    sw $a0,array($t0)
    addi $t0,$t0,4
    addi $t1,$t1,1
    addi $s2,$s2,20
    j read_string
    done:
    li $v0,10
    syscall