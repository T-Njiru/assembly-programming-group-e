; JB / JNAE → Jump if Below
section .data
    str_below     db "AX < BX (Below) Ted Njiru 166388",10,0
    len_below     equ $ - str_below

    str_not_below db "AX >= BX (Not Below) Ted Njiru 166388",10,0
    len_not_below equ $ - str_not_below

section .text
    global _start
_start:
    mov ax,2
    mov bx,5
    cmp ax,bx
    jb below               ; Jump if AX < BX

    ; AX >= BX case
    mov ecx, str_not_below
    mov edx, len_not_below
    jmp print

below:
    ; AX < BX case
    mov ecx, str_below
    mov edx, len_below

print:
    mov eax,4              ; sys_write
    mov ebx,1              ; stdout
    int 0x80

    mov eax,1              ; sys_exit
    xor ebx,ebx
    int 0x80
