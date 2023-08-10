# This example demonstrates an implementation of KMP's algorithm for pattern searching.
# We provided an input string and a pattern in global for simplfy.
# Reference link : https://www.geeksforgeeks.org/kmp-algorithm-for-pattern-searching/?ref=gcse
# The ouput of test pattern 1 should be =>  Found pattern at index 10
#                                       Found pattern at index 15 
# The ouput of test pattern 2 should be =>  Found pattern at index 0 
#                                       Found pattern at index 9 
#                                       Found pattern at index 15 


.data
.align 4
# test pattern 1
#inputText: .string "ABABDABACDABABCABABC"
#pattern: .string "ABABC"
#inputSize: .word 20
#patternSize: .word 5

# test pattern 2
 inputText: .string "ACGTCTGTAACGTCCACGCTC"
 pattern: .string "ACG"
 inputSize: .word 21
 patternSize: .word 3
str: .string "Found pattern at index "
newline: .string "\n"
checkReadIn: .string "checkReadIn"
init_str: .string "start initialization "
Whileloop_str: .string "While loop called and i is "
else_if_str : .string " -> called else_if "
ifEqual_str : .string " -> called if equal "
else_str : .string " -> called else "
i_str : .string " i is "
j_str: .string " j is and "
.text
.global _start
# Start your coding below, don't change anything upper.

_start:
 # Load the length of the two word
    la a1, inputText
    la a2, pattern
    lw a3, inputSize
    lw a4, patternSize
    jal x1, KMP
    j end
#x10-x11 function argument/return values 
#x12-x17 function argument
#x5-x7, x28-x31 temporary
#x9, x18-x27 saved registers -->saver is callee
#type(1)
KMP:
slli s0, a4, 2 #patternSize
sub sp, sp, s0
add s1, sp, x0 #lps's addr


addi sp, sp, -8
sd x1, 0(sp)
jal x1, computeLPS

add s2, x0, x0  #i = 0
add s3, x0, x0  #j = 0

#type4
ld x1, 0(sp)
blt s2, a3, while_for_KMP
jalr x0, 0(x1)

computeLPS:
    add t0, x0, x0 #int len = 0;
    sw x0, 0(s1)   #lps[0] = 0;
    
    addi t1, x0, 1 #int i = 1;
    blt t1, a3, while_for_LPS
while_for_LPS:
    add t2, t1, a2
    add t3, t0, a2
    #create type2 hazard
    add s10, t2, t2
    lw t4, 0(t2)
    lw t5, 0(t3)
    addi sp, sp, -80
    sd s2, 72(sp)
    sd s3, 64(sp)
    sd s4, 56(sp)
    sd s5, 48(sp)
    sd s6, 40(sp)
    sd s7, 32(sp)
    sd s8, 24(sp)
    sd s9, 16(sp)
    sd s10, 8(sp)
    sd s11, 0(sp)
    beq t4, t5, if_for_LPS
    beq x0, x0, else_for_LPS
conti:
    ld s11, 0(sp)
    ld s10, 8(sp)
    ld s9, 16(sp)
    ld s8, 24(sp)
    ld s7, 32(sp)
    ld s6, 40(sp)
    ld s5, 48(sp)
    ld s4, 56(sp)
    ld s3, 64(sp)
    ld s2, 72(sp)
    addi sp, sp, 80
    blt t1, a3, while_for_LPS
    jalr x0, 0(x1)
if_for_LPS:
    addi t0, t0, 1  #len++;
    slli s2, t1, 2  #i*4
    add  s2, s2, s1 #lps[i]
    sw t0, 0(s2)

    addi t1, t1, 1
    beq x0, x0, conti
else_for_LPS:
    bne t0, x0, if_inElse_for_LPS
    beq x0, x0, else_inElse_for_LPS
if_inElse_for_LPS:
    addi t0, t0, -1
    slli s3, t0, 2
    add s3, s3, s1
    sw s3, 0(t0)
    beq x0, x0, conti
else_inElse_for_LPS:
    slli s4, t1, 2  #i*4
    add  s4, s4, s1 #lps[i]
    sw x0, 0(s4) 
    addi t1, t1, 1
    beq x0, x0, conti
while_for_KMP:
    add s4, s3, a2 
    lb s5, 0(s4)
    add s6, s2, a1
    #type4
    add s11, s5, s5
    #type 3
    lb s7, 0(s6)
    beq s5, s7, if_for_KMP
continue:
    beq s3, a4, if2_for_KMP
    beq x0, x0, else_if2_for_KMP
    blt s2, a3, while_for_KMP
    jalr x0, 0(x1)
if_for_KMP:
   addi s2, s2, 1
   addi s3, s3, 1
   beq x0, x0, continue 
if2_for_KMP:
    la a0, str
    li a7, 4
	ecall

    sub a0, s2, s3
    li a7, 1
	ecall
    
    la a0, newline
    li a7, 4
	ecall

    addi s3, s3, -1
    slli s8, s3, 2
    add s8, s8, s1
    sw s8, 0(s3)

    blt s2, a3, while_for_KMP
    jalr x0, 0(x1)

else_if2_for_KMP:
    bne s5, s7, else_if2_for_KMP2
    blt s2, a3, while_for_KMP
    jalr x0, 0(x1)

else_if2_for_KMP2:
    bne s3, x0, if_inelse_if2_for_KMP
    beq x0, x0, else_inelse_if2_for_KMP

if_inelse_if2_for_KMP:
    addi s3, s3, -1
    slli s8, s3, 2
    add s8, s8, s1
    sw s8, 0(s3)

    blt s2, a3, while_for_KMP
    jalr x0, 0(x1)

else_inelse_if2_for_KMP:
    addi s2, s2, 1
    blt s2, a3, while_for_KMP
    jalr x0, 0(x1)

end:nop
