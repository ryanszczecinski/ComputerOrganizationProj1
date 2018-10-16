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
third:  .asciiz "-1600"
done: .space 50
.text
main: 
#setup
lui $a0, 0x1000
lui $a1, 0x1000
lui $a2, 0x1000
lui $a3, 0x1000
addi $a3, 0x20
addi $a1,$a1,8
addi $a2,$a2,0x10

#end setup


average:
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
sw   $s4, 0($sp) #gimmie them registers
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
#loading in the second int
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $t1, $a1,0
lenString1:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString1 #will branch if it is the end of the string
addi $0, $0, 0 

##stored: t9->length of string
addi $t8, $0, 0x2d
#load the entire  first string into0-5 max 5 digits and optional negative sign
#this a way to order my register loads to make my convert easier
#if its not negative load as normal, if it is shift one over
#t8 becomes negative or postive bit flag
# 0 for positive, 1 for negative
lb $t0, 0($a1)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative1
addi $0, $0, 0 
lb $t1, 1($a1)
lb $t2, 2($a1)
lb $t3, 3($a1)
lb $t4, 4($a1)
addi $t8, $0, 0
j loaded1
addi $0, $0, 0
negative1:
lb $t0, 1($a1)
lb $t1, 2($a1)
lb $t2, 3($a1)
lb $t3, 4($a1)
lb $t4, 5($a1) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded1:
#t9,8, 0-4 are important, dont overwrite
jal convertToInt
addi $0, $0, 0 
addi $s1, $s4,0
#a1 is loaded into s1 as an int
##########################################################################

########################################################################
#loading in the second int
addi $t9, $0, -1 #t0 is the length of the string, negative one because it will increment before the branch
addi $t1, $a2,0 
lenString2:
lb $t0, 0($t1)
addi $0, $0, 0 
addi $t1, $t1, 1 
addi $t9, $t9, 1 #increase the length count
bne $t0, $0 lenString2 #will branch if it is the end of the string
addi $0, $0, 0 

##stored: t9->length of string
addi $t8, $0, 0x2d
#load the entire  first string into0-5 max 5 digits and optional negative sign
#this a way to order my register loads to make my convert easier
#if its not negative load as normal, if it is shift one over
#t8 becomes negative or postive bit flag
# 0 for positive, 1 for negative
lb $t0, 0($a2)
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
beq $t0, $t8 negative2
addi $0, $0, 0 
lb $t1, 1($a2)
lb $t2, 2($a2)
lb $t3, 3($a2)
lb $t4, 4($a2)
addi $t8, $0, 0
j loaded2
addi $0, $0, 0
negative2:
lb $t0, 1($a2)
lb $t1, 2($a2)
lb $t2, 3($a2)
lb $t3, 4($a2)
lb $t4, 5($a2) 
addi $t8, $0, 1
addi $t9 , $t9 , -1 # need to adjust the length to accomidate negaive
loaded2:
#t9,8, 0-4 are important, dont overwrite
jal convertToInt
addi $0, $0, 0 
addi $s2, $s4,0
#a1 is loaded into s1 as an int
##########################################################################

###########################################################################
#we now have a0-a2 as ints in s0-s2 
#now its time to average them

add $t0, $s0, $s1 #t0 is the total sum
add $t0, $t0, $s2
addi $t1, $0, 0 #t1 is the final result
addi $t2, $0, 0 #t2 the value used for slt

bne $t0, $0, notZero
addi $0, $0, 0
addi $v0, $0, 0 
j zero

notZero: slti $t2, $t0,0 #check for negative
bne  $t2, $0, myDivideNegative
addi $0, $0, 0

myDividePostitive: 
slti $t2, $t0, 3 #is the value less than 3 if so, division is done
bne $t2, $0, finishedAvg
addi $0, $0, 0
addi $t0, $t0, -3   #subtract 3
addi $t1, $t1, 1    #add 1 to result
j myDividePostitive
addi $0, $0, 0

myDivideNegative: 
slti $t2, $t0, -2
beq $t2, $0, finishedAvg
addi $0, $0, 0
addi $t0, $t0, 3
addi $t1, $t1, -1
j myDivideNegative
addi $0, $0, 0

finishedAvg:
addi $v0, $t1, 0 
zero:
#yay now time to kill myself while converting back to ascii
#v0 is now the average
######################################################################

######################################################################
#converting to ascii function
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
popDone:addi $0, $0, 0
#hell yess part two is DONE
#never thought i would make it


#######################################################################

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
#ahhhhhhhhhhhhhhhhhhhh we doooooooooonnnnnnnnnnnneeeeeeeeeeee

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