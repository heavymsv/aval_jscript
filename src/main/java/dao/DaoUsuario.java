package dao;

import entidades.Usuario;
import utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {

    public static String salvarUsuario(Usuario usuario) {
        Connection con = Conexao.conectar();
        String sql = "insert into usuarios(email,senha,nome,apelido) values (?,?,?,?);";
        if (con == null) {

            return "Problema de conexão ao Banco de Dados";

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario.getEmail());
            ps.setString(2,usuario.getSenha());
            ps.setString(3,usuario.getNome());
            ps.setString(4,usuario.getApelido());
            ps.execute();

        } catch (SQLException e) {
            String retorno = verificarErro(usuario);
            return retorno.equals("OK")?"Nenhum erro evidenciado claramente, tente novamente":retorno;
        }

        return "Usuário registrado com Sucesso!";
    }

    public static boolean autenticarUsuario(String usuario, String senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuarios where email = ? and senha = ?;";
        if (con == null) {

            return false;

        }

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario);
            ps.setString(2,senha);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                return true;
            }

        } catch (SQLException e) {
            return false;
        }

        return false;
    }

    public static Usuario getUsuario(String usuario){
        Usuario busca = fullGetUsuario(usuario);
        return new Usuario(busca.getEmail(),"",busca.getNivel(), busca.getNome(), busca.getApelido());
    }

    public static Usuario fullGetUsuario(String usuario){
        Connection con = Conexao.conectar();
        Usuario saida = new Usuario();
        String sql = "select * from usuarios where email = ? ;";
        if (con == null) {

            return null;

        }

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                saida.setEmail(rs.getString("email"));
                saida.setNome(rs.getString("nome"));
                saida.setApelido(rs.getString("apelido"));
                saida.setNivel(rs.getInt("nivel"));
                saida.setSenha(rs.getString("senha"));
                return saida;
            }

        } catch (SQLException e) {
            return saida;
        }

        return saida;
    }

    public static void deletarUsuario(String email){

        Connection con = Conexao.conectar();
        String sql = "delete from comentarios where usuario_email = ? ;delete from postagens where usuario_email = ? ;delete from usuarios where email = ? ;";
        if (con == null) {
            System.out.println("Falha de conexão");
            return;

        }

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,email);
            ps.setString(3,email);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                System.out.println(rs.toString());
            }

        } catch (SQLException e) {
            System.out.println("Erro de deleção");
        }

    }

    public static String modificarUsuario(Usuario usuario, String email){
        Connection con = Conexao.conectar();
        String sql = "insert into usuarios(email,senha,nome,apelido) values (?,?,?,?) where email = ?;";
        if (con == null) {

            return "Problema de conexão ao Banco de Dados";

        }
        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario.getEmail());
            ps.setString(2,usuario.getSenha());
            ps.setString(3,usuario.getNome());
            ps.setString(4,usuario.getApelido());
            ps.setString(5,email);
            ps.execute();

        } catch (SQLException e) {
            String retorno = verificarErro(usuario);
            if(retorno.equals("Email já em uso!!")&&
            !usuario.getEmail().equals(email)){
                return retorno;
            }
            usuario.setEmail(email);
            retorno = verificarErro(usuario);
            if(retorno.equals("Email já em uso!!")){
                return "Nenhum erro Detectado, Tente novamente maios tarde!!";
            }
            return retorno;
        }

        return "Sucesso";
    }

    public static String verificarErro(Usuario usuario){
        Connection con = Conexao.conectar();
        String sql = "select * from usuarios where email = ? ;";
        if (con == null) {

            return "Erro de conexão ao Banco de dados";

        }

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario.getEmail());
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                return "Email já em uso!!";
            }

        } catch (SQLException e) {
            return "Erro de contato com o Banco de Dados!";
        }

        sql = "select * from usuarios where apelido = ? ;";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario.getApelido());
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                return "Nome de Usuário já em uso";
            }

        } catch (SQLException e) {
            return "Erro de contato com o Banco de Dados!";
        }

        return "OK";
    }

    public static String verificarErro(String usuario){
        Connection con = Conexao.conectar();
        Usuario saida = null;
        String sql = "select * from usuarios where email = ? ;";
        if (con == null) {

            return "Erro de conexão ao Banco de dados";

        }

        PreparedStatement ps;

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1,usuario);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                return "OK";
            }

        } catch (SQLException e) {
            return "Erro de conexão ao Banco de Dados!";
        }

        return "Email não cadastrado!!";
    }
}
