section .data
    prompt db "Enter a number: ", 0
    positive db "POSITIVE", 0
    negative db "NEGATIVE", 0
    zero db "ZERO", 0

section .bss
    number resb 4

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prompt
    mov edx, 15         ; length of the prompt
    int 0x80

    ; Read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, number
    mov edx, 4          ; length of the input buffer
    int 0x80

    ; Convert input to integer
    mov eax, [number]
    sub eax, '0'        ; ASCII to integer

    ; Conditional logic
    cmp eax, 0
    je is_zero          ; If eax == 0, jump to is_zero
    jl is_negative      ; If eax < 0, jump to is_negative
    jmp is_positive     ; Else, jump to is_positive

is_positive:
    ; Output "POSITIVE"
    mov eax, 4
    mov ebx, 1
    mov ecx, positive
    mov edx, 8
    int 0x80
    jmp exit

is_negative:
    ; Output "NEGATIVE"
    mov eax, 4
    mov ebx, 1
    mov ecx, negative
    mov edx, 8
    int 0x80
    jmp exit

is_zero:
    ; Output "ZERO"
    mov eax, 4
    mov ebx, 1
    mov ecx, zero
    mov edx, 4
    int 0x80

exit:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
