<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<%@ page import="utils.*"%>

<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Blog: Posto a prova</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=BenchNine&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        .material-symbols-rounded {
          font-variation-settings:
          'FILL' 1,
          'wght' 600,
          'GRAD' 0,
          'opsz' 48
        }
    </style>

</head>

<%
    String email = request.getParameter("usuario");
    if(email == null){
        response.sendRedirect("index.jsp");
    }
    if(DaoUsuario.getUsuario(email).getNivel()<1){
        response.sendRedirect("index.jsp");
    }
%>

<body style="height:95vh">

    <header class="sticky-top">
        <nav class="navbar navbar-expand-lg bg-secondary bg-gradient bg-opacity-50">
            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item" id="link1">
                            <a class="nav-link " href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item" id="link4">
                            <a class="nav-link" href="index.jsp">Ol?? <span id="apelidoUsuario"><%out.write(DaoUsuario.getUsuario(email).getApelido());%></span></a>
                        </li>
                        <li class="nav-item" id="link5">
                            <form action='moderador.jsp' method='post'><input name="usuario" type='hidden' value='<%out.write(email);%>'><button class="btn btn-link nav-link active" aria-current="page">Area do Moderador</a>
                        </li>
                        <li class="nav-item" id="link6">
                            <a class="nav-link" href="logout.jsp">LogOut</a>
                        </li>
                    </ul>
                    <div style="width:15px;">

                    </div>
                </div>

                <a class="navbar-brand" href="#" style="font-size:3rem;font-family: 'BenchNine', sans-serif;"><span
                        style="color:blueviolet">Wacky</span>Blog</a>
            </div>
        </nav>
    </header>
    <form action=""></form>

    <div class="container h-100">
        <h1 class="text-center mt-3">Modificar Postagem</h1>

        <div class="d-flex justify-content-center my-4 mx-2 ">
            <div class="table-responsive-sm overflow-auto">
                <table class="table table-secondary table-striped-columns">
                    <thead>
                        <tr>
                          <th scope="col">Autor</th>
                          <th scope="col">Data</th>
                          <th scope="col" colspan="2">Titulo</th>
                        </tr>
                      </thead>
                      <tbody>
                        <%
                            ArrayList<Postagem> postagens = DaoPostagem.getListaPostagens(-1,0);
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm");

                            for(Postagem postagem:postagens){

                                out.write("<tr>"+
                                  "<th scope='row'>" + postagem.getUsuario().getApelido() + "</th>"+
                                  "<td>" + formatter.format(postagem.getData().toLocalDateTime()) + " ??s " + formatter2.format(postagem.getData().toLocalDateTime()) + "</td>"+
                                  "<td colspan='2' class='text-wrap'><form action='editarPostagem.jsp'><input type='hidden' name='idPostagem' value='" + postagem.getId() + "'><input type='hidden' name='usuario' value='" + email + "'><button class='btn btn-link'>" + postagem.getTitulo() + "</button></form></td>"+
                                "</tr>");

                            }
                        %>

                      </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function resetarForm(){
            var doc = document.getElementsByTagName('form')
            console.log(doc);
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>


