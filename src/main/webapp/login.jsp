<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Blog: Posto a prova - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=BenchNine&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        .material-symbols-rounded {
          font-variation-settings:
          'FILL' 0,
          'wght' 600,
          'GRAD' 0,
          'opsz' 48
        }
        </style>
        <script>
            if(sessionStorage.getItem('usuario')){
                window.location.href = 'index.jsp';
            }
        </script>
</head>

<%
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String erro = "";
        if(email !=null && senha != null){
           if(!email.trim().isEmpty()&&!senha.trim().isEmpty()){
            if(DaoUsuario.autenticarUsuario(email, senha)){
                Usuario usuario = DaoUsuario.getUsuario(email);
                out.write("<script>sessionStorage.setItem('usuario','" + email + "')</script>");
                response.sendRedirect("index.jsp");
            }else{
                erro = ((DaoUsuario.verificarErro(email).equals("OK"))?"Senha Incorreta!!":DaoUsuario.verificarErro(email));
            }
           }
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
                        <li class="nav-item" id="link2">
                            <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item" id="link3">
                            <a class="nav-link" href="cadastro.jsp">Cadastro</a>
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

    <div class="container row h-75 align-items-center mx-auto">

        <div class="d-flex justify-content-center">
            <div class="card w-50">
                <div class="card-header">
                    <h3 class="text-center d-flex justify-content-center mb-1">Login <div class="my-1"><span class="material-symbols-rounded" class="my-1">
                        login
                        </span></div></h3>
                </div>
                <h4 class="text-center mt-2 justify-content-center" id="idErro"><%out.write(erro);%></h4>
                <div class="card-body w-100 d-flex justify-content-center">
                    <form action="login.jsp" method="get" class="row mb-5 justify-content-center" style="width: 80%;">

                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                                <label for="email">Email</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required minlength="8">
                                <label for="senha">Senha</label>
                            </div>
                            <button class="btn btn-primary mb-2 mt-3 w-50 btn-large">
                                <h5><strong>Logar</strong></h3>
                            </button>
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