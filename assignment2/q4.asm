.data
    num: .word 0
    msg: .asciiz "Enter the number: "
    success: .asciiz "Palindrome\n"
    failure: .asciiz "Not Palindrome\n"

.text
    main: 
        li $v0, 4
        la $a0, msg
        syscall

        li $v0, 5
        syscall

        move $t0, $v0
        move $t3, $t0
        li $t2, 0
    
    loop:
        mul $t2, $t2, 10
        rem $t1, $t0, 10
        div $t0, $t0, 10
        add $t2, $t2, $t1
        bne		$t0, $zero, loop	# if $t0 != $zero then loop
        bne		$t3, $t2, exit	# if $t3 != $t2 then failure

        # if the program reached upto here, then it is a palindrome
        li $v0, 4
        la $a0, success
        syscall

        li $v0, 10
        syscall

    exit:
        li $v0, 4
        la $a0, failure
        syscall

        li $v0, 10
        syscall