#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n) {
    return (x << n) | (x >> (8 - n));
}

int main() {
    unsigned char value = 0x61;

    int shift_values[] = {1, 2, 7};

    for (int i = 0; i < sizeof(shift_values) / sizeof(shift_values[0]); i++) {
        unsigned char result = rotate_left(value, shift_values[i]);
        printf("Rotate left by %d bits: 0x%02X\n", shift_values[i], result);
    }

    return 0;
}
