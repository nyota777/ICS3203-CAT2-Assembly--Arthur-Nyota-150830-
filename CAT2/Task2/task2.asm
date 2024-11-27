section .data
    prompt db "Enter 5 integers separated by spaces: ", 0
    output db "Reversed array: ", 0
    space db " ", 0

section .bss
    array resd 5           ; Reserve space for 5 integers
    temp resd 1            ; Temporary variable for swapping

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4             ; sys_write
    mov ebx, 1             ; file descriptor (stdout)
    mov ecx, prompt
    mov edx, 33            ; Length of the prompt
    int 0x80

    ; Read input (simulate user entering 5 integers)
    mov eax, 3             ; sys_read
    mov ebx, 0             ; file descriptor (stdin)
    mov ecx, array         ; Read into array
    mov edx, 20            ; 5 integers * 4 bytes
    int 0x80

    ; Reverse the array
    mov esi, array         ; Point to the start of the array
    mov edi, array + 16    ; Point to the end of the array (5 * 4 bytes - 4)
    
reverse_loop:
    cmp esi, edi           ; If start >= end, stop
    jge reverse_done

    ; Swap values at esi and edi
    mov eax, [esi]         ; Load value at esi
    mov ebx, [edi]         ; Load value at edi
    mov [temp], eax        ; Store esi value in temp
    mov [esi], ebx         ; Move edi value to esi
    mov eax, [temp]        ; Load temp into eax
    mov [edi], eax         ; Move temp to edi

    ; Update pointers
    add esi, 4             ; Move esi to the next integer
    sub edi, 4             ; Move edi to the previous integer
    jmp reverse_loop       ; Repeat

reverse_done:
    ; Print reversed array
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 16
    int 0x80

    mov esi, array         ; Reset esi to array start
    mov ecx, 5             ; Counter for 5 integers

print_loop:
    mov eax, [esi]         ; Load the integer to print
    push eax               ; Save eax to stack
    call print_integer     ; Call the print subroutine
    add esp, 4             ; Clean up the stack

    ; Print space between numbers
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

    ; Update pointers
    add esi, 4             ; Move to the next integer
    loop print_loop        ; Repeat for all integers

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Subroutine: Print integer
print_integer:
    ; Assumes the integer to print is in eax
    ; Convert integer to string and print
    ; (Implementation skipped for brevity; placeholder)

    ret
