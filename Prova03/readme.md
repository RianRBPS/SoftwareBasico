Mapeamento de Estruturas

Observações:
Assembly AT&T o mais literal possível
Utilize a Sintaxe GNU
Tomar cuidado para que os seus comentários utilizando "#" não sejam interpretados por uma diretiva do pré-processador pelo compilador GCC.
Lembre-se que a sintaxe %rip+label não é válida no GNU Assembler (GAS). Em vez disso você deve simplesmente usar o nome da label (variável) com o deslocamento necessário, sem a necessidade de referenciar %rip diretamente para acessos a dados globais ou estáticos.
Se atente para não gerar um Segmentation fault(core dumped) 

Mapeamento de Estrutura
lab1 até lab3
gcc -no-pie -o <programa> <programa>.s
