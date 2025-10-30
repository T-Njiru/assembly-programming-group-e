section .data
    msg db "Sum of numbers from 25 down to 15 is: %d", 10, 0

section .text
    global _start
    extern printf

_start:
    mov ecx, 25        ; starting number
    mov ebx, 0         ; sum = 0

sum_loop:
    add ebx, ecx
    dec ecx
    cmp ecx, 14        ; stop when ecx == 14
    jne sum_loop

    ; Print result with printf
    push ebx
    push msg
    call printf
    add esp, 8

    ; Exit using sys_exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
