#include <stdio.h>

int match(unsigned long x, unsigned short y) {
    // Máscara para isolar os últimos 16 bits de x
    unsigned long mask = 0xFFFF;
    
    // Verifica se os últimos 16 bits de x são iguais a y
    return (x & mask) == y;
}

int main(void) {
    unsigned long x = 28736452;
    unsigned short y = 21;

    printf("X: 0x%lX\n", x);
    printf("Y: 0x%X\n", y);

    if (match(x, y))
        printf("Y está contido em X\n");
    else
        printf("Y não está contido em X\n");

    return 0;
}
