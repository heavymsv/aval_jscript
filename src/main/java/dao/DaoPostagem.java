package dao;

import entidades.Postagem;
import utils.Conexao;

import java.sql.*;
import java.util.ArrayList;

public class DaoPostagem {

    public static int[] getTamanhoBanco(){
        Connection con = Conexao.conectar();
        String sql = "select max(id) from postagens;";
        String sql2 = "select min(id) from postagens;";
        if (con == null) {

            return new int[]{-1, -1};

        }
        PreparedStatement ps,ps2;

        try {

            ps = con.prepareStatement(sql);
            ps2 = con.prepareStatement(sql2);

            ResultSet rs = ps.executeQuery();
            ResultSet rs2 = ps2.executeQuery();

            rs.next();
            rs2.next();

            return new int[]{rs.getInt(1),rs2.getInt(1)};

        } catch (SQLException e) {
            return new int[]{-1, -1};
        }
    }

    public static String salvarPostagem(String titulo, String texto, String usuario){
        Postagem postagem = new Postagem(titulo, texto, DaoUsuario.getUsuario(usuario));
        Connection con = Conexao.conectar();
        String sql = "insert into postagens(titulo, texto, usuario_email) values (?,?,?);";
        if (con == null) {

            return "Problema de conexão ao Banco de Dados";

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,postagem.getTitulo());
            ps.setString(2,postagem.getTexto());
            ps.setString(3,postagem.getUsuario().getEmail());

            ps.execute();

        } catch (SQLException e) {
            return "Nenhum erro de postagem evidenciado claramente, tente novamente";
        }

        return "Postagem registrada com Sucesso!";
    }

    public static Postagem getPostagem(int id){
        Postagem postagem = new Postagem();
        Connection con = Conexao.conectar();
        String sql = "select * from postagens where id = ? ;";
        if (con == null) {

            return null;

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setInt(1,id);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                postagem = new Postagem(rs.getInt("id"),rs.getString("titulo"),rs.getString("texto")
                ,DaoUsuario.getUsuario(rs.getString("usuario_email")), rs.getTimestamp("data"));

                return postagem;
            }

        } catch (SQLException e) {
            return postagem;
        }

        return postagem;
    }

    public static ArrayList<Postagem> getListaPostagens(int index, int direcao){
        ArrayList<Postagem> postagens = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        String sql = "select count(id) from postagens;";
        if (con == null) {

            return postagens;

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            rs.next();

            int tamanhoBanco = rs.getInt(1);

            //return "terceira parada";

            if(index<0) {

                sql = "select * from postagens order by data desc;";
                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();

                while (rs.next()) {
                    postagens.add(new Postagem(rs.getInt("id"), rs.getString("titulo"), rs.getString("texto")
                            , DaoUsuario.getUsuario(rs.getString("usuario_email")), rs.getTimestamp("data")));


                }
                return postagens;
            }else if(direcao==1){

                sql = "select * from postagens where id > ? order by data desc limit 10;";
                ps = con.prepareStatement(sql);
                ps.setInt(1,index);

                rs = ps.executeQuery();

                while (rs.next()) {
                    postagens.add(new Postagem(rs.getInt("id"), rs.getString("titulo"), rs.getString("texto")
                            , DaoUsuario.getUsuario(rs.getString("usuario_email")), rs.getTimestamp("data")));
                }
                return postagens;
            }else if(!(index==0&&direcao==-1)){
                sql = "select * from postagens where id < ? order by data asc limit 10;";
                ps = con.prepareStatement(sql);
                ps.setInt(1,index);

                rs = ps.executeQuery();

                while (rs.next()) {
                    postagens.add(new Postagem(rs.getInt("id"), rs.getString("titulo"), rs.getString("texto")
                            , DaoUsuario.getUsuario(rs.getString("usuario_email")), rs.getTimestamp("data")));
                }

                ArrayList<Postagem> copia = new ArrayList<Postagem>(postagens);

                for(int i=1;i<=copia.size();i++){
                    postagens.set(postagens.size()-i,copia.get(i-1));
                }

                return postagens;
            }


        } catch (SQLException e) {
            return postagens;
        }
        return postagens;
    }

    public static void deletarPostagem(int id){
        Connection con = Conexao.conectar();
        String sql = "delete from comentarios where postagem_id = ? ;delete from postagens where id = ? ;";
        if (con == null) {

            return;

        }
        PreparedStatement ps;

        try {


                ps = con.prepareStatement(sql);
                ps.setInt(1,id);
                ps.setInt(2,id);

                ps.execute();


                return;



        } catch (SQLException e) {
            return;
        }
    }

    public static String modificarPostagem(Postagem postagem){
        Connection con = Conexao.conectar();
        String sql = "update postagens set titulo = ? , texto = ? where id = ?;";
        if (con == null) {

            return "Problema de conexão ao Banco de Dados";

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,postagem.getTitulo());
            ps.setString(2,postagem.getTexto());
            ps.setInt(3,postagem.getId());

            ps.execute();

        } catch (SQLException e) {
            return "Nenhum erro de alteração evidenciado claramente, tente novamente";
        }

        return "Postagem alterada com Sucesso!";
    }

}
