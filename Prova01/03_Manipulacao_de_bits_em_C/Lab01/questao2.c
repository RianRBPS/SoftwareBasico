#include <stdio.h>

int odd_ones(unsigned int x) {
  int count = 0;

  while (x != 0) {
    count += x & 1;
    x >>= 1;
  }

  return count & 1; // Retorna 1 se for ímpar, 0 se for par
}

int main() {
  unsigned int v;

  v = 0x01010101;
  printf("%X tem número %s de bits\n", v, odd_ones(v) ? "ímpar" : "par");

  v = 0x01030101;
  printf("%X tem número %s de bits\n", v, odd_ones(v) ? "ímpar" : "par");

  return 0;
}

