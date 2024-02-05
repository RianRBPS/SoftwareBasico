    .section .data
helloMessage:
    .string "Hello, World!\n"

    .section .text
    .global _start

_start:
    # escreve a mensagem na saída padrão
    mov $4, %eax    # syscall number for sys_write
    mov $1, %ebx    # file descriptor 1 is stdout
    mov $helloMessage, %ecx # pointer to the message
    mov $14, %edx   # message length, including '\n'
    int $0x80       # call kernel

    # termina o programa
    mov $1, %eax    # syscall number for sys_exit
    xor %ebx, %ebx  # status 0
    int $0x80       # call kernel
