<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>Guardias Azarquiel</title>
    <link rel="shortcut icon" href="img/imagenArriba.ico">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container px-0 shadow" id="top">
        <nav class="navbar navbar-expand-md navbar-light bg-light   ">
            <div class="container">
                <a class="navbar-brand" href="Controller?op=vueltaInicio"><img src="./img/logoAzarquiel.png" alt=""
                        width="250"></a>
                <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <div class="navbar-nav me-auto mt-2 mt-lg-0"></div>
                    <form action="Controller?op=logout" method="post">
                        <button class="btn btn-outline-success my-2 my-sm-0 font-weight-bold"
                            type="submit">Logout</button>
                    </form>
                    <div class="ms-md-3">Bienvenido, ${profesor.nombre} <a href="cuenta.html"><i class="fa fa-gear
                        " aria-hidden="true"></i></a></div>
                </div>
            </div>
        </nav>

        <div>
            <div class="row container pb-2">
                <div>
                    <ul class=" text-center row mb-5 justify-content-sm-center ">
                        <a href="Controller?op=vaGuardias" class="col-md-3 col-sm-6 px-1 h-25">
                            <li class="bg-primary texto-22 py-3 border border-white rounded">Guardias</li>
                        </a>
                        <a href="Controller?op=vaAnadir" class="col-md-3 col-sm-6 px-1 h-25">
                            <li class="bg-primary texto-22 py-3  border border-white rounded">Añadir Guardias</li>
                        </a>
                        <a href="calendario.html" class="col-md-3 col-sm-6 px-1  h-25">
                            <li class="bg-primary texto-22 py-3 border border-white rounded">Calendario</li>
                        </a>
                        <a href="Controller?op=vaTodasGuardias" class="col-md-3 col-sm-6 px-1 h-25">
                            <li class="bg-primary texto-22 py-3 border border-white rounded">Todas las guardias </li>
                        </a>

                    </ul>
                </div>

                <c:forEach items="${listaGuardias}" var="guardia">
                    <div class="card  mt-3  mx-3" style="max-width:100%;">
                        <div class="row g-0 align-items-center my-2">
                            <div class="col-md-3 text-center ">
                                <h4>Nombre Profesor: ${profesor.nombre} ${profesor.apellido}
                                </h4>
                                <button class="btn btn-outline-success my-2 my-sm-0">
                                    <a href="Controller?op=guardiaCompletada&idGuardia=${guardia.idguardia}"
                                        class="text-black">
                                        <i class="fa fa-check" aria-hidden="true">
                                        </i>
                                    </a>
                                </button>
                                <button class="btn btn-outline-danger my-2 my-sm-0">
                                    <a href="Controller?op=guardiaBorrar&idGuardia=${guardia.idguardia}"
                                        class="text-black">
                                        <i class="fa fa-trash" aria-hidden="true">
                                        </i>
                                    </a>
                                </button>
                            </div>
                            <div class="col-md-9 ">
                                <div class=" row mt-3">
                                    <p class="col-md-3 text-center col-sm-4">Aula: ${guardia.aula}</p>
                                    <p class="col-md-3 text-center col-sm-4">Fecha: ${guardia.fecha}</p>
                                    <p class="col-md-3 text-center col-sm-4">Hora: ${guardia.hora}</p>
                                    <p class="col-md-3 text-center col-sm-4">Completada: ${guardia.completada}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach items="${listaTodasGuardias}" var="guardia">
                    <div class="card  mt-3  mx-3" style="max-width:100%;">
                        <div class="row g-0 align-items-center my-2">
                            <div class="col-md-3 text-center ">
                                <h4>Nombre Profesor: ${guardias.profesor.nombre} ${guardias.profesor.apellido}
                                </h4>
                                <button class="btn btn-outline-success my-2 my-sm-0">
                                    <a href="Controller?op=guardiaCompletada&idGuardia=${guardia.idGuardia}"
                                        class="text-black">
                                        <i class="fa fa-check" aria-hidden="true">
                                        </i>
                                    </a>
                                </button>
                                <button class="btn btn-outline-danger my-2 my-sm-0">
                                    <a href="Controller?op=guardiaBorrar&idGuardia=${guardia.idGuardia}"
                                        class="text-black">
                                        <i class="fa fa-trash" aria-hidden="true">
                                        </i>
                                    </a>
                                </button>
                            </div>
                            <div class="col-md-9 ">
                                <div class=" row mt-3">
                                    <p class="col-md-3 text-center col-sm-4">Aula: ${guardia.aula}</p>
                                    <p class="col-md-3 text-center col-sm-4">Fecha: ${guardia.fecha}</p>
                                    <p class="col-md-3 text-center col-sm-4">Hora: ${guardia.hora}</p>
                                    <p class="col-md-3 text-center col-sm-4">Completada: ${guardia.completada}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>

        <section id="sp-bottom">
            <div class="container">
                <div class="row">
                    <div id="sp-bottom1" class="col-sm-6 col-md-3">
                        <div class="sp-column ">
                            <div class="sp-module ">
                                <h3 class="sp-module-title">Otros Sitios</h3>
                                <div class="sp-module-content">
                                    <div>
                                        <p><a href="http://www.educa.jccm.es" target="_blank"
                                                rel="noopener noreferrer">Portal de Educación</a></p>
                                        <p><a href="https://educamosclm.castillalamancha.es/" target="_blank"
                                                rel="noopener noreferrer">EducamosCLM</a></p>
                                        <p><a href="http://www.iesazarquiel.es/intranet" target="_blank"
                                                rel="noopener noreferrer">Intranet</a></p>
                                        <p><img class="img-responsive" src="img/logofooter.png" width="75%"
                                                alt="logofooter"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sp-bottom2" class="col-sm-6 col-md-3">
                        <div class="sp-column ">
                            <div class="sp-module ">
                                <h3 class="sp-module-title">Contacto</h3>
                                <div class="sp-module-content">
                                    <div>
                                        <p>I.E.S. Azarquiel<br> Paseo de San Eugenio, 21<br>45003 - Toledo<br>
                                            Teléfono : 925284043 </p>

                                        <p><a href="mailto:45003875.ies@edu.jccm.es"> <em class="fa fa-envelope">
                                                    CENTRO: </em> 45003875.ies@edu.jccm.es</a> <br><a
                                                href="mailto:azarquiel.ampa@gmail.com"><em class="fa fa-envelope">
                                                    AMPA: </em> azarquiel.ampa@gmail.com</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="container">
                <div class="row text-center text-white">
                    <div id="sp-footer1" class="col-sm-12 col-md-12">
                        <div class="sp-column "><span class="sp-copyright"><strong>© 2024 IES Azarquiel.</strong></span>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>






    <!-- Modal -->

    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>