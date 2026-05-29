section .bss
    result resb 2

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
    mov rbx, 0

loop:
    mov rax, rbx
    add rax, 1
    mov ah, " "
    mov [result], ax

    mov rdi, result
    mov rsi, 2
    call print

    add rbx, 1
    cmp rbx, 255
        jl loop

    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall