section .data
    sum     dd 0
    message db "Sum of numbers from 15 to 25 is: %d", 10, 0

section .text
    global _start
    extern printf

_start:
    mov ecx, 15        ; start number
    mov ebx, 0         ; sum = 0

loop_add:
    add ebx, ecx
    inc ecx
    cmp ecx, 26        ; stop after 25
    jne loop_add

    ; call printf
    push ebx
    push message
    call printf
    add esp, 8

    ; exit
    mov eax, 1         ; sys_exit
    xor ebx, ebx
    int 0x80
