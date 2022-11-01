<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>
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
                        <li class="nav-item" id="link2">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item" id="link3">
                            <a class="nav-link" href="cadastro.jsp">Cadastro</a>
                        </li>
                        <li class="nav-item" id="link4">
                            <a class="nav-link" href="index.jsp">Olá <span id="apelidoUsuario"></span></a>
                        </li>
                        <li class="nav-item" id="link5">
                            <a class="nav-link active" aria-current="page" href="moderador.jsp">Area do Moderador</a>
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

    <div class="container my-3 h-75">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="postagem-tab" data-bs-toggle="tab" data-bs-target="#postagem-tab-pane" type="button" role="tab" aria-controls="postagem-tab-pane" aria-selected="true">Postagens</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Comentarios</button>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active border-bottom border-start border-end" id="postagem-tab-pane" role="tabpanel" aria-labelledby="postagem-tab" tabindex="0" style="height:75vh">
                <ul class="nav nav-pills nav-fill mx-2 pt-3 mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                      <button class="nav-link active" id="pills-nova-tab" data-bs-toggle="pill" data-bs-target="#pills-nova" type="button" role="tab" aria-controls="pills-nova" aria-selected="true">Nova</button>
                    </li>
                    <li class="nav-item" role="presentation">
                      <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Modificar/Deletar</button>
                    </li>
                  </ul>
                  <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-nova" role="tabpanel" aria-labelledby="pills-nova-tab" tabindex="0">...</div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
                  </div>
            </div>
            <div class="tab-pane fade border-bottom border-start border-end" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0" style="height:75vh">...</div>
          </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>