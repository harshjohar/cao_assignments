.data
    message: .asciiz "Enter the number: "
    prime: .asciiz "The number is prime"
    notPrime: .asciiz "The number is not prime"
.text
    li $v0, 4
    la $a0, message
    syscall


    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    beq		$t0, 1, notPrime	# if $t0 == 1 then notPrime

    addi $t1, $zero, 2 # counter

    while:
        mul $t2, $t1, $t1
        bgt		$t2, $t0, primeOutput	# if $t2 > $t0 then exit
        div		$t0, $t1			# $t0 / $t1
        mfhi	$t3					# $t3 = $t0 mod $t1 
        beq		$t3, 0, notPrimeOutput	# if $t3 == 0 then notPrime
        addi $t1, $t1, 1
        j while

    notPrimeOutput:
        li $v0, 4
        la $a0, notPrime
        syscall

        li $v0, 10
        syscall

    primeOutput:
        li $v0, 4
        la $a0, prime
        syscall

        li $v0, 10
        syscall