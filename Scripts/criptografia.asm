section .data
    pergunta_tipo db "1 para codificador e 2 para decodificador: "
    len_pergunta_tipo equ $ - pergunta_tipo
    pergunta db "Digite uma palavra: "
    len_pergunta equ $ - pergunta
    pergunta_senha db "Digite a senha: "
    len_pergunta_senha equ $ - pergunta_senha
    palavra_cripto db "Palvra criptografada: "
    len_palavra_cripto equ $ - palavra_cripto
    palavra_senha db "Senha: "
    len_palavra_senha equ $ - palavra_senha
    alfabeto db 0xa, "A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z", 0xa 
    len_alfabeto equ $ - alfabeto
    numeros db "01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26", 0xa, 0xa
    len_numeros equ $ - numeros

section .bss
    palavra resb 1000
    senha resb 2000
    op resb 2

section .text
    global _start

_start:
    mov rdi, pergunta_tipo
    mov rsi, len_pergunta_tipo
    call print

    mov rdi, op
    mov rsi, 2
    call scan

    mov r11, rax

    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rdi, palavra
    mov rsi, 1000
    call scan

    mov r12, rax

    mov rdi, pergunta_senha
    mov rsi, len_pergunta_senha
    call print

    mov rdi, senha
    mov rsi, 2000
    call scan

    mov r13, rax

    mov rcx, 0
    mov rbx, 0

operacao:
    movzx r11, byte [op]
    cmp r11, 49
        je criptocodificadora
        jmp criptodecodificadora

criptocodificadora:
    mov al, [palavra + rcx]

    cmp al, 0xa
        je result
    
    mov r8b, [senha + rbx]
    sub r8b, 48

    mov r9b, [senha + rbx + 1]
    sub r9b, 48

    cmp r9b, 1
        je somar
        jmp subitrair

criptodecodificadora:
    mov al, [palavra + rcx]

    cmp al, 0xa
        je result
    
    mov r8b, [senha + rbx]
    sub r8b, 48

    mov r9b, [senha + rbx + 1]
    sub r9b, 48

    cmp r9b, 1
        je subitrair
        jmp somar

somar:
    add al, r8b
    cmp al, 90
        jg somar_parcial
    jmp salvar

somar_parcial:
    sub al, 26
    jmp salvar

subitrair:
    sub al, r8b
    cmp al, 65
        jl subtrair_parcial
    jmp salvar

subtrair_parcial:
    add al, 26
    jmp salvar

salvar:
    mov [palavra + rcx], al

    inc rcx
    add rbx, 2
    jmp operacao

result:
    mov rdi, alfabeto
    mov rsi, len_alfabeto
    call print

    mov rdi, numeros
    mov rsi, len_numeros
    call print

    mov rdi, palavra_cripto
    mov rsi, len_palavra_cripto
    call print

    mov rdi, palavra
    mov rsi, r12
    call print

    mov rdi, palavra_senha
    mov rsi, len_palavra_senha
    call print

    mov rdi, senha
    mov rsi, r13
    call print

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

exit:
    mov rax, 60
    mov rdi, rdi
    syscall