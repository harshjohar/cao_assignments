.data
    message: .asciiz "The required sum is: "
    nextLine: .asciiz "\n"
.text
    li $v0, 4
    la $a0, message
    syscall

    addi $t0, $zero, 0  # final ans

    addi $t1, $zero, 0  # counter

    addi $t4, $zero, 3

    while:
        bgt		$t1, 60, exit	# if $t1 > 60 then exit
        ble		$t1, 20, first	# if $t1 <= 20 then first
        subi	$t1, $t1, 1			# $t1 = $t1 - 1
        blt		$t1, 40, second	# if $t1 < 40 then second
        addi	$t1, $t1, 2			# $t1 = $t1 + 2
        j       third
        
    first:
        bgt		$t1, 20, while	# if $t1 > 20 then second
        add		$t0, $t0, $t1		# $t2 = $t0 + $t1
        addi	$t1, $t1, 2			# $t1 = $t1 + 2
        j first

    second:
        bgt		$t1, 40, while	# if $t1 > 40 then while
        add		$t0, $t0, $t1		# $t2 = $t0 + $t1
        addi	$t1, $t1, 2			# $t1 = $t1 + 2
        j       second
    
    third:
        bgt		$t1, 60, while	# if $t1 > 60 then while
        mult	$t1, $t4			# $t4 * $t1 = Hi and Lo registers
        mflo	$t2					# copy Lo to $t2
        add		$t0, $t0, $t2		# $t0 = $t1 + $t2
        addi	$t1, $t1, 2			# $t1 = $t1 + 2
        j		third				# jump to third

    exit:
        li $v0, 1
        add $a0, $zero, $t0
        syscall
        li $v0, 10
        syscall
        