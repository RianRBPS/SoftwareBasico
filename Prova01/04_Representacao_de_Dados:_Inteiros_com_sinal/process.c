#include <stdio.h>

/*
O programa define uma função process que realiza uma operação em um caractere e retorna o resultado. O programa chama essa função com diferentes valores e imprime os resultados.

A função process recebe um caractere e retorna o complemento de dois desse caractere (ou seja, negação e adição de 1). O programa então imprime os resultados dessa operação com diferentes valores.
*/

char process(char x) {

  return ~x + 1;

}



int main(void) {

  printf("%d\n", process(1));

  printf("%d\n", process(-5));

  printf("%d\n", process(35));

  printf("%d\n", process(-42));

  printf("%d\n", process(127));

  printf("%d\n", process(-128));

  return 0;

}
