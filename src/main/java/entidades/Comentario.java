package entidades;

import java.sql.Timestamp;

public class Comentario {
    private int id;
    private String texto;
    private int aprovado;
    private Postagem postagem;
    private Usuario usuario;
    private Timestamp data;

    public Comentario() {
    }

    public Comentario(int id, String texto, int aprovado, Postagem postagem, Usuario usuario, Timestamp data) {
        this.id = id;
        this.texto = texto;
        this.aprovado = aprovado;
        this.postagem = postagem;
        this.usuario = usuario;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getAprovado() {
        return aprovado;
    }

    public void setAprovado(int aprovado) {
        this.aprovado = aprovado;
    }

    public Postagem getPostagem() {
        return postagem;
    }

    public void setPostagem(Postagem postagem) {
        this.postagem = postagem;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Timestamp getData() {
        return data;
    }

    public void setData(Timestamp data) {
        this.data = data;
    }
}
