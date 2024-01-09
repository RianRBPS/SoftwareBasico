1. Sejam os dois arquivos em C abaixo:

main.c

#include <stdio.h>



// Indica que as variáveis existem e são definidas em outro lugar

extern char c;

extern int i;

extern int j;

extern long l;

extern unsigned short us;

extern unsigned int ui;

extern unsigned long ul;



void aux();



int main()

{

  aux();

  printf("c  = %d\n", c);

  printf("i  = %d\n", i);

  printf("j  = %d\n", j);

  printf("l  = %ld\n", l);

  printf("us = %u\n", us);

  printf("ui = %u\n", ui);

  printf("lu = %lu\n", ul);

  return 0;

}

aux.c

// Cria e inicializa as variáveis

char c = -20;

int i = -256;

int j = 512;

long l = 128;

unsigned short us = 111;

unsigned int ui = 1024;

unsigned long ul = 2048;



void aux()

{

  // Atribuições simples

  j = 68000;

  l = 4096;

  i = j;



  // Expressões

  j = 10 + i - 5;

  i = (i * 2) - (j + 5);



  // Casts

  ui = i;

  j = c;

  ul = ui;

  us = ul;

  c = i + j;



  // Ponteiros

  long *ptr;        // Utilize um registrador para representar 'ptr'

  ptr = &l;

  *ptr = 128;



  int *iptr;        // Utilize um registrador para representar 'iptr'

  iptr = &i;

  j = j + *iptr;

}

Compile e teste o programa:

gcc -no-pie -o main main.c aux.c

Agora, traduza o arquivo “aux.c” para Assemly (arquivo “aux.S”) utilizando o template abaixo. A tradução deve ser o mais literal possível, seguindo as regras dadas nas aulas, ou seja, não é para ficar interpretando e otimizando o código.

aux.S

.data





.text



.globl aux

aux:

    pushq %rbp

    movq  %rsp, %rbp



    # Se necessário, usar apenas os registradores (ou suas variações) abaixo:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11



    # Seu código aqui...



    leave

    ret

Compile e teste o programa:

gcc -no-pie -o main-asm main.c aux.S

Dica: 

Comece traduzindo todas as variáveis de aux() de C para o arquivo Assembly

Comente todos as linhas da função aux() de C

Descomente uma linha de aux() de C e traduza essa linha para Assembly

Compile o código somente C (main) e depois compile o outro usando o Assembly (main-asm)

Rode os dois programas e veja se os resultados são os mesmos
