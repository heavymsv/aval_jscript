<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<%@ page import="utils.*"%>

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

<%
    String email = request.getParameter("usuario");
    String titulo = request.getParameter("titulo");
    String texto = request.getParameter("texto");
    String erro = "";

    if(email == null){
        response.sendRedirect("index.jsp");
    }
    if(DaoUsuario.getUsuario(email).getNivel()<1){
        response.sendRedirect("index.jsp");
    }

    if(titulo != null){
        if(titulo.trim().length() < 3){
            erro = "o Tamanho Mínimo do Titulo é de 3 Caracteres!!";
        }else{
            if(texto != null){
                if(texto.trim().length() < 10){
                    erro = "o Tamanho Mínimo do Post é de 10 Caracteres!!";
                }else{
                    erro = DaoPostagem.salvarPostagem(titulo, texto, email);
                }
            }
        }
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
                            <a class="nav-link" href="index.jsp">Olá <span id="apelidoUsuario"><%out.write(DaoUsuario.getUsuario(email).getApelido());%></span></a>
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
    <div class='row my-2'>
        <h4 class='text-center' style='margin:auto;'><%out.write(erro);%></h4>
    </div>
    <form></form>
    <div class="container h-100">
        <h1 class="text-center mt-3">Postagem</h1>

        <div class="d-flex justify-content-center my-4 mx-2 ">
            <div class="card w-100">
                <div class="card-header">
                    <h4>Criar Nova Postagem</h4>
                </div>

                <div class="card-body  overflow-auto">
                    <form action="novaPostagem.jsp" method = "POST" id="formularioPostagem" >
                        <input type = 'hidden' value ='<% out.write(email); %>' name='usuario'>
                        <div class="form-floating mb-3">
                            <input type="text" name="titulo" class="form-control form-control-lg" id="floatingInput" placeholder="Titulo" required minlength="3">
                            <label for="floatingInput">Titulo</label>
                        </div>
                        <div class="form-floating mb-3" style="height:50vh">
                            <textarea name="texto" form="formularioPostagem" class="form-control h-100" id="floatingText" placeholder="name@example.com" required minlength="10"></textarea>
                            <label for="floatingText">Postagem</label>
                        </div>

                        <div class="d-flex justify-content-between mx-2 mb-2">
                            <button class="btn big-btn me-1 btn-secondary" id="botaoAnterior">
                            <h5 class="my-1">Salvar</h5>
                            <button type="button" onclick="document.getElementById('formularioPostagem').reset()" class="btn big-btn btn-primary" id="botaoAnterior">
                            <h5 class="my-1">Limpar Tudo</h5>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>