#include <ctype.h>

#include <stdio.h>


/*
Essa função converte uma string contendo um número em formato de caracteres (como "123" ou "-456") 
para um valor numérico inteiro em linguagem C. Vamos analisar o código linha por linha:

*/
int string2num(char *s) {

  int a = 0;

  /*
  Inicia um loop for que percorre cada caractere da string. 
  O loop continua enquanto o valor apontado por s não é nulo (*s avalia como verdadeiro). 
  s++ incrementa o ponteiro s para apontar para o próximo caractere na próxima iteração do loop.*/
  // Equivalente a while(s* != "\0"){ s++ }
  for ( ; *s; s++)

    //printf("Valor de *s: %d\n", &*s);
    //printf("Valor de a: %d\n", &a);
    //int dif = *s - '0';
    //printf("Valor de (*s- '0'): %d\n", &dif);
    a = a*10 + (*s - '0');

  return a;

}



int main () {

  printf("==> %d\n", string2num("1234"));

  printf("==> %d\n", string2num("1234") + 1);

  printf("==> %d\n", string2num("1234") + string2num("1"));

  return 0;

}
