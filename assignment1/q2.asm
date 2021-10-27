.data
	msg1: .asciiz "Enter First number: "
	msg2: .asciiz "Enter Second number:  "
	msg3: .asciiz "Sum of the two numbers is: "
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
	
	# Store the input in $t1
	move $t1, $v0
	
	# Add the two numbers
	add $t2, $t1, $t0
	
	# Print result message
	li $v0, 4
	la $a0, msg3
	syscall
	
	# Print answer
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	li $v0, 10
	syscall
	 
