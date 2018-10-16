.globl main
.globl average
.globl lenString
.globl convertToInt
.globl intBuilt
.data
first:   .asciiz "346"
firstSpace:  .space 4
second: .asciiz "-209" 
secondSpace: .space 3
third:  .asciiz "1600"
thirdSpace: .space 3
fourth: .asciiz "100"
fouthSpace: .space 4
fifth:  .asciiz "0"
fifthSpace: .space 5
done: .space 50
.text
main: 
#setup
lui $a0, 0x1000


#end setup


average:
###
#Overview:
#load strings into registers
#convert to int using subroutine
#sort the int registers s0->s4
#stoi and itoa are subroutines at the bottom
###
addi $sp, $sp, -4
sw   $ra, 0($sp)
addi $sp, $sp, -4
sw   $s0, 0($sp)
addi $sp, $sp, -4
sw   $s1, 0($sp)
addi $sp, $sp, -4
sw   $s2, 0($sp)
addi $sp, $sp, -4
sw   $s3, 0($sp)
addi $sp, $sp, -4
sw   $s4, 0($sp) 
addi $sp, $sp, -4
sw   $s5, 0($sp)
addi $sp, $sp, -4
sw   $s6, 0($sp)
addi $sp, $sp, -4
sw   $s7, 0($sp)  #gimmie them registers
########################################################################
#load in first number
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $t1, $a0,0 
lenString:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString #will branch if it is the end of the string
addi $0, $0, 0 

##stored: t9->length of string
addi $t8, $0, 0x2d
#load the entire  first string into0-5 max 5 digits and optional negative sign
#this a way to order my register loads to make my convert easier
#if its not negative load as normal, if it is shift one over
#t8 becomes negative or postive bit flag
# 0 for positive, 1 for negative
lb $t0, 0($a0)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative
addi $0, $0, 0 
lb $t1, 1($a0)
lb $t2, 2($a0)
lb $t3, 3($a0)
lb $t4, 4($a0)
addi $t8, $0, 0
j loaded
addi $0, $0, 0
negative:
lb $t0, 1($a0)
lb $t1, 2($a0)
lb $t2, 3($a0)
lb $t3, 4($a0)
lb $t4, 5($a0) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded:

#t9,8, 0-4 are important, dont overwrite
jal convertToInt
addi $0, $0, 0 
addi $s0, $s4,0
#first number has been loaded and stored in s0
#######################################################################

########################################################################
#load in second number
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $a0, $a0, 0x8
addi $t1, $a0,0 
lenString2:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString2 #will branch if it is the end of the string
addi $0, $0, 0 
addi $t8, $0, 0x2d
lb $t0, 0($a0)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative2
addi $0, $0, 0 
lb $t1, 1($a0)
lb $t2, 2($a0)
lb $t3, 3($a0)
lb $t4, 4($a0)
addi $t8, $0, 0
j loaded2
addi $0, $0, 0
negative2:
lb $t0, 1($a0)
lb $t1, 2($a0)
lb $t2, 3($a0)
lb $t3, 4($a0)
lb $t4, 5($a0) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded2:
jal convertToInt
addi $0, $0, 0 
addi $s1, $s4,0
#######################################################################

########################################################################
#load in third number
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $a0, $a0, 0x8
addi $t1, $a0,0 
lenString3:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString3 #will branch if it is the end of the string
addi $0, $0, 0 
addi $t8, $0, 0x2d
lb $t0, 0($a0)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative3
addi $0, $0, 0 
lb $t1, 1($a0)
lb $t2, 2($a0)
lb $t3, 3($a0)
lb $t4, 4($a0)
addi $t8, $0, 0
j loaded3
addi $0, $0, 0
negative3:
lb $t0, 1($a0)
lb $t1, 2($a0)
lb $t2, 3($a0)
lb $t3, 4($a0)
lb $t4, 5($a0) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded3:
jal convertToInt
addi $0, $0, 0 
addi $s2, $s4,0
#######################################################################

########################################################################
#load in fourth number
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $a0, $a0, 0x8
addi $t1, $a0,0 
lenString4:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString4 #will branch if it is the end of the string
addi $0, $0, 0 
addi $t8, $0, 0x2d
lb $t0, 0($a0)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative4
addi $0, $0, 0 
lb $t1, 1($a0)
lb $t2, 2($a0)
lb $t3, 3($a0)
lb $t4, 4($a0)
addi $t8, $0, 0
j loaded4
addi $0, $0, 0
negative4:
lb $t0, 1($a0)
lb $t1, 2($a0)
lb $t2, 3($a0)
lb $t3, 4($a0)
lb $t4, 5($a0) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded4:
jal convertToInt
addi $0, $0, 0 
addi $s3, $s4,0
#######################################################################

########################################################################
#load in fifth number
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $a0, $a0, 0x8
addi $t1, $a0,0 
lenString5:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString5 #will branch if it is the end of the string
addi $0, $0, 0 
addi $t8, $0, 0x2d
lb $t0, 0($a0)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative5
addi $0, $0, 0 
lb $t1, 1($a0)
lb $t2, 2($a0)
lb $t3, 3($a0)
lb $t4, 4($a0)
addi $t8, $0, 0
j loaded5
addi $0, $0, 0
negative5:
lb $t0, 1($a0)
lb $t1, 2($a0)
lb $t2, 3($a0)
lb $t3, 4($a0)
lb $t4, 5($a0) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded5:
jal convertToInt
addi $0, $0, 0 
#result is already in s4
#######################################################################

###########################################################################
#this is the sorting part
#first lets clear existing memory
lui $a0, 0x1000
addi $t1, $0, 0
clear:
sb $0, ($a0)
addi $a0, $a0, 1
addi $t1, $t1 , 1
slti $t4, $t1, 32
bne $t4,$0, clear 
addi $0, $0,0 
addi $t1, $0, 0
#can use $t4-0, $s5-7, not used in the itoa
lui $a3, 0x1000 #argument register of write pointer in itoa
addi $t3, $0, 0 
addi $a3, $a3, -0x8
#v0 is used for the least
sortLoop:

addi $t3, $t3, 1
addi $v0, $s0, 0
addi $a3, $a3, 0x8
addi $t2, $0, 0

slt $t4, $v0, $s1
bne $t4, $0, v0Smaller
addi $0, $0, 0
addi $v0, $s1, 0 
addi $t2, $0, 1

v0Smaller:
slt $t4, $v0, $s2
bne $t4, $0, v0Smaller2
addi $0, $0, 0
addi $v0, $s2, 0
addi $t2, $0, 2

v0Smaller2:
slt $t4, $v0, $s3
bne $t4, $0, v0Smaller3
addi $0, $0, 0
addi $v0, $s3, 0
addi $t2, $0, 3 

v0Smaller3:
slt $t4, $v0, $s4
bne $t4, $0, v0Smaller4
addi $0, $0, 0
addi $v0, $s4, 0
addi $t2, $0, 4

v0Smaller4:
jal convertToAscii
addi $0, $0 ,0

#adjust the value so its no longer considered, 100k is greater than anything in the input
#kinda like a switch case function
addi $t1, $0, 0
bne $t2, $t1, notS0
addi $0, $0 ,0
addi $s0, $0, 30000
addi $s0, $s0, 30000
addi $s0, $s0, 30000
addi $s0, $s0, 30000
j sortAdjDone
addi $0, $0 ,0

notS0: addi $t1, $0, 1
bne $t2, $t1, notS1
addi $0, $0 ,0
addi $s1, $0, 30000
addi $s1, $s1, 30000
addi $s1, $s1, 30000
addi $s1, $s1, 30000
j sortAdjDone
addi $0, $0 ,0

notS1: addi $t1, $0, 2
bne $t2, $t1, notS2
addi $0, $0 ,0
addi $s2, $0, 30000
addi $s2, $s2, 30000
addi $s2, $s2, 30000
addi $s2, $s2, 30000
j sortAdjDone
addi $0, $0 ,0

notS2: addi $t1, $0, 3
bne $t2, $t1, notS3
addi $0, $0 ,0
addi $s3, $0, 30000
addi $s3, $s3, 30000
addi $s3, $s3, 30000
addi $s3, $s3, 30000
j sortAdjDone
addi $0, $0 ,0

notS3: addi $s4, $0, 30000
addi $s4, $s4, 30000
addi $s4, $s4, 30000
addi $s4, $s4, 30000



sortAdjDone:
slti $t4, $t3, 5
bne $t4, $0 , sortLoop
addi $0, $0 ,0
addi $0, $0 ,0

###########################################################################

############## restore s registers
lw $s7, 0($sp)#####################
addi $sp, $sp, 4
lw $s6, 0($sp)
addi $sp, $sp, 4
lw $s5, 0($sp)
addi $sp, $sp, 4
lw $s4, 0($sp)
addi $sp, $sp, 4
lw $s3, 0($sp)
addi $sp, $sp, 4
lw $s2, 0($sp)
addi $sp, $sp, 4
lw $s1, 0($sp)
addi $sp, $sp, 4
lw $s0, 0($sp)
addi $sp, $sp, 4
lw $ra, 0($sp) 
addi $sp,$sp, 4 #one takeith one must givith back
jr $ra
addi $0, $0, 0
#DONNNENEEEE





######################################################################
#v0 to ascii written in a3
convertToAscii: 
addi $t9, $a3, 0 #t9 will be the write pointer
bne $v0, $0, notZero2
addi $t8, $0, 0x30
sb $t8, 0($t9)
j popDone

notZero2:
slt $t1, $0, $v0
add $t8, $0, $v0 #t8 is now the value of v0

bne $0, $t1, dontflip
addi $0, $0, 0
addi $t1, $0, 0x2d
sb $t1, 0($t9) # if negative store the negative value
addi $t9, $t9, 1 #move the write pointer
nor $t8, $t8, $t8 #flip bits 
addi $t8, $t8, 1 #add one, boom we have a posivive number
dontflip:

addi $t7, $0, 0 #t7 will be count for how many digits there are


#loop inside the loop, push to stack the remainder and store length
#swap the remainder register and quotient and loop again
#to this until the quotient is less than 10
#after pop from stack an in order string and store that

iToa:
slti $t6, $t8, 10
bne $t6, $0, iToaDone
addi $0, $0, 0
addi $t5, $0, 0
addi $t7, $t7, 1 #increase the number of times we need to pop

iToaInnerLoop:
slti $t6, $t8, 10 #is the value less than 10 if so, division is done
bne $t6, $0, iToaInnerLoopDone
addi $0, $0, 0
addi $t8, $t8, -10   #subtract 10
addi $t5, $t5, 1    #add 1 to result
j iToaInnerLoop
addi $0, $0, 0

iToaInnerLoopDone:
addi $t8, $t8, 0x30
addi $sp, $sp, -1
sb $t8, 0($sp)
addi $0, $0, 0
addi $t8, $t5, 0
j iToa
addi $0, $0, 0

iToaDone:
addi $t8, $t8, 0x30
sb $t8, 0($t9)
addi $t9, $t9 ,1

#loop and pop bytes off of stack 

addi $t0, $0, 0 #t0 is the loop counter
pop: 
beq $t0, $t7, popDone
addi $0, $0, 0
lb $t8, 0($sp)
addi $0, $0, 0
addi $0, $0, 0
addi $t0, $t0, 1
addi $sp, $sp, 1
sb $t8, 0($t9)
addi $t9, $t9, 1
j pop
addi $0, $0, 0
sb $0, 0($t9)
popDone:addi $0, $0, 0

jr $ra
addi $0, $0 ,0
#######################################################################

############################################
# convert ascii to int by sub 0x30
# bit shift 3 times add twice ->10x
# add the next digit, repeat step above for length times
# if negative flip bits, add one store in lets say s4
#############################################
#t9,8, 0-4 are important, dont overwrite
convertToInt:
addi $t5, $0, 0 #init t5 ,will be the loop counter....kinda lul 
addi $t0, $t0, -0x30
addi $t1, $t1, -0x30
addi $t2, $t2, -0x30
addi $t3, $t3, -0x30
addi $t4, $t4, -0x30

addi $t5, $t5, 1    
addi $t6, $t0, 0    #t6 is running total
beq $t5, $t9, intBuilt
addi $0, $0, 0 
sll $t6,$t6,3 #8x
add  $t6, $t6, $t0
add  $t6, $t6, $t0 #10x
 

addi $t5, $t5, 1
add $t6, $t6, $t1
beq $t5, $t9, intBuilt
addi $0, $0, 0 
addi $t7, $t6,0
sll $t6,$t6,3 #8x
add  $t6, $t6, $t7
add  $t6, $t6, $t7 #10x


addi $t5, $t5, 1
add $t6, $t6, $t2
beq $t5, $t9, intBuilt
addi $0, $0, 0 
addi $t7, $t6,0
sll $t6,$t6,3 #8x
add  $t6, $t6, $t7
add  $t6, $t6, $t7 #10x


addi $t5, $t5, 1
add $t6, $t6, $t3
beq $t5, $t9, intBuilt
addi $0, $0, 0 
addi $t7, $t6,0
sll $t6,$t6,3 #8x
add  $t6, $t6, $t7
add  $t6, $t6, $t7 #10x


add $t6, $t6, $t4
addi $t7, $t6,0
# beq $t5, $t9, intBuilt
# addi $0, $0, 0 
# sll $t6,$t6,3 #8x
# add  $t6, $t6, $t7
# add  $t6, $t6, $t7 #10x
intBuilt: 
beq $t8, $0 positive #here we convert a positive number to its 2's compliment
addi $0, $0, 0  
nor $t6, $t6, $t6 #no not function, what the fuck..use nor to get not, i guess
addi $t6, $t6, 1 # yay 2's god damn compliment negative number
positive:
addi $s4, $t6, 0 #store final result in s4 because extra registers mutha fuckkaa 


jr $ra
addi $0, $0, 0