<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>

<%
    out.write("<script>sessionStorage.removeItem('chave')</script>");
    response.sendRedirect("index.jsp");
%>