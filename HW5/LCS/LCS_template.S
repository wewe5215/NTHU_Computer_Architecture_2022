# This example demonstrates an implementation of LCS's algorithm for finding longest common subsequences.
# We provided two strings in global for simplfy.
# Reference link : https://www.geeksforgeeks.org/longest-common-subsequence-dp-4/
# The ouput of test pattern 1 should be =>  Found LCS length : 8 
# The ouput of test pattern 2 should be =>  Found LCS length : 13

.data
.align 4
# test pattern 1
SequenceA: .string "ACGTTCGCGACA"
SequenceB: .string "ATCGATGCGC"
SASize: .word 12
SBSize: .word 10
# test pattern 2
# SequenceA: .string "ACGTTTGTAACGACA"
# SequenceB: .string "ACGTCTGTAACGTCCACGCTC"
# SASize: .word 15
# SBSize: .word 21
str: .string "Found LCS length : "
newline: .string "\n"
.text
.global _start
# Start your coding below, don't change anything upper.

_start:



    


    

