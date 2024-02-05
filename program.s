 .data
nums: .int 10, -21, -30, 45


 .text
 .globl main
main:
   movl $0, %ebx       # i
   movq $nums, %r12    /* p */
 .L1:
   cmpl %4, %ebx       # if (i == 4)
   je .L2              # goto .L2
   movl (%r12), &eax   # eax = *p
   addl $1, %ebx       # i++
   addq $4, %r12       # p++
   jmp .L1
 .L2:
   ret