# This example demonstrates an implementation of  Multiply two polynomials with integer coefficients, 
# and find the sum of all coefficients of multiplication polynomial
# We provided three strings in global for simplify.
# The ouput of test pattern 1 should be => Product polynomial is: 5 + 10x^1 + 30x^2 + 26x^3 + 52x^4 + 24x^5
# The ouput of test pattern 2 should be => Product polynomial is: 1 + 3x^1 + 9x^2 + 15x^3 + 29x^4 + 43x^5 + 20x^6
# Reference link : https://www.geeksforgeeks.org/multiply-two-polynomials-2/

.data
.align 4
# test pattern 1
polynomialA: .word 5, 0, 10, 6
polynomialB: .word 1, 2, 4
ASize: .word 4
BSize: .word 3
# test pattern 2
# polynomialA: .word 1, 3, 7, 4
# polynomialB: .word 1, 0, 2, 5
# ASize: .word 4
# BSize: .word 4
str1: .string "Product polynomial is: "
str2: .string "x^"
str3: .string " + "

.text
.global _start
# Start coding in the section below, don't change the values above #
_start: