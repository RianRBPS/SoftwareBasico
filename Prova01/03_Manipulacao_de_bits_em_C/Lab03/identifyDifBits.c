#include <stdio.h>

int main() {
    unsigned int x = 263;
    unsigned int y = 3;

    // x = 263 = 0000 0000 0000 0000 0000 1000 0000 0111
    // y =   3 = 0000 0000 0000 0000 0000 0000 0000 0011

    printf("Bits diferentes entre %u e %u:\n", x, y);

    for (int i = 0; i < sizeof(unsigned int) * 8; i++) {
        int bit_x = (x >> i) & 1;
        int bit_y = (y >> i) & 1;

        if (bit_x != bit_y)
            printf("Bit %d é diferente\n", i);
    }

    return 0;
}
