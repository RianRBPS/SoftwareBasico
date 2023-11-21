#include <stdio.h>

unsigned int convertB2L(unsigned int x) {
  return ((x & 0xFF000000) >> 24) | ((x & 0x00FF0000) >> 8) | ((x & 0x0000FF00) << 8) | ((x & 0x000000FF) << 24);
}

int main() {
  unsigned int b = 0x12AB34CD;
  unsigned int l = convertB2L(b);

  printf("b = 0x%08X\n", b);
  printf("l = 0x%08X\n", l);

  return 0;
}
