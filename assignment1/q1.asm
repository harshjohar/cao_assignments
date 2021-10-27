.data
	name: .asciiz "Harshpreet Singh Johar\n"
	department: .asciiz "CSE\n"
	rollNumber: .asciiz "20103076\n"
.text
	li $v0, 4
	la $a0, name
	syscall
	la $a0, department
	syscall
	la $a0, rollNumber
	syscall
	
	li $v0, 10
	syscall
