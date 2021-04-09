/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author abubacar-dev
 */
public class main {
     public static void main(String[] args) {
        String rota = "/home/abubacar-dev/NetBeansProjects/Analisador-LexicoJava/src/codigo/RegrasLex.flex";
        AnaLex(rota);
    }   
    public static void  AnaLex(String rota){
        File arquivo = new File(rota);
        JFlex.Main.generate(arquivo);
    }
}
