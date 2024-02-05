 .section .rodata
fmt: .string "Diferença em %d/%d: %ld\n"
#-------------------------------------------------------------------------------
 .data
/*
struct Produto
 char mes; // 1 byte, Offset +0
 Padding // 7 bytes
 long preco // 8 bytes, Offset +8
 int ano // 4 bytes, Offset +16
 Padding // 4 bytes
 //--------------------
 // 24 bytes
*/
    .globl prods
    .align 8
prods:
    .short  0       # char mes
    .zero   6       # padding de 6
    .quad   0       # long preco
    .int    0       # int ano
    .zero   4       # padding de 4
#-------------------------------------------------------------------------------
    .text

    .globl media
media:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    # Salvar antes de usar
    movq %r12, -8(%rbp)
    movq %r13, -16(%rbp)
    # int i = 0
    movl $0, %r12d
    # long soma = 0
    movq $0, %r13
    # for (i = 0; i < size; i++)
    movl $0, %r12d
for01:
    movslq %r12d, %rax # rax = (long)i
    cmpq %rsi, %rax # if (i >= size) -> end
    jge endfor01
    # soma += ptr[i].preco
    movslq %r12d, %rax # rax = (long)i
    imulq $24, %rax # rax = i * 24
    addq %rdi, %rax # rax = &ptr[i]
    addq 8(%rax), %r13 # r13 += ptr[i].preco
    incl %r12d # i++
    jmp for01
endfor01:
    # rax = soma / size
    movq %r13, %rax
    cqto
    idivq %rsi
    # Restaurar antes de sair
    movq -8(%rbp), %r12
    movq -16(%rbp), %r13
    leave
    ret

    .globl main
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    # int i = 0
    movl $0, %r8d
    movq $prods, %rdx # rdx = &prods[0]
    # prods[0].mes = JAN;
    movb $1, (%rdx)
    # prods[0].preco = 100;
    movq $100, 8(%rdx)
    # prods[0].ano = 2020;
    movl $2020, 16(%rdx)
    addq $24, %rdx # rdx = &prods[1]
    # prods[1].mes = FEV
    movb $2, (%rdx)
    # prods[1].preco = 120
    movq $120, 8(%rdx)
    # prods[1].ano = 2020
    movl $2020, 16(%rdx)
    # long m = media(prods, 2)
    movq %r8, -8(%rbp) # Salvar r8
    movq $prods, %rdi # rdi = &prods
    movq $2, %rsi # rsi = SIZE
    call media
    movq %rax, %r9 # r9 = m
    movq -8(%rbp), %r8 # Restaurar r8
while01:
    # while (i < SIZE)
    cmpl $2, %r8d
    jge endwhile01
    # printf("Diferença em %d/%d: %ld\n", (int)prods[i].mes, prods[i].ano, prods[i].preco - m);
    movq %r8, -8(%rbp) # Salvar r8
    movq %r9, -16(%rbp) # Salvar r9
    movq $prods, %r11 # r11 = &prods
    movslq %r8d, %r10 # r10 = (long)i
    imulq $24, %r10 # r10 = i * 24
    addq %r11, %r10 # r10 = &prods[i]
    movq $fmt, %rdi # %rdi = &fmt (1o. parametro)
    movsbl (%r10), %esi # esi = prods[i].mes (2o. parametro)
    movl 16(%r10), %edx # edx = prods[i].ano (3o. parametro)

    movq 8(%r10), %rcx # rcx = prods[i].preco (4o. parametro)
    subq %r9, %rcx # rcx = prods[i].preco - m
    movl $0, %eax
    call printf
    movq -8(%rbp), %r8 # Restaurar r8
    movq -16(%rbp), %r9 # Restaurar r9
    incl %r8d # i++
    jmp while01
endwhile01:
    # return 0
    movl $0, %eax
    leave
    ret
 