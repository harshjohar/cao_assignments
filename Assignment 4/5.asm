.data
myarray: .space 20
prompt: .asciiz "Enter the marks for 5 subjects(enter every number in new line): \n"
Ap: .asciiz "A+"
A: .asciiz "A"
Bp: .asciiz "B+"
B: .asciiz "B"
C: .asciiz "C"
D: .asciiz "D"
grade: .asciiz "grade: "
marks: .asciiz "marks: "
newline : .asciiz "\n"
.text
li $v0,4
la $a0,prompt
syscall
addi $t0, $zero,0
fun:
beq $t0,20,grades
li $v0,5
syscall
move $t1, $v0
add $s1,$s1, $t1
sw $v0,myarray($t0)
add $t0,$t0,4
j fun
grades:
div $s1, $s1, 5
li $v0,4
la $a0,marks
syscall
li $v0, 1
move $a0, $s1
syscall
li $v0,4
la $a0,newline
syscall
bgt $s1,89, AP
bgt $s1,79, a
bgt $s1,69, BP
bgt $s1,59, be
bgt $s1,49, c
bgt $s1,39, d
AP:
li $v0,4
la $a0,grade
syscall
li $v0,4
la $a0,Ap
syscall
li $v0,10
syscall
a:
li $v0,4
la $a0,grade
syscall
li $v0,4
la $a0,A
syscall
li $v0,10
syscall
BP:
li $v0,4
la $a0,grade
syscall
li $v0,4
la $a0,Bp
syscall
li $v0,10
syscall
be:
li $v0,4
la $a0,grade
syscall
li $v0,4
la $a0,B
syscall
li $v0,10
syscall
c:
li $v0,4
la $a0,grade
syscall
li $v0,4
la $a0,C
syscall
li $v0,10
syscall
d:
li $v0,4
la $a0,grade
syscall
li $v0,4
la $a0,D
syscall
li $v0,10
syscall