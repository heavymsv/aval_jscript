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

</head>

<body>
    <header class="sticky-top">
        <nav class="navbar navbar-expand-lg bg-secondary bg-gradient bg-opacity-50">
            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="conteudoNav">
                        <li class="nav-item" id="link1">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <script>
                            if (sessionStorage.getItem('usuario')) {
                                document.getElementById('conteudoNav').innerHTML +=
                                    '<li class="nav-item" id="link4">' +
                                    '<a class="nav-link" href="index.jsp">Olá <span id="apelidoUsuario">'+ JSON.parse(sessionStorage.getItem('usuario')).apelido +'</span></a>' +
                                    '</li>';
                                if (sessionStorage.getItem('moderador')) {
                                    document.getElementById('conteudoNav').innerHTML +=
                                        '<li class="nav-item" id="link5">' +
                                        '<a class="nav-link" href="moderador.jsp">Area do Moderador</a>' +
                                        '</li>';
                                }
                                document.getElementById('conteudoNav').innerHTML +=
                                    '<li class="nav-item" id = "link6" >' +
                                    '<a class="nav-link" href="logout.jsp">LogOut</a>' +
                                    '</li >';
                            } else {
                                document.getElementById('conteudoNav').innerHTML += '<li class="nav-item" id="link2">'+
                                        '<a class="nav-link" href = "login.jsp" >Login</a >'+
                                    '</li >'+
                                    '<li class="nav-item" id="link3">'+
                                        '<a class="nav-link" href="cadastro.jsp">Cadastro</a>'+
                                    '</li>'
                            }
                        </script>


                    </ul>
                    <div style="width:15px;">

                    </div>
                </div>

                <a class="navbar-brand" href="#" style="font-size:3rem;font-family: 'BenchNine', sans-serif;"><span
                        style="color:blueviolet">Wacky</span>Blog</a>
            </div>
        </nav>
    </header>

    <%
        String idString = request.getParameter("idPostagem");
        if(idString==null){
            response.sendRedirect("index.jsp");
        }
        int id = Integer.parseInt(idString);
        Postagem postagem = DaoPostagem.getPostagem(id);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm");
    %>

    <div class="container">
        <p style="font-size:300%;font-weight:600;" class="text-center mt-3"><%out.write(postagem.getTitulo());%></p>
        <br>
        <div class="row w-75" style="margin:auto">
            <p style="font-size:150%;color:grey;"><i>Escrito por <span id="apelidoAutor"><%out.write(postagem.getUsuario().getApelido());%></span> em <span id="horario"><%out.write(formatter.format(postagem.getData().toLocalDateTime()) + " às " + formatter2.format(postagem.getData().toLocalDateTime()));%></span><i></p>
        </div>

        <br>

        <div class="row overflow-auto" style="width:90%;margin:auto">
            <p style="font-size:120%"><%out.write(postagem.getTexto());%></p>
        </div>






    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>