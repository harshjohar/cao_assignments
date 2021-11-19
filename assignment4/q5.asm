.data
    note: .asciiz "All subjects have a weightage of 100."
    s1: .asciiz "Enter marks of subject 1: "
    s2: .asciiz "Enter marks of subject 2: "
    s3: .asciiz "Enter marks of subject 3: "
    s4: .asciiz "Enter marks of subject 4: "
    s5: .asciiz "Enter marks of subject 5: "

.text
    li $v0, 4
    la $a0, note
    syscall

    li $v0, 4
    la $a0, s1
    syscall

    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0
    
    li $v0, 4
    la $a0, s2
    syscall
    
    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0
    
    li $v0, 4
    la $a0, s3
    syscall
    
    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0
    
    li $v0, 4
    la $a0, s4
    syscall
    
    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0
    
    li $v0, 4
    la $a0, s5
    syscall
    
    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0