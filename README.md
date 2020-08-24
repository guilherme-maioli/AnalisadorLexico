# Analisador Léxico
Trabalho de faculdade proposto pela disciplina de compiladores realizado no primeiro semestre de 2019. <br>
Dado uma seguinte linguagem identificar os tokens e os lexemas.

-----------------------------------------------------------

# Especificações
### Linguagem exemplo
![Image 1](/image/image1.png)

As seguintes convenções serão utilizadas: <br>
- A palavra reservada eep identifica o início do programa <br>
- O bloco de início e fim do programa deve ser identificado através dos sinais {! e !} <br>
- O sinal de : determina o término de um comando <br>
- Variáveis devem ser declaradas com o sinal #, seguido do nome composto por um conjunto de letras e seu respectivo tipo: INT ou STR <br>
- A declaração de funções deve ser precedida pelo sinal & seguido por um conjunto de letras <br>
- Os parâmetros das funções são identificados pelo caractere @ seguido por um conjunto de letras <br>
- Os blocos de início e fim de uma função são identificados por [ e ] <br>
- Operações de atribuição são identificadas por => <br> 
- Strings devem estar entre % <br>
- Para que as variáveis sejam utilizadas, devemos colocar o sinal ~ na frente do nome das mesmas <br>
- As funções são chamadas colocando o sinal * na frente do nome da função <br> 
- Nas funções, os parâmetros são separados por ; (declaração e chamada) <br>
- Considere o conjunto de palavras reservadas como: {eep, INT, STR, if, while} <br>
Escrever um analisador léxico utilizando o JFlex visto em sala de aula para ler um arquivo fonte da linguagem acima (.eep) e gerar um arquivo no formato (lexema, token). <br>
Você deve criar tokens para cada uma das convenções acima. <br>
Utilize o Netbeans. <br>
