
package exemplolex;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;


public class LinguagemTeste {
    public static void main(String[] args) throws IOException {
        try {
            try (FileWriter arq = new FileWriter("Lexemas.txt")) {
                PrintWriter gravarArq = new PrintWriter(arq);
                gravarArq.write("(Lexema, Token)");
                gravarArq.println();
                gravarArq.println();
            }
            BufferedReader arq = new BufferedReader(new FileReader("teste.eep"));
            while(arq.ready()){
                String linha = arq.readLine();
                ExemploLex lexical = new ExemploLex(new StringReader(linha));
                lexical.yylex();
            }
            arq.close();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        
        /*String expr = "eep &func ~x #ra INT";
        
        ExemploLex lexical = new ExemploLex(new StringReader(expr));
        lexical.yylex();*/
    }
}
