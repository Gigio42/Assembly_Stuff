section .data
    hello db 'Hello, World!',0

section .text
    global _start
    extern __imp_MessageBoxA
    extern __imp_ExitProcess

_start:
    sub rsp, 40
    xor r9, r9
    lea r8, [hello]
    xor rdx, rdx
    xor rcx, rcx
    call __imp_MessageBoxA
    xor ecx, ecx
    call __imp_ExitProcess
