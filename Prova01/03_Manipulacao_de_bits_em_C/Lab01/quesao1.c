#include <stdio.h>

int main(void) {
  unsigned int x = 0x87654321;
  unsigned int a, b;

  // (a) Manter o byte menos significativo de x e os outros bits em '0'
  // Em unsigned int = 0x87654321, o byte menos significativo é 0x21, em binario 00100001
  a = x & 0x000000FF;

  // (b) O byte mais significativo com todos os bits em '1' e manter os outros bytes com o mesmo valor dos bytes de x
  // Aqui o byte mais significativo é 0x87000000
  b = 0xFF000000 | (x & 0x00FFFFFF);

  printf("a = 0x%08X\n", a);
  printf("b = 0x%08X\n", b);

  return 0;
}

