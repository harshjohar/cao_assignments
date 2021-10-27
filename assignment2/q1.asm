.data
	namePrompt : .asciiz "Enter the name of employee: "
	salaryPrompt: .asciiz "Enter the salary of employee: "
	name: .asciiz "Name: "
	salary : .asciiz "Salary: "
	userInput: .space 20
.text
	# prompting for name
	li $v0, 4
	la $a0, namePrompt
	syscall

	# getting text from the user
	li $v0, 8
	la $a0, userInput
	li $a1, 20
	syscall

	# prompting for salary
	li $v0, 4
	la $a0, salaryPrompt
	syscall

	# getting input of the salary
	li $v0, 5
	syscall

	move $t0, $v0

	# Printing the output
	li $v0, 4
	la $a0, name
	syscall
	la $a0, userInput
	syscall
	la $a0, salary
	syscall
	li $v0, 1
	add $a0, $zero, $t0
	syscall

	li $v0, 10
	syscall