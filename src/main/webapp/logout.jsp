<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<%@ page import="utils.*"%>
<%
    out.write("<script>sessionStorage.removeItem('usuario');sessionStorage.removeItem('moderador');window.location.href = 'index.jsp';</script>");
%>