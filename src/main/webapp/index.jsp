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
                                    '<a class="nav-link" href="index.jsp">Olá <span id = "apelidoUsuario"></span></a>' +
                                    '</li>';
                                document.getElementById('apelidoUsuario').innerHTML = (JSON.parse(sessionStorage.getItem('usuario'))).apelido;
                                if (sessionStorage.getItem('moderador')) {
                                    document.getElementById('conteudoNav').innerHTML +=
                                        '<li class="nav-item" id="link5">' +
                                        '<form action = "moderador.jsp" method = "post"><input name="usuario" type="hidden" value="' + (JSON.parse(sessionStorage.getItem('usuario'))).email + '" id="areaModerador"></input><button class="btn btn-link nav-link">Area do Moderador</a>'+
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

    <div class="container">
        <h1 class="text-center mt-3">Novidades</h1>
        <div id="conteudo">
            <%
            String value = request.getParameter("start");
            String direction = request.getParameter("dir");
            int valor;
            int dir;
            int[] limPagina = {0,0};
            int[] lim = DaoPostagem.getTamanhoBanco();
            if(value==null){
                valor = 0;
                dir = 1;
            }
            else{
                valor = Integer.parseInt(value);
                dir = Integer.parseInt(direction);
            }

            ArrayList<Postagem> postagens = DaoPostagem.getListaPostagens(valor, dir);
            //String postagens = DaoPostagem.getListaPostagens(0, 1);

            //out.write(postagens);

            boolean first = true;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm");

             for(Postagem p:postagens){
                if(first){
                    limPagina[0] = p.getId();
                    first=false;
                }
                limPagina[1] = p.getId();

                out.write(
                "<div class='d-flex justify-content-center my-4 mx-2'>" +
                    "<div class='card w-100'>" +
                        "<div class='card-header'>" +
                            formatter.format(p.getData().toLocalDateTime()) + " às " + formatter2.format(p.getData().toLocalDateTime()) +
                        "</div>" +
                        "<div class='card-body'>" +
                            "<h5 class='card-title'>" + p.getTitulo() + "</h5>" +
                            "<p class='card-text'>" + p.getTexto().substring(0,16) + "...</p>" +
                            "<form action='postagem.jsp'><input type='hidden' name='idPostagem' value = '" + p.getId() + "'><button class='btn btn-primary'>Ler Mais</button></form>"+
                        "</div>"+
                    "</div>"+
                "</div>"
                );

            }

            String proxima = "";
            String anterior = "";

            if(limPagina[1]==lim[1]){
                proxima = "disabled";
            }

            if(limPagina[0]==lim[0]){
                anterior = "disabled";
            }

            %>



        </div>

        <div class="d-flex justify-content-between my-4 mx-2">
            <form action="index.jsp"><input type="hidden" name="dir" value="1">
                <input type="hidden" name="start" value='<%out.write(""+limPagina[0]);%>'><button
                    class='btn big-btn  btn-secondary <%out.write(anterior);%>' id="botaoAnterior">
                    <h5 class="my-1">Anterior</h5>
                </button></form>
            <form action="index.jsp"><input type="hidden" name="dir" value="-1">
                <input type="hidden" name="start" value='<%out.write(""+limPagina[1]);%>'><button
                    class='btn big-btn btn-secondary <%out.write(proxima);%>' id="botaoProxima">
                    <h5 class="my-1">Proxima<h5>
                </button></form>
        </div>



    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>