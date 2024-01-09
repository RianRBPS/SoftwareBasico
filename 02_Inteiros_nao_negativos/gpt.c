#define getfrac(x) ((x) & 0x7fffff)

typedef union{
    float f;
    unsigned int i;
} U;

void show() {
    U u1, u2;

    u1.f = 32.0;
    u2.f = 40.250;

    unsigned int f = getfrac(u2.i);

    printf("Resposta = %X\n", (u1.i >> 9) ^ f);
}