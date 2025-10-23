; Ted Njiru 166388
; JNP / JPO → Jump if Parity Odd

section .data
    msg_even db "Parity Even Ted Njiru 166388 (PF=1)",10,0
    len_even equ $-msg_even

    msg_odd  db "Parity Odd Ted Njiru 166388 (PF=0)",10,0
    len_odd  equ $-msg_odd

section .text
    global _start
_start:
    mov al,5           ; 00000101b → two 1s → even parity → PF=1
    test al,al
    jnp odd            ; jump if PF=0 (parity odd)

    ; even parity case
    mov ecx, msg_even
    mov edx, len_even
    jmp print

odd:
    ; odd parity case
    mov ecx, msg_odd
    mov edx, len_odd

print:
    mov eax,4          ; sys_write
    mov ebx,1          ; stdout
    int 0x80

    mov eax,1          ; sys_exit
    xor ebx,ebx
    int 0x80
