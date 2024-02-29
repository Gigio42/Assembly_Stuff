section .data
    hello db 'Hello, World!',0
    input_prompt db 'Enter your name:',0
    input_buffer resb 100 ; Reserve space for user input, initialized with zeros

section .text
    global _start
    extern __imp_MessageBoxA
    extern __imp_ExitProcess
    extern __imp_GetStdHandle
    extern __imp_ReadFile

_start:
    sub rsp, 40

    ; Show message box
    mov r9, 0
    lea r8, [hello]
    mov rdx, 0
    mov rcx, 0
    call __imp_MessageBoxA

    ; Get standard input handle
    push -10
    call __imp_GetStdHandle
    mov rsi, rax ; Store handle in rsi

    ; Prompt user for input
    mov r9, 0
    lea r8, [input_prompt]
    mov rdx, 0
    mov rcx, 0
    call __imp_MessageBoxA

    ; Read user input
    lea r8, [input_buffer]
    mov rdx, 100 ; Maximum input length
    mov rcx, rsi ; Use standard input handle
    call __imp_ReadFile

    ; Display user input
    mov r9, 0
    mov r8, rsi ; Use standard output handle
    mov rdx, rax ; Length of input
    mov rcx, rsi ; Input buffer
    call __imp_MessageBoxA

    ; Exit process
    mov ecx, 0
    call __imp_ExitProcess
