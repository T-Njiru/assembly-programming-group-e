; Ted Njiru 166388
; JO → Jump if Overflow

section .data
    msg_ov    db "Overflow occurred Ted Njiru 166388 (OF=1)",10,0
    len_ov    equ $-msg_ov

    msg_noov  db "No Overflow Ted Njiru 166388 (OF=0)",10,0
    len_noov  equ $-msg_noov

section .text
    global _start
_start:
    mov ax,7FFFh      ; largest positive 16-bit signed int (32767)
    add ax,1          ; becomes 0x8000 → signed overflow (OF=1)
    jo overflow

    ; no overflow case
    mov ecx, msg_noov
    mov edx, len_noov
    jmp print

overflow:
    ; overflow case
    mov ecx, msg_ov
    mov edx, len_ov

print:
    mov eax,4         ; sys_write
    mov ebx,1         ; stdout
    int 0x80

    mov eax,1         ; sys_exit
    xor ebx,ebx
    int 0x80
