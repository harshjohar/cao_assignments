.data  
myarr: .byte 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
vowels: .byte 'a','e','i','o','u' 
space: .asciiz " "   
.text  
    addi $t0, $t0, 0   
    addi $t1, $t1, 0  
    addi $t8, $zero, 1  
    la $t3, myarr  
    la $t4, vowels
    addi $t5, $zero, 5
    while: 
        beq $t1, $t5, exit  
        lb $t6, ($t4)  
        lb $t7, ($t3)    
        beq $t6, $t7, print  
        addi $t3, $t3, 1    
        j while    
    print:     
        addi $t9, $t9, 1   
        lb $a0, ($t4)
        li $v0, 11 
        syscall 
        li $v0, 4  
        la $a0, space  
        syscall  
        addi $t1, $t1, 1  
        addi $t4, $t4, 1 
        beq $t4, $t5, exit 
        j while 
    exit:  
        li $v0, 10  
        syscall