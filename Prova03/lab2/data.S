#-----------------------------------------------------------------------------------
    .data

    .align 8
d1:
    .int 3                          # len = 3 para d1
    .zero 4                         # padding
    .quad 1, 2, 3, 0, 0             # elems[5] para d1

    .align 8
d2:
    .int 5                          # len = 5 para d2
    .zero 4                         # ṕadding
    .quad 10, 20, 30, 40, 50        # elems[5] para d2

fmt:    
    .string "%ld\n"

#----------------------------------------------------------------------------------
    .text

    .globl show
show:
    pushq %rbp           
    movq %rsp, %rbp     

    subq $16, %rsp                  # Alocando espaço para variáveis locais, ajustando para manter alinhamento

    movq %rdi, -8(%rbp)             # Salva o ponteiro para a estrutura data em um espaço local na pilha
    movl $0, %ebx                   # ebx será usado para indexar o array, i = 0

    # Carregando d->len em %eax
    movl (%rdi), %eax               # Carrega d->len em eax

loop_start:
    cmpl %ebx, %eax                 # Compara i (ebx) com d->len
    jl loop_end                     # Se i >= d->len, sair do loop

    # Calculando endereço de d->elems[i]
    movq -8(%rbp), %rdi             # Recupera o ponteiro para d
    leaq 8(%rdi), %rdi              # Ajusta o ponteiro para o início de elems
    movq %rbx, %rax                 # Move i para rax para usar como índice
    movq (%rdi, %rax, 8), %rsi      # Carrega d->elems[i] em rsi

    # Preparando e chamando printf
    leaq fmt(%rip), %rdi             # Carrega o formato de string para printf
    movl $0, %eax                   # Zero extend para eax, convencionado para chamadas de vararg
    call printf                     # Chamada de printf("%ld\n", d->elems[i])

    # Incrementando i
    inc %ebx                        # Incrementa ebx, que é usado como índice de loop
    jmp loop_start

loop_end:

    leave                           # Restaura %rsp e %rbp
    ret                             # Retorna da função

