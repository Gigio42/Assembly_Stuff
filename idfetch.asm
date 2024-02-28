section .data
msg db "Enter your ID", 0xA, 0xD
len equ $ - msg

section .bss
id resb 10

section .text
global _start

_start:
    ; Write message to console
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; Read input from console
    mov eax, 3
    mov ebx, 0
    mov ecx, id
    mov edx, 10
    int 0x80

    ; Display the input
    mov eax, 4
    mov ebx, 1
    mov ecx, id
    mov edx, 10
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
