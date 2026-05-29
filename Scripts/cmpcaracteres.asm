section .data
    pergunta db "Digite (A ou B): "
    len_pergunta equ $ - pergunta
    digitouA db "Abacaxi", 0xa
    len_A equ $ - digitouA
    digitouB db "Bola", 0xa
    len_B equ $ - digitouB
    erro db "!!Digite A ou B!!", 0xa
    len_erro equ $ - erro

section .bss
    palavra resb 2

section .text
    global _start

_start:
    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rdi, palavra
    mov rsi, 2
    call scan

    cmp byte[palavra], 65
        je letraA

    cmp byte[palavra], 66
        je letraB

    mov rdi, erro
    mov rsi, len_erro
    call print

    jmp _start

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

letraA:
    mov rdi, digitouA
    mov rsi, len_A
    call print
    jmp exit

letraB:
    mov rdi, digitouB
    mov rsi, len_B
    call print
    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall