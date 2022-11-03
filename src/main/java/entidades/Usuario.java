package entidades;

public class Usuario {
    private String email;
    private String senha;
    private int nivel;
    private String nome;
    private String apelido;

    public Usuario() {
    }

    public Usuario(String email) {
        this.email = email;
    }

    public Usuario(String email, String senha, int nivel, String nome, String apelido) {
        this.email = email;
        this.senha = senha;
        this.nivel = nivel;
        this.nome = nome;
        this.apelido = apelido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    @Override
    public String toString() {
        String saida = "{\"email\":\"" + getEmail() + "\",\"apelido\":\""+ getApelido() +"\" }";
        return saida;
    }

}
