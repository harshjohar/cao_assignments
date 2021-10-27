.data
	msg1: .asciiz "Enter first number: "
	msg2: .asciiz "Enter second number:  "
	msg3: .asciiz "Division of the two numbers is: "
.text
	# prompt user to enter first number
	li $v0, 4
	la $a0, msg1
	syscall
	
	# get the first number
	li $v0, 5
	syscall
	
	# store the result in $t0
	move $t0, $v0
	
	# prompt for second number
	li $v0, 4
	la $a0, msg2
	syscall
	
	# get the second number
	li $v0, 5
	syscall
	
	# store the result in $t1
	move $t1, $v0
	
	# divide the two numbers
	div $t2, $t0, $t1
	
	# print result message
	li $v0, 4
	la $a0, msg3
	syscall
	
	# print answer
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	li $v0, 10
	syscall