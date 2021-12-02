.data
    hello: .asciiz "Hello, the string is:\n"
    employee_name : 
        .align 3
        .asciiz "person1"
        .align 3 
        .asciiz "person 2"
        .align 3
        .asciiz "person 3"
        .align 3
        .asciiz "person 4"
        .align 3
        .asciiz "person 5"
    
    employee_id : .space 20
.text  
    #print the first member of the names array
    la  $a0,employee_name
    li $v0, 4
    syscall

    #exit
    li $v0, 10
    syscall

    
