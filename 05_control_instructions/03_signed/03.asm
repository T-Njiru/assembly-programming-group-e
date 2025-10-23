; JL / JNGE → Jump if Less
section .data
    msg_less     db "AX < BX (Signed Less) Ted Njiru 166388",10,0
    len_less     equ $ - msg_less

    msg_not_less db "AX >= BX (Not Less) Ted Njiru 166388",10,0
    len_not_less equ $ - msg_not_less

section .text
    global _start
_start:
    mov ax,2
    mov bx,5
    cmp ax,bx
    jl less_label           ; Jump if AX < BX (signed)

    ; AX >= BX case
    mov ecx, msg_not_less
    mov edx, len_not_less
    jmp print

less_label:
    ; AX < BX case
    mov ecx, msg_less
    mov edx, len_less

print:
    mov eax,4               ; sys_write
    mov ebx,1               ; stdout
    int 0x80

    mov eax,1               ; sys_exit
    xor ebx,ebx
    int 0x80
