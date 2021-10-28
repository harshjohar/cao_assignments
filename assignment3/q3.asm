.data
    first: .asciiz "Enter first number: "
    second: .asciiz "Enter second number: "
    message: .asciiz "The prime numbers within given range are: \n"
    space: .asciiz " "
.text
    li $v0, 4
    la $a0, first
    syscall

    li $v0, 5
    syscall
    move $t0, $v0


    li $v0, 4
    la $a0, second
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    while:
        beq		$t0, $t1, exit	# if $t0 == $t1 then exit
        addi $t2, $zero, 2 # counter
        j checker

    checker:
        mul $t3, $t2, $t2       
        bgt		$t3, $t0, prime	# if $t3 > $t0 then prime
        div		$t0, $t2			# $t0 / $t2
        mfhi	$t4					# $t4 = $t0 mod $t2 
        beq		$t4, 0, notprime	# if $t4 == 0 then notprime
        addi	$t2, $t2, 1			# $t2 = $t2 + 1
        j checker
        
    notprime:
        addi $t0, $t0, 1
        j while

    prime:
        li $v0, 1
        add $a0, $zero, $t0
        syscall
        
        li $v0, 4
        la $a0, space
        syscall

        addi $t0, $t0, 1
        j while

    exit: 
        li $v0, 10
        syscall
