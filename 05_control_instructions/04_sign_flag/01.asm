; JS → Jump if Sign
section .data
    msg_neg db "Number is Negative Ted Njiru 166388 (SF=1)",10,0
    len_neg equ $-msg_neg

    msg_pos db "Number is Positive (SF=0)",10,0
    len_pos equ $-msg_pos

section .text
    global _start
_start:
    ; load a negative value
    mov eax, -5      ; use full 32-bit reg
    test eax, eax    ; set flags based on sign
    js negative      ; jump if SF=1

    ; positive case
    mov ecx, msg_pos
    mov edx, len_pos
    jmp print

negative:
    mov ecx, msg_neg
    mov edx, len_neg

print:
    mov eax, 4       ; sys_write
    mov ebx, 1       ; fd = stdout
    int 0x80

    mov eax, 1       ; sys_exit
    xor ebx, ebx
    int 0x80
