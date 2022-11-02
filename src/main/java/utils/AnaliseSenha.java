package utils;

import java.util.regex.Pattern;

public class AnaliseSenha {
    public Pattern padrao;
    public String erro;

    AnaliseSenha(Pattern padrao, String erro){
        this.padrao = padrao;
        this.erro = erro;
    }
}
