.data
    message: .asciiz "Enter the number: "
    result: .asciiz "Fibonacci term is: "

.text
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    move 	$a0, $t0		# $a0 = $t0
    move 	$v0, $t0		# $v0 = $t0
    jal		fibonacci				# jump to fibonacci and save position to $ra
    move 	$t1, $v0		# $t1 = $v0

    li $v0, 4
    la $a0, result
    syscall

    add $a0, $zero, $t1
    li $v0, 1
    syscall

    li $v0, 10
    syscall

    fibonacci:
        bgt		$a0, 1, fib_rec	# if $a0 > 1 then fib_rec
        move 	$v0, $a0		# $v0 = $a0
        jr		$ra			# jump to $ra
        
    fib_rec:
        sub		$sp, $sp, 12		# $sp = $sp - 12
        sw		$ra, 0($sp)		# 

        sw $a0, 4($sp)
        add		$a0, $a0, -1		# $a0 = $a0 + -1
        jal fibonacci

        lw $a0, 4($sp)
        sw		$v0, 8($sp)		# 
        
        add		$a0, $a0, -2		# $a0 = $a0 + -2
        jal		fibonacci				# jump to fibonacci and save position to $ra
        
        lw		$t0, 8($sp)		# 
        add		$v0, $t0, $v0		# $v0 = $t0 + $v0
        
        lw		$ra, 0($sp)		# 
        add		$sp, $sp, 12		# $sp = $sp + 12
        jr		$ra					# jump to $ra
