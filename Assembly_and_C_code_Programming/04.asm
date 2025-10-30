; 04.asm — Factorial in Assembly (NASM for Linux)
; -----------------------------------------------
; To be called from C: int factorial(int n);

section .text
    global factorial        ; Make visible to C

factorial:
    ; Prologue (set up stack frame)
    push rbp
    mov rbp, rsp

    mov eax, edi            ; 'n' is in EDI (System V AMD64 ABI)
    cmp eax, 0
    jle .base_case          ; if n <= 0, return 1

    mov ecx, eax            ; counter = n
    mov eax, 1              ; result = 1

.loop:
    imul eax, ecx           ; result *= counter
    loop .loop              ; decrease ecx and continue until 0

    jmp .done

.base_case:
    mov eax, 1              ; factorial(0) = 1

.done:
    pop rbp
    ret
