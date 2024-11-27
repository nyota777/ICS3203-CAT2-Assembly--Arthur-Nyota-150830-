# Assembly Programming Projects

This repository contains solutions to various assembly programming tasks, including control flow, array manipulation, arithmetic operations, and string manipulation. Each task demonstrates core assembly language concepts, including looping, conditional jumps, memory manipulation, and system calls.

## Table of Contents
1. [Task 1: Control Flow and Conditional Logic](#task-1-control-flow-and-conditional-logic)
2. [Task 2: Array Manipulation with Looping and Reversal](#task-2-array-manipulation-with-looping-and-reversal)
3. [Task 3: Calculator Program](#task-3-calculator-program)
4. [Task 4: String Manipulation Tool](#task-4-string-manipulation-tool)

---

## Task 1: Control Flow and Conditional Logic

### Overview
In this task, we create a program that classifies a user-provided number as **POSITIVE**, **NEGATIVE**, or **ZERO**. The task demonstrates how to use control flow statements in assembly language, such as conditional (`JE`, `JL`, `JG`) and unconditional (`JMP`) jumps, to guide the program execution.

### Features
- Accepts user input.
- Compares the number to determine if it's positive, negative, or zero.
- Outputs the appropriate result based on the comparison.

### Instructions Chosen:
1. **`CMP` (Compare)**:  
   The `CMP` instruction compares two values without modifying them. This is ideal for comparison, as it sets flags that can be used by subsequent conditional jump instructions (`JE`, `JL`, `JG`).
   
2. **Conditional Jumps (`JE`, `JL`, `JG`)**:  
   These instructions jump to a different part of the code based on the results of the comparison:
   - **`JE`** (Jump if Equal) is used when the value is zero (i.e., the comparison result shows equality).
   - **`JL`** (Jump if Less) is used when the number is negative.
   - **`JG`** (Jump if Greater) is used when the number is positive.

3. **Unconditional Jump (`JMP`)**:  
   This is used for jumping to a specific section of the code without any condition, which is helpful to skip unnecessary code after processing a certain condition.

### Insights & Challenges
- **Insights**:  
  - `CMP` sets flags, which are used to guide the program flow.
  - The jump instructions (`JE`, `JL`, `JG`) allow for conditional behavior based on the comparison.
- **Challenges**:  
  - Debugging assembly code is complex without advanced debugging tools.
  - Handling user input efficiently and converting it into a usable format for comparison was tricky.

---

## Task 2: Array Manipulation with Looping and Reversal

### Overview
This task reverses an array of integers that the user inputs. The array is reversed **in place**, meaning no additional memory is allocated for a second array. The program uses a loop to swap elements efficiently.

### Features
- Accepts an array of integers as input.
- Reverses the array without using extra memory.
- Displays the reversed array to the user.

### Instructions Chosen:
1. **`MOV` (Move)**:  
   The `MOV` instruction is used to load values into registers or memory locations. This is crucial for manipulating data during the reversal process.

2. **Looping with `CMP`, `JL`, `JG`**:  
   - **`CMP`** compares indices to check when to stop the loop.
   - **`JL`** and **`JG`** help guide the loop by ensuring that elements are swapped until the entire array is reversed.

3. **`XCHG` (Exchange)**:  
   The `XCHG` instruction is used to swap the values of two registers or memory locations. This is used to reverse the elements in the array.

4. **Unconditional `JMP`**:  
   Used to jump back to the loop's beginning after swapping, ensuring the loop continues until all elements are reversed.

### Insights & Challenges
- **Insights**:  
  - The task requires efficient memory manipulation and looping techniques to reverse the array in place.
  - Using `MOV` and `XCHG` allows for direct data manipulation, which is key in assembly.
- **Challenges**:  
  - Manipulating memory directly with a loop requires careful management of register values and memory addresses.

---

## Task 3: Calculator Program

### Overview
This task implements a simple calculator in Assembly. It allows the user to input two numbers, choose an operation (Addition, Subtraction, Multiplication, or Division), and display the result.

### Features
1. Accepts two numbers as input.
2. Allows the user to select an operation.
3. Computes and displays the result based on the selected operation.

### Instructions Chosen:
1. **System Calls (`sys_read` and `sys_write`)**:  
   These are used for reading user input and writing output to the console. In assembly, system calls provide a way to interact with the operating system for input/output operations.

2. **Arithmetic Instructions (`ADD`, `SUB`, `MUL`, `DIV`)**:  
   These instructions perform the basic arithmetic operations. `ADD` and `SUB` are used for addition and subtraction, while `MUL` is used for multiplication. Division is done using `DIV`, which divides the accumulator by the specified divisor.

3. **`MOV` (Move)**:  
   The `MOV` instruction is used to load values into registers and prepare them for calculations.

4. **Conditional Jumps**:  
   Used for branching based on the user's choice of operation. If the user selects addition, for example, the program jumps to the section that handles addition.

### Insights & Challenges
- **Insights**:  
  - The program demonstrates the use of basic arithmetic operations and system calls for input/output.
  - Using `MOV` and `DIV` helped perform arithmetic operations directly within the CPU.
- **Challenges**:  
  - Division in assembly works as integer division, so floating-point calculations need to be handled separately.
  - Careful management of registers was required to ensure the calculations were performed correctly without overwriting important values.

---

## Task 4: String Manipulation Tool

### Overview
This program manipulates a user-provided string. The user can choose to reverse the string, convert it to uppercase, or find its length.

### Features
- Reverses the string.
- Converts the string to uppercase.
- Finds the length of the string.

### Instructions Chosen:
1. **`MOV` (Move)**:  
   Used to load characters from memory into registers for processing, such as for reversing the string or converting to uppercase.

2. **`CMP` and `JMP`**:  
   Used in loops to iterate through the string and perform the desired operations, such as converting to uppercase or reversing.

3. **ASCII Manipulation**:  
   - For converting the string to uppercase, the program checks the ASCII value of each character and adjusts it by subtracting `32` if it's a lowercase letter (since the difference between lowercase and uppercase letters in ASCII is 32).

4. **`LOOP` Instruction**:  
   Used to repeat a process for each character in the string, whether for reversal or length calculation.

### Insights & Challenges
- **Insights**:  
  - String manipulation in assembly requires careful memory handling and looping.
  - ASCII values were manipulated to handle operations like case conversion and string reversal.
- **Challenges**:  
  - Reversing a string in assembly requires handling memory addresses directly and managing the stack efficiently.
  - Case conversion and ensuring that only alphabetic characters were altered was tricky with ASCII values.

---
