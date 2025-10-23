; Ted Njiru 166388
; JNS → Jump if Not Sign

section .data
    msg_neg db "Number is Negative Ted Njiru 166388 (SF=1)",10,0
    len_neg equ $-msg_neg

    msg_nonneg db "Number is Non-Negative Ted Njiru 166388 (SF=0)",10,0
    len_nonneg equ $-msg_nonneg

section .text
    global _start
_start:
    mov eax, 5          ; test with positive (change to -5 for negative)
    test eax, eax
    jns nonneg          ; jump if SF=0 (non-negative)

    ; negative case
    mov ecx, msg_neg
    mov edx, len_neg
    jmp print

nonneg:
    ; non-negative case
    mov ecx, msg_nonneg
    mov edx, len_nonneg

print:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    int 0x80

    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80
