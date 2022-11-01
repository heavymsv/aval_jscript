package dao;

import entidades.Usuario;
import utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {

    public static String salvar(Usuario usuario) {
        Connection con = Conexao.conectar();
        String sql = "insert into usuario(email,senha,nome,apelido) values (?,?,?,?);";
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
            return "Falha de Gravação no Banco";
        }

        return "Sucesso";
    }

    public static boolean autenticar(String usuario, String senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ? and senha = ?;";
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
        Usuario saida = null;
        String sql = "select * from usuario where email = ? ;";
        if (con == null) {

            return saida;

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
}
