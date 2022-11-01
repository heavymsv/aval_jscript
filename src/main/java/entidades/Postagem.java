package entidades;

import java.sql.Timestamp;

public class Postagem {
    private int id;
    private String titulo;
    private String texto;
    private Usuario usuario;
    private Timestamp data;

    public Postagem() {
    }

    public Postagem(String titulo, String texto, Usuario usuario) {
        this.titulo = titulo;
        this.texto = texto;
        this.usuario = usuario;
    }

    public Postagem(int id, String titulo, String texto, Usuario usuario, Timestamp data) {
        this.id = id;
        this.titulo = titulo;
        this.texto = texto;
        this.usuario = usuario;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
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
