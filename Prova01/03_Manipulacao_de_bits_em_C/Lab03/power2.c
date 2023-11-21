#include <stdio.h>

int power2(int n) {
    // Verifica se n é uma potência de 2
    return (n > 0) && ((n & (n - 1)) == 0);
}

int main() {
    int n;

    n = 10;
    if (power2(n))
        printf("%d é potência de 2\n", n);
    else
        printf("%d não é potência de 2\n", n);

    printf("---\n");

    n = 8;
    if (power2(n))
        printf("%d é potência de 2\n", n);
    else
        printf("%d não é potência de 2\n", n);

    return 0;
}
