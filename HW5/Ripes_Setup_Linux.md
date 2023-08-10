### For Linux
Please use HackMD to view the file.
#### 1. Download Ripes
1. Download the release version of Ripes from [Ripes Release](https://github.com/mortbopet/Ripes/releases)
    - For example, `Ripes-v2.2.4-linux-x86_64.AppImage` is the current version for Linux platform.
2. Actually, `Ripes-v2.2.4-linux-x86_64.AppImage` is an executable program. You can execute the program by simply double-click the icon of `Ripes-v2.2.4-linux-x86_64.AppImage`.
#### 2. Install Toolchain
1. Please download the SiFive RISC-V toolchain from [SiFive github](https://github.com/sifive/freedom-tools/releases).
   - For example, `riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz` is the current version for Ubuntu.
   - <font color="#f00">Note: Different Ubuntu version does not matter as usually. </font>

2. Open the terminal and use **tar** command to extract the file to a folder. 
    - For example :
        ```bash=
        tar zxvf riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
        ```

3. Locate the folder that contains **riscv64-unknown-elf-gcc.** Set this folder as `$RV64_GCC_PATH` and add it to the search path (see the following step).
   - For example : 
       Assume the folder is `~/HW5/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin`. 
       You can use the following commands to set the variable and add it to the search path. You may also add them to your login shell. 
       
       ```bash=
        RV64_GCC_PATH=~/HW5/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin 
        export PATH=$PATH:$RV64_GCC_PATH
       ```
#### 3. Test Setup
1. Download cmul.S from EECLASS for HW5 and open a terminal. Generate an rv64im executable by the RISC-V compiler. 
   - For example :
       ```bash=
       $RV64_GCC_PATH/riscv64-unknown-elf-gcc -march=rv64im -mabi=lp64 -s -static -nostdlib -o cmul.elf cmul.S
       ```
      
      Parameter reference:
        * "-march=rv64im" to use an 64-bit ISA version with integer ("i") and multiply ("m") supports.
        * "-mabi=lp64" to specify the language data model. In this setup, long ("l") and pointer are all 64 bits.
        * "-s" to strip symbols from binary.
        * "-static" to link statically to produce a complete executable.
        * "-nostdlib" do no use stdlib.
        * "-o" specify output name.
2. Start Ripes GUI by double clicking the program. Then, select ``File > Load Program``.
   Use Open to search for cmul.elf. 
   
   - For example :
     ![](https://i.imgur.com/5fdjw70.png =60%x)
   - If you found that current ISA in `Load Program` is not RV64, please click on ``processor selection button`` at the top-left and then select the `RISC-V > 64bit > 5-stage processor` with extension `M`&`C`
  ![](https://i.imgur.com/77zHEOk.png =80%x) 
  ![](https://i.imgur.com/S9NxYET.png =80%x)


   
3. Select ``Memory Tab``. In ``Memory Tab``, we check the ``data segment base memory address`` to calculate the ``global pointer (x3)``. 
   - For example :
       ![](https://i.imgur.com/gZdCko2.png =10%x) ![](https://i.imgur.com/mc2srSJ.png =85%x)

       Here we find that the base is ``0x11130``. Since the assembler assumes the ``global pointer (x3)`` to be set at the ``base + 0x800``, we will use ``0x11130+0x800=0x11930`` to set up the ``global pointer``.

4. Set up the ``global pointer`` :
    - **Method 1** : 
      Click on ``processor selection button`` at the top-left.![](https://i.imgur.com/77zHEOk.png =80%x)
      Then, set up the ``global pointer`` as 0x11930.![](https://i.imgur.com/YTlKjeR.png)

      After we set the ``global pointer`` for the processor, **<font color="#f00">we need to reload the cmul.elf again ( do step 2 again).</font>**
    - **Method 2** : 
      Click on ``processor Tab`` and modify the global pointer to 0x11930 directly on general purpose registers (GPR) panel.
      ![](https://i.imgur.com/GMgrRDi.png =10%x)![](https://i.imgur.com/mK7uzpO.png =50%x)



5. Click ``>>`` on the top-right to run and simulate the binary in Ripes without GUI updates.![](https://i.imgur.com/03v7VQD.png =80%x) 
   We should see the program finishes and prints ``11 + i* 17`` on the console.
   ![](https://i.imgur.com/xc8Mzep.png =50%x)


- <font color="#f00">Note: We need to set the global pointer for each new elf program load (since the data segment changes according to the text segment).</font>