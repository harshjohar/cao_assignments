.data
spacing: .asciiz " "
prompt: .asciiz "Enter a number greater than 1: \n"
.text
li $v0, 4
la $a0, prompt
syscall
li $v0, 5
syscall
move $t1, $v0
addi $t0, $t0, 0
li $v0, 1
move $a0, $t0
syscall
addi $t2, $t2, 0
addi $t3, $t3, 1
addi $t0, $t0, 1
li $v0, 4
la $a0, spacing
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, spacing
syscall
sub $t1, $t1, 1
loop:
bgt $t0, $t1, exit
add $t4, $t2, $t3
li $v0, 1
move $a0, $t4
syscall
li $v0, 4
la $a0, spacing
syscall
addi $t2, $t3, 0
addi $t3,$t4,0
add $t0, $t0, 1
j loop
exit:
li $v0, 10
syscall
