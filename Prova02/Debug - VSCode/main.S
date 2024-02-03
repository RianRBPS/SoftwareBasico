    .data

# int vi = 1234;
    .globl vi
    .align 4
vi: .int 1234

# unsigned int vui = 1234;
    .globl vui
    .align 4
vui: .int 1234

# long vl = 5678;
    .globl vl
    .align 8
vl: .quad 5678

# unsigned long vlu = 5678;
    .globl vlu
    .align 8
vlu: .quad 5678

#--------------------------------------------------------------------------
    .text
#---------------------------------------------------------------------------

    .globl main
main:
    pushq   %rbp
    movq    %rsp, %rbp

    movb    $65, %al            # byte
    movw    $-1, %cx            # 2 bytes
    movl    $-44, %edx           # int
    movq    $0xBEBACAFE, %r8    # quad 
    # $r8,h para ver em hexadecimal no debuger

    movl $10, vi
    movl $20, vui
    movq $30, vl
    movq vl, %r8
    movq %r8, vlu
    
    movl    $0, %eax

    leave
    ret