<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ATOM PC</title>
  <link rel="icon" href="css/img/atom.png" type="image/gif" sizes="16x16">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="css/frontpage.css">
  
</head>

<body>
<% if (((String) (session.getAttribute("islogin"))).equals("true")) { %>
 <%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/atom", "root", "");
  Statement s = conexion.createStatement();
  Statement s1 = conexion.createStatement();
  Statement s2 = conexion.createStatement();
  Statement s3 = conexion.createStatement();
  Statement s4 = conexion.createStatement();
  Statement s5 = conexion.createStatement();

  String estado = (request.getParameter("CodOrd") == null) ? "listado" : "edicion";
%>

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
                <span class="sr-only">(current)</span>
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

    <div class="container-fluid mt-5 " style="padding-bottom: 18em">
        <div style="margin-top: 5em; text-align:center;" ><h2>Lista de ordenadores</h2></div>
        <div class="panel panel-primary mt-5 mb-5">
          <table class="table table-striped table-hover">
            <tr style="color:black;">
              <th>Nº de PC</th>
              <th>Nombre</th>
              <th>Procesador</th>
              <th>Placa Base</th>
              <th>Memoria RAM</th>
              <th>Fuente de alimentacion</th>
              <th>Almacenamiento</th>
              <th></th>
            </tr>
            
            <%
              ResultSet listado = s.executeQuery("SELECT * FROM ordenadores");

              while (listado.next()) {
            %>
            <tr>
              <td><%= listado.getString("CodOrd")%></td>
              <td><%= listado.getString("NomOrd")%></td>
              <td><%= listado.getString("CodPro")%></td>
              <td><%= listado.getString("CodPla")%></td>
              <td><%= listado.getString("CodRam")%></td>
              <td><%= listado.getString("CodFue")%></td>
              <td><%= listado.getString("CodAlm")%></td>
              <td>
                <a class="btn btn-danger" href="borrarbd.jsp?CodOrd=<%= listado.getString("CodOrd")%>" role="button"><i class="fas fa-trash-alt"></i></a>
              </td>
            </tr>
            <%
              }
            %>
      
          </table>
        </div>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<% } else { %>
<% response.sendRedirect("index.jsp"); }%>
</body>

</html>

