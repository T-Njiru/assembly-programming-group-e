; Ted Njiru 166388
; JC → Jump if Carry

section .data
    msg_carry    db "Carry occurred Ted Njiru 166388 (CF=1)",10,0
    len_carry    equ $-msg_carry

    msg_nocarry  db "No Carry Ted Njiru 166388 (CF=0)",10,0
    len_nocarry  equ $-msg_nocarry

section .text
    global _start
_start:
    mov ax,0FFFFh    ; largest 16-bit value
    add ax,1         ; causes overflow → CF=1
    jc carry

    ; no carry case
    mov ecx, msg_nocarry
    mov edx, len_nocarry
    jmp print

carry:
    ; carry case
    mov ecx, msg_carry
    mov edx, len_carry

print:
    mov eax,4        ; sys_write
    mov ebx,1        ; stdout
    int 0x80

    mov eax,1        ; sys_exit
    xor ebx,ebx
    int 0x80
