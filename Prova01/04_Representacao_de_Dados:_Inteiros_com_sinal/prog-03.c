#include <stdio.h>

/*
No prog-03.c, x é do tipo int e y é unsigned int. Nesse caso, x será interpretado como um número positivo durante a comparação, levando a resultados diferentes se x for negativo.
*/

int main (void) {

  int x = 0xffffffff;

  unsigned int y = 2;

  printf("x = %d, y = %u\n", x, y);

  printf("x é menor do que y? %s\n", (x<y) ? "sim" : "não");

  return 0;

}
