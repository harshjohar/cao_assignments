.data
    message: .asciiz "Welcome to my calculator\n"
    prompt: .asciiz "press 1,2,3,4 for addition, subtraction, multiplication, division `respectively`\n"
    first: .asciiz "enter first number: "
    second: .asciiz "enter second language: "
.text
    main:
        li $v0, 4
        la $a0, message
        syscall

        la $a0, prompt
        syscall

        # input the operation
        li $v0, 5
        syscall

        move 	$t0, $v0		# $t0 = $v0

        # first num
        li $v0, 4
        la $a0, first
        syscall

        # input the first number
        li $v0, 5
        syscall

        move 	$t1, $v0		# $t1 = $v0

        # second num
        li $v0, 4
        la $a0, second
        syscall

        # input the second number
        li $v0, 5
        syscall

        move 	$t2, $v0		# $t2 = $v0

        # calculate
        beq		$t0, 1, addition	# if $t0 == 1 then add
        beq		$t0, 2, subtraction	# if $t0 == 2 then sub
        beq		$t0, 3, multiplication	# if $t0 == 3 then mul
        beq		$t0, 4, division	# if $t0 == 4 then div
    
    addition:
        add $t3, $t1, $t2
        add $a0, $zero, $t3
        li $v0, 1
        syscall
        li $v0, 10
        syscall

    subtraction:
        sub $t3, $t1, $t2
        add $a0, $zero, $t3
        li $v0, 1
        syscall
        li $v0, 10
        syscall

    multiplication: 
        mul $t3, $t1, $t2
        add $a0, $zero, $t3
        li $v0, 1
        syscall
        li $v0, 10
        syscall

    division:
        div $t3, $t1, $t2
        add $a0, $zero, $t3
        li $v0, 1
        syscall
        li $v0, 10
        syscall