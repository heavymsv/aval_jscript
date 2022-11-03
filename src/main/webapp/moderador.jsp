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
    <title>E-Blog: Posto a prova - Bem vindo Moderador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=BenchNine&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

<body class="vh-100">
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
    <div class="accordion container my-5" id="accordionExample">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              Postagens
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <form></form>

                 <form action = "novaPostagem.jsp" method="POST">
                        <input type="hidden" value='<%out.write(email);%>' name="usuario">
                        <button class="btn btn-primary">Criar Nova</button>
                 </form>

                <form action="escolherPostagem.jsp" method="POST">
                    <input type="hidden" value='<%out.write(email);%>' name="usuario">
                    <button class="btn btn-primary">Gerenciar</button>
                </form>

              </div>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              Comentários
            </button>
          </h2>
          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <form action="revisarComentarios.jsp" method="POST"><input type="hidden" value='<%out.write(email);%>' name="usuario"><button class="btn btn-success">Revisar Comentários</button></form>
              </div>
            </div>
          </div>
        </div>
      </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>