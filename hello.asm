section .data
    hello db 'Hello, World!',0

section .text
    global _start
    extern __imp_MessageBoxA
    extern __imp_ExitProcess

_start:
    sub rsp, 40
    mov r9, 0
    lea r8, [hello]
    mov rdx, 0
    mov rcx, 0
    call __imp_MessageBoxA
    mov ecx, 0
    call __imp_ExitProcess
