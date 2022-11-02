package utils;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AutenticadorDeSenhas {




    public static String verificar(String senha){
        ArrayList<AnaliseSenha> patterns = new ArrayList<AnaliseSenha>();
        patterns.add(new AnaliseSenha(Pattern.compile("[a-z]"),"A Senha não contém Letras Minúsculas!"));
        patterns.add(new AnaliseSenha(Pattern.compile("[A-Z]"),"A Senha não contém Letras Maiúsculas!"));
        patterns.add(new AnaliseSenha(Pattern.compile("[0-9]"),"A Senha não contém Números!"));
        patterns.add(new AnaliseSenha(Pattern.compile("[!@#$%¨&*+-]"),"A Senha não contém Letras Maiúsculas!"));

        Matcher matcher;

        for(AnaliseSenha as: patterns){
            matcher = as.padrao.matcher(senha);
            if(!matcher.find()){
                return as.erro;
            }
        }

        return "OK";
    }



}
