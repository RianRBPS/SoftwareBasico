#include <stdio.h>

/*
No prog-02.c, x é do tipo int e y é int, então a comparação também é feita normalmente.
*/

int main (void) {

  int x = 0xffffffff;

  int y = 2;

  printf("x = %d, y = %d\n", x, y);

  printf("x é menor do que y? %s\n", (x<y) ? "sim" : "não");

  return 0;

}


