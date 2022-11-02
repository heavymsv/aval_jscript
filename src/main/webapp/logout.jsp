<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>

<%
    out.write("<script>sessionStorage.removeItem('usuario');window.location.href = 'index.jsp';</script>");
%>