# This example demonstrates an implementation of  matrix chain multiplication
# Please find the minimum number of multiplication needed to multiply a chain of matrix
# We provided one string in global for simplify.
# The ouput of test pattern 1 should be => Minimum number of multiplications is: 30
# The ouput of test pattern 2 should be => Minimum number of multiplications is: 240
# Reference link : https://www.geeksforgeeks.org/matrix-chain-multiplication-dp-8/?ref=gcse

.data
.align 4
# test pattern 1
Matrix_array: .word 1, 2, 3, 4, 3
Number_of_matrix: .word 5
# test pattern 2
# Matrix_array: .word 5, 7, 3, 4, 5
# Number_of_matrix: .word 5
str1: .string "Minimum number of multiplications is: "

.text
.global _start

# Start your coding below, don't change anything upper.
_start:

