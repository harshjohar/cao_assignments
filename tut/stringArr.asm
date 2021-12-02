# $s0=count, $s1=total, $s3=data $s7=index

	.data

Mssg1:		.asciiz "Hello\n"

Line1:		.asciiz "aab\n"
Line2:		.asciiz "ggdhj\n"
Line3:		.asciiz "uio\n"

array:		.word Line1, Line2, Line3

	.globl main
	.text

main:
	li $s1, 0 		# total=0
	li $s0, 3		# count=3
	lw $s3, 0($s7)      # data=sum[index]

	li $v0, 4 		# print_str "Hello"
	la $a0, Mssg1		
	syscall

l1:
	lw $s3, 0($s7)		# data=sum[index]
	add $s1, $s1, $s3	# total=total+data
	
	addi $s7, $s7, 4	# i=i+1 increment
	
	addi $s0, $s0, -1	# decrement

	bne $s0, $0, l1 	# if smaller than 3 go back onto the loop 
	

	add $t0, $0, $s0	# t0=s0

	li $v0, 4
	move $a0, $t0
	lw $a0, array		# print_str 
	syscall
