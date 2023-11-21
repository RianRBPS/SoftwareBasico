#include <stdio.h>

/*
O programa define uma função process que realiza uma operação em um caractere e retorna o resultado. O programa chama essa função com diferentes valores e imprime os resultados.

A função process recebe um caractere e retorna o complemento de dois desse caractere (ou seja, negação e adição de 1). O programa então imprime os resultados dessa operação com diferentes valores.
*/


int main() {

  int n = 64;

  printf("n = %d (0x%08X)\n", n, n);

  n = n << 1;

  printf("n = %d (0x%08X)\n", n, n);

  printf("---\n");

  n = 12;

  printf("n = %d (0x%08X)\n", n, n);

  n = n << 4;

  printf("n = %d (0x%08X)\n", n, n);

  return 0;

}
