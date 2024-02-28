section .text
global main

main:
    ; Initialize arguments
    mov rdi, str_address  ; Set rdi to point to the string
    mov sil, char_count   ; Set sil to the character count

    ; Call str_count function
    call str_count

    ; Retrieve the result from eax
    mov [result], eax

    ; Exit the program
    mov eax, 60       ; syscall number for exit
    xor edi, edi      ; exit code 0
    syscall           ; invoke syscall to exit

; Define the str_count function
str_count:
    ; Initialize the counter in eax to zero
    xor eax, eax

.loop:
    ; Check if we've reached the end of the string
    cmp byte [rdi], 0
    je .done

    ; Check if the current character matches the specified character
    cmp byte [rdi], sil
    jne .next_char

    ; If the character matches, increment the counter
    inc eax

.next_char:
    ; Move to the next character in the string
    inc rdi
    jmp .loop

.done:
    ret

section .data
str_address db "Your string here", 0  ; Example string
char_count equ  'c'                   ; Example character count
result dd 0                           ; Placeholder for the result
