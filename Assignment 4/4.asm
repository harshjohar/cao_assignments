.data
    first: .asciiz "Enter the First Number: "
    second: .asciiz "Enter the Second Number: "
    newfirst: .asciiz "First Number: "
    newSecond: .asciiz "\nSecond Number: "
.text
    li $v0, 4
    la $a0, first
    syscall

    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    li $v0, 4
    la $a0, second
    syscall

    li $v0, 5
    syscall
    move 	$t1, $v0		# $t1 = $v0

    add		$t2, $zero, $t0		# $t2 = $zero + $t1
    move 	$t0, $t1		# $t0 = $t1
    move 	$t1, $t2		# $t1 = $t2

    li $v0, 4
    la $a0, newfirst
    syscall

    li $v0, 1
    add $a0, $zero, $t0
    syscall

    li $v0, 4
    la $a0, newSecond
    syscall

    li $v0, 1
    add $a0, $zero, $t1
    syscall

    li $v0, 10
    syscall