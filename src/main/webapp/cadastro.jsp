<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@ page import="entidades.Produto" %>
<%//@ page import="dao.DaoProduto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.*" %>
<%@ page import="dao.*" %>
<%@ page import="utils.AutenticadorDeSenhas"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Blog: Posto a prova - Cadastro</title>
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
    <script>
        if(sessionStorage.getItem('usuario')){
            window.location.href = 'index.jsp';
        }
    </script>
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
                            <a class="nav-link active" aria-current="page" href="cadastro.jsp">Cadastro</a>
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

    <%
        String erro="";
        String email = request.getParameter("email");
        String apelido = request.getParameter("apelido");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha1");
        String repetirSenha = request.getParameter("senha2");




        if(email!=null){
            if(nome!=null){
                if(nome.trim().length()<3){
                    erro = "Campo Nome com menos que 3 caracteres!!";
                }else{
                    nome = nome.trim();
                    if(apelido!=null){
                        if(apelido.trim().length()<3){
                            erro = "Campo Apelido de Usuário com menos que 3 caracteres!!";
                        }else{
                        apelido = apelido.trim();
                            if(senha!=null){
                                if(senha.trim().length()<8){
                                    erro = "Campo Senha com menos que 8 caracteres!!";
                                }else{
                                    senha = senha.trim();
                                    erro = AutenticadorDeSenhas.verificar(senha);
                                    if(erro.equals("OK")){
                                        if(repetirSenha!=null){
                                            if(repetirSenha.trim().length()<8){
                                                erro = "Campo Senha com menos que 8 caracteres!!";
                                            }else{
                                                repetirSenha=repetirSenha.trim();
                                                if(senha.equals(repetirSenha)){
                                                    Usuario usuario = new Usuario(email,senha,0,nome,apelido);
                                                    erro = DaoUsuario.salvarUsuario(usuario);
                                                }else{
                                                    erro="Senhas são diferentes entre si!!";
                                                }
                                            }
                                        }else{
                                            erro = "Campo Repetir Senha com menos que 8 caracteres!!";
                                        }
                                    }

                                }
                            }
                        }
                    }
                }
            }
        }

    %>

    <div class="container row h-75 align-items-center mx-auto">
        <div class="d-flex justify-content-center">
            <div class="card w-75">
                <div class="card-header">
                    <h3 class="text-center d-flex justify-content-center mb-1">Cadastro<div class="my-1">
                        <span class="material-symbols-rounded" class="my-1">how_to_reg</span></div>
                    </h3>
                </div>
                <h4 class='text-center mt-2'><%out.write(erro);%></h4>
                <div class="card-body w-100 d-flex justify-content-center">

                    <form action="cadastro.jsp" method="" class="row mb-5 justify-content-center" style="width: 80%;">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" minlength="3"
                                required>
                            <label for="floatingInput">Nome</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="nome" name="apelido" placeholder="Apelido de Usuário" minlength="3"
                                required>
                            <label for="floatingInput">Apelido de Usuário</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email"
                                required>
                            <label for="floatingInput">Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" name="senha1"
                                placeholder="Senha" required minlength="8">
                            <label for="floatingPassword">Senha</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" name="senha2"
                                placeholder="Senha" required minlength="8">
                            <label for="floatingPassword">Repetir Senha</label>
                        </div>
                        <button class="btn btn-primary mb-2 mt-5 w-75 btn-large">
                            <h5><strong>Registrar</strong></h3>
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
