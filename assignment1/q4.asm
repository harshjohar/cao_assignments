.data
	msg1: .asciiz "Enter first number: "
	msg2: .asciiz "Enter second number:  "
	msg3: .asciiz "Largest of the two numbers is: "
.text
	# Prompt user to enter first number
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Input the first number
	li $v0, 5
	syscall
	
	# Store the input in $t0
	move $t0, $v0
	
	# Prompt for second number
	li $v0, 4
	la $a0, msg2
	syscall
	
	# Input the second number
	li $v0, 5
	syscall
	
	# store the input in $t1
	move $t1, $v0
	
	# message for output
	li $v0, 4
	la $a0, msg3
	syscall
	
	# compare trhe numbers
	bgt $t0, $t1, first 
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	li $v0, 10
	syscall
	
	# if the first the greater than second
	first:
		li $v0, 1
		add $a0, $zero, $t0
		syscall
		li $v0, 10
		syscall
