RISCV = /Users/wewe5215/Desktop/計結/HW5/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-apple-darwin/bin
CC = $(RISCV)/riscv64-unknown-elf-gcc
FLAG = -march=rv64im -mabi=lp64 -s -static -nostdlib 
kmp: HW5_KMP_109062320.s
	$(CC) $(FLAG) -o $@.elf $<
