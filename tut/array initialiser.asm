.data
    myArray: .word 100:3    # array of size 3, value 100
    newLine: .asciiz "\n"
.text

    # modify the array
    addi	$t2, $zero, 69			# $t2 = $zero + 69
    addi	$t3, $zero, 8			# $t3 = $zero + 2
    
    sw		$t2, myArray($t3)		# 
    
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
