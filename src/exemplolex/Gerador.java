package exemplolex;

import java.io.File;
import java.nio.file.Paths;

public class Gerador {

    public static void main(String[] args) {
        
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/exemplolex/";
        
        String file = rootPath + subPath + "linguagem.lex";
        
        File codigoFonte = new File(file);
        
        jflex.Main.generate(codigoFonte);
        
        
    }

    
}
