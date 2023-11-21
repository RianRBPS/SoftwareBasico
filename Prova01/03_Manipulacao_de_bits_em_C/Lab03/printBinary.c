#include <stdio.h>

void printBinary(unsigned int n) {
    int size = sizeof(unsigned int) * 8;
    
    for (int i = size - 1; i >= 0; i--) {
        int bit = (n >> i) & 1;
        printf("%d", bit);
    }

    printf("\n");
}

int main() {
    unsigned int n = 837263;

    // Imprime a representação binária de 'n'
    printf("Binary representation of %u: ", n);
    printBinary(n);

    return 0;
}
