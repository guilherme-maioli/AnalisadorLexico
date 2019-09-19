package exemplolex;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

%%

%{

private void gravarLexema(String lexema, String token) throws IOException{
    try (FileWriter arq = new FileWriter("Lexemas.txt",true)) {
        PrintWriter gravarArq = new PrintWriter(arq);
        System.out.println("(" + lexema + ", " + token + ")");
        gravarArq.write("(" + lexema + ", " + token + ")");
        gravarArq.println();
    }
}

private void imprimir(String lexema, String token) {
    System.out.println("(" + lexema + ", " + token + ")");
}

%}

%class ExemploLex
%type void

INICIO = eep
INICIO_PROG = "{!"
FIM_PROG = "!}"
INICIO_FUNC = "["
FIM_FUNC = "]"
FIM_CMD = ":"
ATRIB = "=>"
LETRAS = [A-Za-z]
NUMEROS = [0-9]
TIPOS = INT|STR
ESPACO = [ ]
CARAC_STRING = \n|\t|\r|\\
CARAC_ESPECIAIS = "("|")"
VARIAVEIS_DEC = "#"{LETRAS}+
VARIAVEIS_USO = "~"{LETRAS}+
FUNCAO_DEC = "&"{LETRAS}+
FUNCAO_USO = "*"{LETRAS}+
PARAM_FUNC = "@"{LETRAS}+
STRING = {LETRAS}|{NUMEROS}
INTEIRO = {NUMEROS}+

%%

{INICIO}                     {gravarLexema(yytext(),"INICIO");                  }
{INICIO_PROG}                {gravarLexema(yytext(),"INICIO_PROG");                  }
{FIM_PROG}                   {gravarLexema(yytext(),"FIM_PROG");                  }
{FIM_CMD}                    {gravarLexema(yytext(),"FIM_CMD");                  }
"IF"|"if"|"WHILE"|"while"    {gravarLexema(yytext(),"Palavras reservadas");                  }
{INICIO_FUNC}                {gravarLexema(yytext(),"INICIO_FUNC");                  }
{FIM_FUNC}                   {gravarLexema(yytext(),"FIM_FUNC");                  }
{TIPOS}                      {gravarLexema(yytext(),"TIPOS");                  }
{VARIAVEIS_DEC}              {gravarLexema(yytext(), "VAR_DECLARACAO");         }
{FUNCAO_DEC}                 {gravarLexema(yytext(), "FUNCAO_DEC");    }
{VARIAVEIS_USO}              {gravarLexema(yytext(), "VAR_USO");         }
{FUNCAO_USO}                 {gravarLexema(yytext(), "FUNCAO_USO");     }     
{ESPACO}                     {gravarLexema(yytext(), "ESPACO");     }
{LETRAS}                     {gravarLexema(yytext(), "LETRAS");     }
{PARAM_FUNC}+{ESPACO}*       {gravarLexema(yytext(),"PARAM");                  }
"%"({STRING}|{ESPACO})+"%"   {gravarLexema(yytext(),"STRING");                  }
{NUMEROS}+                   {gravarLexema(yytext(),"NUMEROS");                  }
";"                          {gravarLexema(yytext(),"SEPARADOR PARAM");                  }
{ATRIB}                      {gravarLexema(yytext(),"ATRIBUICAO");                  }
{CARAC_STRING}*              {gravarLexema(yytext(),"CARAC_STRING");                  }
{CARAC_ESPECIAIS}            {gravarLexema(yytext(),"Paranteses");                  }
.                            {gravarLexema(yytext(), "Caractere Inválido.");     }