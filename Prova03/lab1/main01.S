#-----------------------------------------------------------------------------------
    .data

    .align 8
c1:
    .int 0      # int x; Inicialmente 0
    .int 0      # int y; Inicialmente 0
    .byte 0     # char filled; Inicialmente 0
    .zero 7     # padding
    .quad 0     # long color; Inicialmente 0

fmt:
    .string "color: %ld, filled: %d\n" # String para printf

#-----------------------------------------------------------------------------------
    .text

    .globl main
main:
    pushq %rbp
    movq %rsp, %rbp

    # c1.x = 10;
    movl $10, c1

    # c1.y = 2 * c1.x;
    movl c1, %eax        # Move c1.x para %eax
    addl %eax, %eax      # Multiplica c1.x por 2
    movl %eax, c1+4      # Armazena o resultado em c1.y

    # c1.filled = 1;
    movb $1, c1+8        # Move 1 para c1.filled

    # Verifica se c1.y > 15 para definir a cor
    movl c1+4, %eax      # Move c1.y para %eax
    cmp $15, %eax        # Compara c1.y com 15
    jg .Lred             # Se c1.y > 15, pula para definir a cor para RED
    movq $1, c1+12       # Senão, define a cor para BLUE (1)
    jmp .Lcont           # Pula para continuação
.Lred:
    movq $2, c1+12       # Define a cor para RED (2)
.Lcont:

    # printf("color: %ld, filled: %d\n", c1.color, (int)c1.filled);
    leaq fmt(%rip), %rdi # Endereço da string de formato
    movq c1+12, %rsi     # Primeiro argumento (c1.color)
    movzbl c1+8, %edx    # Segundo argumento (c1.filled), extendido para 32 bits
    movl $0, %eax        # Limpa %eax para indicar nenhum vetor float
    call printf

    # Finaliza a função
    leave
    ret
