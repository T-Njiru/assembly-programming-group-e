; JAE / JNB → Jump if Above or Equal
section .data
    str_ae db "AX >= BX (Above or Equal) Ted Njiru 166388",10,0
    len_ae equ $ - str_ae

    str_below db "AX < BX (Below) Ted Njiru 166388",10,0
    len_below equ $ - str_below

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jae above_equal         ; Jump if AX >= BX

    ; AX < BX case
    mov ecx, str_below
    mov edx, len_below
    jmp print

above_equal:
    ; AX >= BX case
    mov ecx, str_ae
    mov edx, len_ae

print:
    mov eax,4               ; sys_write
    mov ebx,1               ; stdout
    int 0x80

    mov eax,1               ; sys_exit
    xor ebx,ebx
    int 0x80
