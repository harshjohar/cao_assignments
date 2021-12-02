.data
    message: .asciiz "How many Fibonacci numbers do you want?\n"
.text
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    