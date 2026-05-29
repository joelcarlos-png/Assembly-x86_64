section .data
    pergunta db "Digite a senha: "
    len_pergunta equ $ - pergunta
    msg_ok db "Acesso Liberado!!", 0xa
    len_msg_ok equ $ - msg_ok
    msg_neg db "Acesso Negado!!", 0xa
    len_Msg_neg equ $ - msg_neg

section .bss
    num resb 2

section .text
    global _start

print:
    mov rdx, rsi
    mov rsi, rdi
    mov rax, 1
    mov rdi, 1
    syscall
    ret

scan:
    mov rdx, rsi
    mov rsi, rdi
    mov rax, 0
    mov rdi, 0
    syscall
    ret

_start:
    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rdi, num
    mov rsi, 2
    call scan

    cmp byte [num], 97
        je acesso_liberado

    cmp byte [num], 65
        je acesso_liberado

    jmp erro

acesso_liberado:
    mov rdi, msg_ok
    mov rsi, len_msg_ok
    call print
    jmp exit

erro:
    mov rdi, msg_neg
    mov rsi, len_Msg_neg
    call print
    jmp _start

exit:
    mov rax, 60
    xor rdi, rdi
    syscall