    .global main
    .text

# Protótipos das funções externas
    .extern constante
    .extern init
    .extern printf

main:
    # Prolog
    pushq   %rbp
    movq    %rsp, %rbp

    # Alocar espaço na pilha para as variáveis locais
    subq    $32, %rsp        # Espaço para i (4 bytes) + padding (4 bytes) + l (8 bytes) + espaço extra (16 bytes para alinhamento)

    # Chamar constante() e mover o resultado para 's', garantindo que seja tratado como short (16 bits)
    call    constante
    movzbl  %al, %edx        # Corretamente move e zero-extende o byte para 32 bits em %edx
    movw    %dx, -20(%rbp)   # 's' é armazenado próximo ao topo da pilha (mas em um registrador para a lógica do problema)

    # Preparar argumentos para init(s, &l, &i)
    leaq    -16(%rbp), %rsi  # Endereço de 'l'
    leaq    -24(%rbp), %rdx  # Endereço de 'i'
    movswl  -20(%rbp), %edi  # 's' convertido para int e usado como o primeiro argumento
    call    init

    # Preparar argumentos para printf("Soma: %ld\n", l + i + s);
    movslq  -24(%rbp), %rdx  # Carrega 'i' e extende para 64 bits
    addq    -16(%rbp), %rdx  # Adiciona 'l' a 'i'
    addw    -20(%rbp), %dx   # Adiciona 's' ao resultado
    movq    %rdx, %rsi       # Move a soma total para %rsi, segundo argumento do printf
    leaq    .Lstr(%rip), %rdi  # Primeiro argumento do printf (a string)
    movq    $0, %rax        # Diz ao printf que não há valores em ponto flutuante
    call    printf

    # Finalizar main e retornar
    movq    $0, %rax        # Valor de retorno de main
    addq    $32, %rsp       # Limpa a pilha
    popq    %rbp
    ret

# String para printf
    .section    .rodata
.Lstr:
    .string "Soma: %ld\n"
