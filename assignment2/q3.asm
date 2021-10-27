.data
    msg: .asciiz "The sum of first n natural numbers is: "
    prompt: .asciiz "Enter n: "
.text
    addi $t0, $zero, 0  # this will be my answer
    addi $t1, $zero, 0  # counter
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    while:
        bgt		$t1, $t2, exit	# if $t1 > $t2 then exit
        add $t0, $t0, $t1
        addi $t1, $t1, 1
        j		while				# jump to while
    exit:
        li $v0, 4
        la $a0, msg
        syscall
        li $v0, 1
        add $a0, $zero, $t0
        syscall
        li $v0, 10
        syscall