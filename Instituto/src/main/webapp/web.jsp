<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Guardias Azarquiel</title>
    <link rel="shortcut icon" href="img/imagenArriba.ico">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="css/style.css">
    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <div class="container px-0 shadow ">
        <header><img src="img/logoAzarquielmod.png" alt="" width="100%" class="img-responsive"></header>
        <div class="wrapper form-signin position-relative my-5 w-75 text-center">
                    <c:choose>
                        <c:when test="${profesor == null && msgError == null}">
                            <form class="" action="Controller?op=login" method="post">
                                <h2 class="form-signin-heading">Iniciar Sesión</h2>
                                <input class="form-control me-sm-2" type="text" placeholder="Correo Electrónico"
                                    name="email" required="" />
                                <input class="form-control me-sm-2 mt-3" type="password" placeholder="Contraseña"
                                    name="pass" required="" />
                                <button class="btn px-5 text-white bg-primary my-2 my-sm-0 "
                                    type="submit">Login</button>
                            </form>
                        </c:when>
                        <c:when test="${profesor == null && msgError != null}">
                            <form class="" action="Controller?op=login" method="post">
                                <h2 class="form-signin-heading">Iniciar Sesión</h2>
                                <input class="form-control me-sm-2" type="text" placeholder="Correo Electrónico"
                                    name="email" required="" />
                                <input class="form-control me-sm-2 mt-3" type="password" placeholder="Contraseña"
                                    name="pass" required="" />
                                <h3 class="text-danger">${msgError}</h3>
                                <button class="btn px-5 text-white bg-primary my-2 my-sm-0 "
                                    type="submit">Login</button>
                            </form>
                        </c:when>
                    </c:choose>
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
                    <div id="sp-bottom3" class="col-sm-6 col-md-6">
                        <div class="sp-column ">
                            <div class="sp-module ">
                                <h3 class="sp-module-title">Localización</h3>
                                <div class="sp-module-content">

                                    <div class="custom">
                                        <p>
                                            <iframe
                                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3062.1442484115123!2d-4.025553723592982!3d39.871006688672644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd6a0a53483a57e7%3A0xc7f7d4815179b44b!2sIES%20Azarquiel!5e0!3m2!1ses!2ses!4v1718106225519!5m2!1ses!2ses"
                                                width="100%" height="200" style="border:0;" allowfullscreen=""
                                                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                        </p>
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

    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>