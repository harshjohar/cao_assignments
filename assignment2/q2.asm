.data
    space: .asciiz " "
.text
    addi $t0, $zero, 0

    while:
        bgt	$t0, 10, exit	# if $t0 > 10 then exit
        
        li $v0, 1
        add $a0, $zero, $t0
        syscall
        li $v0, 4
        la $a0, space
        syscall

        addi $t0, $t0, 1
        j while				# jump to while
    exit:
        li $v0, 10
        syscall