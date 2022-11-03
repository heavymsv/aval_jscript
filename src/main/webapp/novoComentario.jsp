<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<%@ page import="utils.*"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%
    String email = request.getParameter("usuario");
    String texto = request.getParameter("texto");
    String idPostagem = request.getParameter("idPostagem");

    if(email == null){
        response.sendRedirect("index.jsp");
    }

    if(idPostagem == null){
            response.sendRedirect("index.jsp");
    }

    if(texto == null){
        response.sendRedirect("postagem.jsp?idPostagem="+idPostagem);
    }

    Usuario usuario = DaoUsuario.getUsuario(email);
    Postagem postagem = DaoPostagem.getPostagem(Integer.parseInt(idPostagem));

    if(DaoUsuario.getUsuario(email).getNivel()>0){
        out.write(DaoComentario.salvarComentario(new Comentario( texto, 1, postagem, usuario)));
        response.sendRedirect("postagem.jsp?idPostagem="+idPostagem);
    }
    else{
        out.write(DaoComentario.salvarComentario(new Comentario( texto, 0, postagem, usuario)));
        response.sendRedirect("postagem.jsp?idPostagem="+idPostagem);
    }
%>