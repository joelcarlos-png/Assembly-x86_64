section .data
    pergunta db "Digite 1 ou 2: "
    len_pergunta equ $ - pergunta
    r1 db "!!VOCE DIGITOU 1!!", 0xa
    len_r1 equ $ - r1
    r2 db "!!VOCE DIGITOU 2!!", 0xa
    len_r2 equ $ - r2
    erro db "Numero invalido", 0xa
    len_erro equ $ - erro

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

_start:
    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rax, 0
    mov rdi, 0
    mov rsi, num
    mov rdx, 2
    syscall

    cmp byte [num], 49
        je print_r1

    cmp byte [num], 50
        je print_r2

    jmp erros

    print_r1:
        mov rdi, r1
        mov rsi, len_r1
        call print
        syscall
        jmp exit

    print_r2:
        mov rdi, r2
        mov rsi, len_r2
        call print
        syscall
        jmp exit
    
    erros:
        mov rdi, erro
        mov rsi, len_erro
        call print
        syscall
        jmp _start

exit:
    mov rax, 60
    xor rdi, rdi
    syscall