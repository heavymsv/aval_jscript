<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<%@ page import="utils.*"%>

<%

    String email = request.getParameter("usuario");
    if(email == null){
        response.sendRedirect("index.jsp");
    }
    if(DaoUsuario.getUsuario(email).getNivel()<1){
        response.sendRedirect("index.jsp");
    }

    String idString = request.getParameter("idPostagem");

    if(idString==null){
        response.sendRedirect("index.jsp");
    }

    int id = Integer.parseInt(idString);

    DaoPostagem.deletarPostagem(id);

    response.sendRedirect("index.jsp");

%>