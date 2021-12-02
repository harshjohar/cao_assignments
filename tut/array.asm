.data
    myArray: .space 12
    newLine: .asciiz "\n"
.text
    addi	$s0, $zero, 4			# $s0 = $zero + 4
    addi	$s1, $zero, 10			# $s1 = $zero + 10
    addi	$s2, $zero, 12			# $s2 = $zero + 12
    
    #index = $t0
    addi	$t0, $zero, 0			# $t0 = $zero + 0
    
    # store the values in memory
    sw		$s0, myArray($t0)		# 
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    sw		$s1, myArray($t0)		# 
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    sw		$s2, myArray($t0)		# 
    
    # retrieve the values from memory
    addi	$t3, $zero, 4
    lw		$t2, myArray($t3)		# 
    
    li		$v0, 1		# $a0 = 1
    addi	$a0, $t2, 0			# $a0 = $t2 + 0
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, newLine		# 
    syscall


    # while loop in array
    addi	$t0, $zero, 0			# $t0 = $zero + 0
    
    while:
        beq		$t0, 12, exit	# if $t0 == 12 then exit
        
        lw		$t2, myArray($t0)		# 
        
        # print current number
        li		$v0, 1		# $v0 = 1
        addi	$a0, $t2, 0			# $a0 = $t2 + 0
        syscall

        # print a new line
        li		$v0, 4		# $v0 = 4
        la		$a0, newLine		# 
        syscall

        # increment the index
        addi	$t0, $t0, 4			# $t0 = $t0 + 4
        
        j while
    exit:
        li		$v0, 10		# $v0 = 10
        syscall