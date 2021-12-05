.data
	endText: .asciiz "Array after summation:\n"
	  
    arrayA: .word 1, 2, 3 
            .word 4, 5, 6 
            .word 7, 8, 9
              
    arrayB: .word 1, 2, 3 
            .word 4, 5, 6 
            .word 7, 8, 9     

    arrayC:    .space 10     
    newLine:   .asciiz "\n"
    tab:       .asciiz "\t"
.text
    main:   
        la $t1, arrayA     
        la $t2, arrayB     
        la $t3, arrayC     

        li $t4, 0       
        li $s1, 9
        li $s0, 0 # Keep track of newLine
        li $s2, 0 # Keep track of tab       

        li $v0, 4      
        la $a0, endText  
        syscall         

        j loop          

    loop:
        beq $t4, $s1, final  
        lw $t5, 0($t1)      
        lw $t6, 0($t2)      

        add $t7, $t5, $t6   

        sw $t7, 0($t3)    # Store sum in new array  

        li $v0, 1       
        move $a0, $t7    
        syscall   
        
        li $v0, 4
        la $a0, tab
        syscall
        
        jal breakLine              

        addi $t1, $t1, 4    
        addi $t2, $t2, 4    
        addi $t4, $t4, 1    

        j loop         
	
	breakLine:
		beq $s0, 2, printNewLine
		addi $s0, $s0, 1
		addi $s2, $s2, 1
		jr $ra
			
	printNewLine:
		move $s0, $zero
		li $s2, 2
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra

	
    final:
        li $v0, 10
        syscall      
