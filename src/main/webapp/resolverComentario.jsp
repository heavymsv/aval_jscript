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
    String idComentario = request.getParameter("idComentario");
    String aceito = request.getParameter("aceito");

    if(email == null){
        response.sendRedirect("index.jsp");
    }
    if(DaoUsuario.getUsuario(email).getNivel()<1){
        response.sendRedirect("index.jsp");
    }

    if(idComentario != null){
        if(aceito != null){
            DaoComentario.aprovarComentario(Integer.parseInt(idComentario),aceito.equals("1"));
        }
    }

    response.sendRedirect("revisarComentarios.jsp?usuario=" + email);


%>