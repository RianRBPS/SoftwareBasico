#include <stdio.h>


/*
O programa atribui um valor de signed char a uma variável unsigned int. Em C, a conversão de tipos pode ocorrer implicitamente, e dependendo do valor, o resultado pode ser interpretado de maneiras diferentes.

a) É possível interpretar os valores 0x000000FF e 0xFFFFFFFF como válidos para ui porque, ao converter um signed char negativo para unsigned int, o valor resultante será o complemento de dois do valor original. Portanto, ambos os valores podem ser representados como unsigned int.

b) Ao executar o programa, você verá que o valor impresso para ui é 0xFFFFFFFF, confirmando que o compilador segue a regra de converter valores negativos de signed char para unsigned int usando o 
*/

int main() {

  signed char sc = -1;

  unsigned int ui = sc;

  printf("0x%08X\n", ui);

  return 0;

}
