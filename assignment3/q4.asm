.data
    message: .asciiz "Enter n: "
    star: .asciiz "*"
.text   
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 5
    syscall

    move 	$t0, $v0		# $t0 = $v0

    addi $t1, $zero, 1

    while:
        bgt		$t1, $t0, exit	# if $t1 > $t0 then exit
        li $v0, 4
        la $a0, star
        syscall

        addi $t1, $t1, 1
        j while

    exit:
        li $v0, 10
        syscall
