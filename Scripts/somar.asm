section .data
    pergunta db "Digite dois numeros de 1 a 9 (-1 para sair): ", 0xa
    len_pergunta equ $ - pergunta
    primeiro db "Primerio numero: "
    len_primeiro equ $ - primeiro
    segundo db "Segundo Numero: "
    len_segundo equ $ - segundo
    maior db 0xa, "A soma dos dois e maior que 5!!", 0xa
    len_maior equ $ - maior
    menor db 0xa, "A soma dos dois e menor que 5!!", 0xa
    len_menor equ $ - menor
    igual db 0xa, "A com dos dois e igual a 5!!", 0xa
    len_igual equ $ - igual
    soma db "Soma: "
    len_soma equ $ - soma

section .bss
    num1 resb 2
    num2 resb 2
    result resb 2

section .text
    global _start

_start:
    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rdi, primeiro
    mov rsi, len_primeiro
    call print

    mov rdi, num1
    mov rsi, 2
    call scan

    movzx rax, byte [num1]
    
    cmp al, '-'
        je exit

    sub rax, 48

    mov r12, rax

    mov rdi, segundo
    mov rsi, len_segundo
    call print

    mov rdi, num2
    mov rsi, 2
    call scan

    movzx rdx, byte [num2]
    sub rdx, 48

    add r12, rdx

    mov rdi, soma
    mov rsi, len_soma
    call print

    mov rax, r12
    mov rdx, 0
    mov rbx, 10
    div rbx

    add rax, 48
    add rdx, 48

    mov [result], al
    mov [result + 1], dl

    mov rdi, result
    mov rsi, 2
    call print

    cmp r12, 5
        jg maiorf
        jl menorf
        je igualf

maiorf:
    mov rdi, maior
    mov rsi, len_maior
    call print
    jmp _start

menorf:
    mov rdi, menor
    mov rsi, len_menor
    call print
    jmp _start

igualf:
    mov rdi, igual
    mov rsi, len_igual
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

exit:
    mov rax, 60
    xor rdi, rdi
    syscall