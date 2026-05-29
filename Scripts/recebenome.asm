section .data:
    pergunta db "Digite seu nome: "
    len_pergunta equ $ - pergunta
    resposta db "Seu nome é "
    len_resposta equ $ - resposta

section .bss
    nome resb 32

section .text
    global _start

_start:
    mov eax, 1
    mov rdi, 1
    mov rsi, pergunta
    mov rdx, len_pergunta
    syscall

    mov eax, 0
    mov rdi, 0
    mov rsi, nome
    mov rdx, 32
    syscall

    mov r12, rax

    mov eax, 1
    mov rdi, 1
    mov rsi, resposta
    mov rdx, len_resposta
    syscall

    mov eax, 1
    mov rdi, 1
    mov rsi, nome
    mov rdx, r12
    syscall

    mov ax, 1
    mov rdi, 1
    mov rsi, pergunta
    mov rdx, len_pergunta
    syscall

    mov ax, 0
    mov rdi, 0
    mov rsi, nome
    mov rdx, 32
    syscall

    mov r12, rax

    mov ax, 1
    mov rdi, 1
    mov rsi, resposta
    mov rdx, len_resposta
    syscall

    mov ax, 1
    mov rdi, 1
    mov rsi, nome
    mov rdx, r12
    syscall


    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall