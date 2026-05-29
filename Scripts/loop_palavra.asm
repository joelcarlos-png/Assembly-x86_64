section .data
    pergunta db "Digite algo: "
    len_pergunta equ $ - pergunta

section .bss
    palavra resb 50

section .text
    global _start

_start:
    mov rdi, pergunta
    mov rsi, len_pergunta
    call print

    mov rdi, palavra
    mov rsi, 50
    call scan
    mov r12, rax

    mov rbx, 0

    ;sub r12, 1
    jmp loop

loop:
    mov rdi, palavra
    mov rsi, r12
    call print

    add rbx, 1
    cmp rbx, 5
        jge exit

    jmp loop
    

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