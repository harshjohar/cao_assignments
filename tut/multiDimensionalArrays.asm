.data
    mdArray: .word 2, 5
             .word 3, 7
    
    size: .word 2

    .eqv DATA_SIZE 4    # for a constant

.text
    main: 
        la		$a0, mdArray		# 
        lw		$a1, size		# 
        jal		sumDiagonal				# jump to sumDiagonal and save position to $ra

        # $a0, $a1 = parameters of the function
        # $v0 = return value of the function

        # print answer
        move 	$a0, $v0		# $a0 = $v0
        li		$v0, 1		# $v0 = 1
        syscall

        # end the program
        li		$v0, 10		# $v0 = 10
        syscall

    sumDiagonal:
        li		$v0, 0		# $v0 = 0
        li		$t0, 0		# t0 = 0, index
        
        sumLoop:
            mul		$t1, $t0, $a1			# $t0 * $a1 = Hi and Lo registers
                                                                # $t1 = rowIndex * colSize
            add		$t1, $t1, $t0		# $t1 = $t1 + $t0       #                           + colIndex
            mul		$t1, $t1, DATA_SIZE			# $t1 * DATA_SIZE = Hi and Lo registers
                                                                # * DATA_SIZE

            add		$t1, $t1, $a0		# 1 = $t1 + $a0
                                                                # + baseAddr
            lw		$t2, ($t1)		# 
            add		$v0, $v0, $t2		# $v0 = $v0 + $t2
            
            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            blt		$t0, $a1, sumLoop	# if $t0 < $a1 then sumLoop
    jr		$ra					# jump to $ra
    
            
            
