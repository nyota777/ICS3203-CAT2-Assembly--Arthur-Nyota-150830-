section .data
    prompt db "Enter a number to calculate its factorial: ", 0
    result_msg db "The factorial is: ", 0

section .bss
    number resb 1          ; Space for user input
    factorial_result resd 1 ; Space to store the result

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4             ; sys_write
    mov ebx, 1             ; file descriptor (stdout)
    mov ecx, prompt
    mov edx, 38            ; Length of the prompt
    int 0x80

    ; Read input
    mov eax, 3             ; sys_read
    mov ebx, 0             ; file descriptor (stdin)
    mov ecx, number        ; Buffer for input
    mov edx, 1             ; Read one character
    int 0x80

    ; Convert input to integer
    movzx eax, byte [number] ; Move the input character to eax
    sub eax, '0'            ; Convert ASCII to integer
    mov [number], eax       ; Store the integer

    ; Call factorial subroutine
    mov eax, [number]       ; Load the number to calculate factorial
    call factorial          ; Call the factorial subroutine
    mov [factorial_result], eax ; Store the result

    ; Print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print the factorial result
    mov eax, [factorial_result]
    push eax               ; Push result onto the stack
    call print_integer     ; Call subroutine to print integer
    add esp, 4             ; Clean up stack

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Subroutine: Factorial calculation
factorial:
    push ebp               ; Save base pointer
    mov ebp, esp           ; Establish stack frame

    ; Base case: if eax <= 1, return 1
    cmp eax, 1
    jle factorial_done

    ; Recursive case: eax = eax * factorial(eax - 1)
    push eax               ; Save current number
    dec eax                ; eax = eax - 1
    call factorial         ; Recursive call
    mov ebx, eax           ; Save result of factorial(n-1)
    pop eax                ; Restore current number
    mul ebx                ; Multiply current number with result of factorial(n-1)

factorial_done:
    mov esp, ebp           ; Restore stack pointer
    pop ebp                ; Restore base pointer
    ret

; Subroutine: Print integer
print_integer:
    ; Convert the integer in eax to a string and print
    ; Placeholder for implementation
    ret
