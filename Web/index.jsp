<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ATOM PC</title>
  <link rel="icon" href="css/img/atom.png" type="image/gif" sizes="16x16">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
    crossorigin="anonymous">
  <link href="css/frontpage.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
  <script src="js/myjs.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
    crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
    crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
  <div class="container-fluid px-0" id="front">
    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="nav">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
          aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
            <span style="margin-top: 0.4vw; margin-right: 2vw;">
              <img src="css/img/atom ico.png" alt="" height="43vw" id="gif">
            </span>
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">
                <h2>Home</h2>
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#contact">
                <h2>About</h2>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#carro">
                <h2>Services</h2>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#gal">
                <h2>Media</h2>
              </a>
            </li>

            <span style="font-size: 1.3vw; margin-top: 0.8vw; margin-left: 2vw;">
              <i class="fas fa-search"></i>
            </span>
            <span style="font-size: 1.3vw; margin-top: 0.8vw; margin-left: 0.6vw;">
              <i class="fas fa-user "></i>
            </span>

          </ul>
        </div>
      </div>
    </nav>
    <!--Header-->
    <div class="container-fluid" id="video">
      <img class="img-fluid" src="css/img/pcexmp1.gif" width="100%" alt="pc">
      <div class="centered">
        <p style="font-size: 5em">ATOM PC</p>
        <p>Configurador de ordenadores</p>
      </div>
    </div>
    <!--Carousel-->
    <div class="container pt-4" id="carro">
      <h1 class="display-4" style="text-align: center;">Services</h1>
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-center m-auto">
            <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">

              <div class="carousel-inner">
                <div class="item carousel-item active">
                  <div class="row">
                    <div class="col-sm-4">
                      <div class="thumb-wrapper" style="text-align: center;">
                        <div class="img-box">
                          <span style="font-size: 4em;"><i class="fas fa-tools"></i></span>
                        </div>
                        <div class="thumb-content">
                          <h4>Configurador</h4>
                          <a href="montaje.jsp" class="btn btn-primary">More <i class="fa fa-angle-right"></i></a>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <div class="thumb-wrapper" style="text-align: center;">
                        <div class="img-box">
                          <span style="font-size: 4em;"><i class="fas fa-database"></i></span>
                        </div>
                        <div class="thumb-content">
                          <h4>Base de datos</h4>
                          <a href="database.jsp" class="btn btn-primary">More <i class="fa fa-angle-right"></i></a>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <div class="thumb-wrapper" style="text-align: center;">
                        <div class="img-box">
                          <span style="font-size: 4em;"><i class="fas fa-file-alt"></i></span>
                        </div>
                        <div class="thumb-content">
                          <h4>Lista de PCs</h4>
                          <a href="listaPC.jsp" class="btn btn-primary">More <i class="fa fa-angle-right"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item carousel-item">
                  <div class="row">
                    <div class="col-sm-4">
                      <div class="thumb-wrapper" style="text-align: center;">
                        <div class="img-box">
                          <span style="font-size: 4em;"><i class="fas fa-keyboard"></i></span>
                        </div>
                        <div class="thumb-content">
                          <h4>Periféricos</h4>
                          <a href="#" class="btn btn-primary">More <i class="fa fa-angle-right"></i></a>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <div class="thumb-wrapper" style="text-align: center;">
                        <div class="img-box">
                          <span style="font-size: 4em;"><i class="fas fa-address-card"></i></span>
                        </div>
                        <div class="thumb-content">
                          <h4>Info</h4>
                          <a href="#" class="btn btn-primary">More <i class="fa fa-angle-right"></i></a>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <div class="thumb-wrapper" style="text-align: center;">
                        <div class="img-box">
                          <span style="font-size: 4em;"><i class="fas fa-envelope"></i></span>
                        </div>
                        <div class="thumb-content">
                          <h4>Contacto</h4>
                          <a href="#" class="btn btn-primary">More <i class="fa fa-angle-right"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
              </a>
              <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--galeria-->
    <div class="container-fluid" id="gal">
      <div class="container" id="galeria">
        <h1 class="display-4">Media</h1>
        <hr>
        <br>
        <div class="gallery" id="gallery">
          <div class="mb-3 pics animation all 2">
            <img class="img-fluid" src="css/img/pc8.jpg" alt="Card image cap">
          </div>

          <div class="mb-3 pics animation all 1">
            <img class="img-fluid" src="css/img/pc9.jpg" alt="Card image cap">
          </div>

          <div class="mb-3 pics animation all 1">
            <img class="img-fluid" src="css/img/pc13.jpg" alt="Card image cap">
          </div>

          <div class="mb-3 pics animation all 2">
            <img class="img-fluid" src="css/img/pc10.jpg" alt="Card image cap">
          </div>

          <div class="mb-3 pics animation all 2">
            <img class="img-fluid" src="css/img/hdd.jpg" alt="Card image cap">
          </div>

          <div class="mb-3 pics animation all 1">
            <img class="img-fluid" src="css/img/intel.jpg" alt="Card image cap">
          </div>
        </div>
      </div>
    </div>
    <!--Contacto-->
    <div class="container-fluid pt-4" id="contact">
      <h1 class="display-4">About</h1>
      <div class="row pt-5">
        <div class="col" style="margin-left: 2em;" id="card1">
          <div class="skill-card  mt-5">
            <header class="skill-card__header"><img class="skill-card__icon" src="css/img/wolf.png"></header>
            <section class="skill-card__body">
              <h2 class="skill-card__title">Lino Haller</h2><span class="skill-card__duration">IES Campanillas</span>
              <ul class="skill-card__knowledge">
                <li>Java</li>
                <li>HTML/CSS</li>
                <li>Bootstrap</li>
              </ul>
            </section>
          </div>
        </div>
        <div class="col-7" style="margin-right: 2em;">
          <div class="container" id="form">
            <div class="row justify-content-center">
              <div class="col-12 col-md-8 col-lg-6 pb-5">
                <form action="mailto:linohr00@gmail.com" method="post">
                  <div class="card" style="background-color: rgb(64, 64, 64);">
                    <div class="card-header p-0" id="carCol">
                      <div class="text-white text-center py-2" style="background-color: #1a66ff;">
                        <h3><i class="fa fa-envelope"></i> Contactame</h3>
                      </div>
                    </div>
                    <div class="card-body p-3">

                      <div class="form-group">
                        <div class="input-group mb-2">
                          <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-user" style="color:#1a66ff"></i></div>
                          </div>
                          <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre y Apellido"
                            required>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group mb-2">
                          <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-envelope" style="color:#1a66ff"></i></div>
                          </div>
                          <input type="email" class="form-control" id="nombre" name="email" placeholder="ejemplo@gmail.com"
                            required>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="input-group mb-2">
                          <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-comment" style="color:#1a66ff"></i></div>
                          </div>
                          <textarea class="form-control" placeholder="Envia tu Mensaje" required></textarea>
                        </div>
                      </div>

                      <div class="text-center">
                        <input type="submit" value="Enviar" class="btn btn-block rounded-0 py-2" style="background-color: #1a66ff; color: white;">
                      </div>
                    </div>

                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="skill-card mt-5" id="card1">
            <header class="skill-card__header"><img class="skill-card__icon" src="css/img/atomic.png"></header>
            <section class="skill-card__body">
              <h2 class="skill-card__title">Atom PC</h2><span class="skill-card__duration">IES Campanillas</span>
              <ul class="skill-card__knowledge">
                <li>Configurador de PCs</li>
                <li>Añadir nuevos componentes</li>
                <li>Guardar tus configuraciones</li>
              </ul>
            </section>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <footer id="myFooter">
      <div class="container">
        <div class="row">
          <div class="col-sm-3 myCols">
            <h5>Get started</h5>
            <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">Log In</a></li>
              <li><a href="#"></a></li>
            </ul>
          </div>
          <div class="col-sm-3 myCols">
            <h5>About me</h5>
            <ul>
              <li><a href="#">IES Campanillas</a></li>
              <li><a href="#">Spain</a></li>
              <li><a href="#">Málaga</a></li>
            </ul>
          </div>
          <div class="col-sm-3 myCols">
            <h5>Support</h5>
            <ul>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Help desk</a></li>
              <li><a href="#">Forums</a></li>
            </ul>
          </div>
          <div class="col-sm-3 myCols">
            <h5>Legal</h5>
            <ul>
              <li><a href="#">Terms of Service</a></li>
              <li><a href="#">Terms of Use</a></li>
              <li><a href="#">Privacy Policy</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="social-networks">
        <a href="#" class="twitter"><i class="fab fa-twitter"></i></a>
        <a href="#" class="facebook"><i class="fab fa-facebook"></i></a>
        <a href="#" class="google"><i class="fab fa-google-plus"></i></a>
      </div>
      <div class="footer-copyright">
        <p>© 2019 Copyright Lino Haller Ríos </p>
      </div>
    </footer>
</body>

</html>