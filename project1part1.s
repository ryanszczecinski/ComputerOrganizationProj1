.globl main
.globl trimString
.globl done
.globl trimLoop
.globl skip
.globl write
.globl fillnull
.data
first:  .space 8 #allocate 8 bytes of data for int1
second: .space 8 #address 0x10000008
third:  .space 8 #address 0x10000010
fourth: .space 8 #address 0x10000018
fifth: .space 9 #address 0x10000020
prompt: .asciiz "Enter 5 decimal numbers:\n" #14 char 15 with null starts at address 0x10000028
.text
main:
lui     $a0, 0x1000
addi    $a0, 0x0029 #a0 is the address of the prompt
addi    $v0, $0, 4
syscall     #the prompt will be printed

#input part
lui     $a0, 0x1000 #loads the address of the input string to be stored
addi    $a1, $0, 9 # sets number of charaters to be read + 1  
addi    $v0, $0, 8 #sets v0 to read string mode
syscall  #reads the input stores it into data
jal trimString 
addi $0,$0,0 #nop 

addi    $v0, $0, 8 #sets v0 to read string mode
syscall  #reads the input stores it into data
jal trimString 
addi $0,$0,0 #nop 

 
addi    $v0, $0, 8 #sets v0 to read string mode
syscall  #reads the input stores it into data
jal trimString 
addi $0,$0,0 #nop 


addi    $v0, $0, 8 #sets v0 to read string mode
syscall  #reads the input stores it into data
jal trimString 
addi $0,$0,0 #nop 

addi    $a1, $0, 9 # sets number of charaters to be read + 1  
addi    $v0, $0, 8 #sets v0 to read string mode
syscall  #reads the input stores it into data
jal trimString 
addi $0,$0,0 #nop 


addi $v0, $0,10
syscall

#################################################################################################
#a0 will already be the string just input
#store the value at reg a0, then increment a0 by one
#skip for comma, +, null for anything else
#store at the read pointer, store at store pointer
#################################################################################################
trimString: #this subroutine will trim the string in the input

addi $t1, $0, 0 #loop counter init
addi $t2, $0, 0 #value used for bne set by slti
addi $t3, $0, 45 #value of negative
lb   $t0, 0($a0) #a0 is the read index
addi  $t4, $a0, 0 #t4 is the write index   
#loops though the input string
trimLoop:addi $t1,$t1,1
lb      $t0, 0($a0) #loads byte
beq     $t0, $0, write #will write null chars
beq     $t0, $t3, write #write the negative sign
slti    $t2, $t0, 48
bne     $t2,$0, skip # if char is less than 58 skip
#slti    $t2, $t0, 58
#beq     $t2,$0, skip  #if char is not less than 58 skip  

write: #write the char to memory, can write null
sb $t0, ($t4)
addi $t4, $t4, 1 #increment to the next write address

skip: #not a valid input or skipped char, move onto loop logic
addi $a0, $a0, 1 #increment to the next read address
slt $t2, $t1, 8
bne $t2,$0, trimLoop
addi $0, $0,0

beq $t4,$a0,back
addi $0,$0,0
fillnull: #fills null chars until end of byte
sb      $0, ($t4)
addi    $t4,$t4,1
bne     $t4,$a0, fillnull   
addi $0,$0,0
back: jr $ra
addi $0,$0, 0