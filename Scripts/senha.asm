section .data
    pergunta db "Digite a senha: "
    len_pergunta equ $ - pergunta

    aceita db " aceita!!", 0xa, 0xa
    len_aceita equ $ - aceita

    negada db " negada!", 0xa, 0xa
    len_negada equ $ - negada

    opsenha db "Senha: "
    len_opsenha equ $ - opsenha

section .bss
    senha resb 50

section .text
    global _start

_start:
    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rdi, senha
    mov rsi, 50
    call scan
    mov r12, rax

    mov rdi, opsenha
    mov rsi, len_opsenha
    call print

    mov rdi, senha
    sub r12, 1
    mov rsi, r12
    call print

    cmp r12, 6
        jl negado
        jge aceito


    jmp exit

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

negado:
    mov rdi, negada
    mov rsi, len_negada
    call print
    jmp _start

aceito:
    mov rdi, aceita
    mov rsi, len_aceita
    call print
    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall