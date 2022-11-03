package dao;

import entidades.Comentario;
import entidades.Postagem;
import entidades.Usuario;
import utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoComentario {

    public enum metodoBusca{
        TODOS,
        SOMENTE_N_APROVADOS,
        SOMENTE_APROVADOS
    }

    public static String salvarComentario(Comentario comentario) {
        Connection con = Conexao.conectar();
        String sql = "insert into comentarios(texto, aprovado, postagem_id, usuario_email) values (?,?,?,?);";
        if (con == null) {

            return "Problema de conexão ao Banco de Dados";

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,comentario.getTexto());
            ps.setInt(2,comentario.getAprovado());
            ps.setInt(3,comentario.getPostagem().getId());
            ps.setString(4,comentario.getUsuario().getEmail());
            ps.execute();

        } catch (SQLException e) {
            return "Nenhum erro evidenciado claramente, tente novamente";
        }

        return (comentario.getAprovado()==1)?"Comentário registrado com Sucesso!":"Comentário registrado com Sucesso! Aguardando Aprovação de um Moderador!";
    }

    public static ArrayList<Comentario> getComentarios(metodoBusca valor){
        ArrayList<Comentario> saida = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        String sql;
        switch(valor){
            case SOMENTE_APROVADOS:
                sql = "select * from comentarios where aprovado = 1 order by data asc;";
                break;
            case SOMENTE_N_APROVADOS:
                sql = "select * from comentarios where aprovado = 0 order by data asc;";
                break;
            default:
                sql = "select * from comentarios order by data asc;";
        }

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                saida.add(new Comentario(
                        rs.getInt("id"),
                        rs.getString("texto"),
                        rs.getInt("aprovado"),
                        DaoPostagem.getPostagem(rs.getInt("postagem_id")),
                        DaoUsuario.getUsuario(rs.getString("usuario_email")),
                        rs.getTimestamp("data")
                ));
            }

            return saida;

        } catch (SQLException e) {
            return saida;
        }

    }

    public static ArrayList<Comentario> getComentarios(Postagem postagem){
        ArrayList<Comentario> saida = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        String sql = "Select * from comentarios where postagem_id = ? and aprovado = 1;";

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setInt(1,postagem.getId());

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                saida.add(new Comentario(
                        rs.getInt("id"),
                        rs.getString("texto"),
                        rs.getInt("aprovado"),
                        DaoPostagem.getPostagem(rs.getInt("postagem_id")),
                        DaoUsuario.getUsuario(rs.getString("usuario_email")),
                        rs.getTimestamp("data")
                ));
            }

            return saida;

        } catch (SQLException e) {
            return saida;
        }

    }

    public static void aprovarComentario(int id, boolean aprovar){
        Connection con = Conexao.conectar();
        String sql;

        PreparedStatement ps;

        if(aprovar){
            sql = "update comentarios set aprovado = 1 where id = ? ";
        }else{
            sql = "delete from comentarios where id = ? ";
        }

        try {

            ps = con.prepareStatement(sql);
            ps.setInt(1,id);

            ps.execute();



            return ;

        } catch (SQLException e) {
            return ;
        }

    }

}
