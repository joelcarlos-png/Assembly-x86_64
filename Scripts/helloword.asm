section .data
    msg db "!!Ola mundo!!", 0xa
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov eax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    mov ax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall