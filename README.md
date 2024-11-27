# ICS3203-CAT2-Assembly--Arthur-Nyota-150830-
# Task 1: Control Flow and Conditional Logic

## Overview
This program is written in assembly language to classify a user-provided number as **POSITIVE**, **NEGATIVE**, or **ZERO**. It demonstrates how to implement control flow and decision-making at the assembly level using conditional (`JE`, `JL`, `JG`) and unconditional (`JMP`) jump instructions. 

The program accepts user input, performs a comparison, and uses branching logic to determine and output the appropriate classification. This task serves as a practical introduction to control flow in assembly programming.

---

## Instructions

### 1. Prerequisites
- Ensure you have `NASM` (Netwide Assembler) and `gcc` installed on your system. If using Ubuntu via WSL, you can install them as follows:
  ```bash
  sudo apt update
  sudo apt install nasm gcc
## Insights and Challenges

### Insights
- **Understanding Control Flow:**  
  This task illustrates the importance of jump instructions (`JE`, `JL`, `JG`, `JMP`) for decision-making in assembly programming.
  
- **Efficient Comparisons:**  
  The `CMP` instruction effectively compares values without altering them, making it ideal for guiding conditional jumps.

- **Instruction Execution:**  
  Combining conditional and unconditional jumps simplifies the program flow and ensures all possible cases are covered efficiently.

---

### Challenges
- **Debugging Jumps:**  
  Debugging the program required careful observation of how the program flow changes with different inputs. Missing or misusing jump instructions led to incorrect results.

- **Limited Debugging Tools in Assembly:**  
  Debugging assembly code without high-level constructs or tools like a debugger (e.g., `gdb`) can make it harder to track down and resolve errors.

- **User Input Handling:**  
  Managing input and converting it into a format suitable for comparison involved understanding system interrupts (e.g., `INT 21h` for 16-bit programs or appropriate syscalls for 32-bit programs).


# Task 2: Array Manipulation with Looping and Reversal

## Overview
This program is written in assembly language to reverse an array of integers entered by the user. The array is reversed **in place** using a loop, avoiding any use of additional memory. It demonstrates how to manipulate data directly in memory using assembly instructions.

---

## Features
- **User Input:** Prompts the user to input an array of integers.
- **Array Reversal:** Reverses the array in place without allocating additional memory.
- **Looping Mechanism:** Implements a loop to swap elements in the array efficiently.
- **Output Reversed Array:** Displays the reversed array back to the user.

---

## Instructions

### 1. Prerequisites
- Ensure you have `NASM` and `gcc` installed on your system. For Ubuntu, install them as follows:
  ```bash
  sudo apt update
  sudo apt install nasm gcc

# Task 3: Calculator Program

## A. Overview
This program implements a simple calculator in Assembly Language (NASM). It allows the user to:
1. Input two numbers.
2. Select an operation (Addition, Subtraction, Multiplication, or Division).
3. Compute and display the result.

## B. Instructions for Compiling and Running the Code
### 1. Compile the code:
```bash
nasm -f elf64 task3_calculator.asm -o task3_calculator.o

gcc -no-pie -o task3_calculator task3_calculator.o

./task3_calculator
## C. Insights and Challenges
### Insights:
- Designed a system to take input and perform arithmetic operations in Assembly.
- Used system calls (`sys_read` and `sys_write`) for user interaction.

### Challenges:
- Division was implemented as integer division since Assembly lacks direct floating-point arithmetic support.
- Careful management of registers to avoid overwriting values was critical for correct program behavior.


# Task 4: String Manipulation Tool

## A. Overview
This program manipulates a user-provided string in Assembly Language. Based on the user’s choice, it can:
1. Reverse the string.
2. Convert the string to uppercase.
3. Find the length of the string.

## B. Instructions for Compiling and Running the Code
### 1. Compile the code:
```bash
nasm -f elf64 task4_string_tool.asm -o task4_string_tool.o
gcc -no-pie -o task4_string_tool task4_string_tool.o
./task4_string_tool


## C. Insights and Challenges

### Insights:
- Developed a string processing system using loops to iterate through each character.
- Leveraged ASCII manipulation for tasks like uppercase conversion and string reversal.

### Challenges:
- Reversing the string required precise memory handling with pointers and the stack.
- Case conversion involved handling ASCII codes carefully to avoid altering non-alphabetic characters.
- Ensured proper string termination to prevent segmentation faults.
