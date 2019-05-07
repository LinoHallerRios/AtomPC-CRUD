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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="css/frontpage.css">
  
</head>

<body>
<% if (((String) (session.getAttribute("islogin"))).equals("true")) { %>
 <%
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/atom", "root", "");
    Statement s1 = conexion.createStatement();
    Statement s2 = conexion.createStatement();
    Statement s3 = conexion.createStatement();
    Statement s4 = conexion.createStatement();
    Statement s5 = conexion.createStatement();
    
    ResultSet listadoRam = s1.executeQuery("SELECT CodRam, MarcRam, ModRam, CapRam FROM ram");
    ResultSet listadoPro = s2.executeQuery("SELECT CodPro, TipoPro, NomPro FROM procesadores");
    ResultSet listadoPla = s3.executeQuery("SELECT CodPla, MarPla, ModPla, ChiPla FROM `placas base`");
    ResultSet listadoFue = s4.executeQuery("SELECT CodFue, MarFue, ModFue, VatFue FROM `fuente de alimentacion`");
    ResultSet listadoAlm = s5.executeQuery("SELECT CodAlm, MarAlm, ModAlm, TipoAlm, CapAlm FROM `almacenamiento`");
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
    
    <div class="container-fluid mt-5" id="montaje" style="height: 75em; background-color: rgb(22, 18, 17); background-image: url('css/img/orion.jpg'); background-repeat: no-repeat; background-size: contain;">
      <form action="insertdb.jsp" method="get">

        <div class="form-group mt-5" style="text-align:center; color:white; width: 20em; position: absolute; top: 8em; left: 6em">
            <h3>Nombre del PC</h3>
            
              <input class="form-control" required name="NomOrd" type="text">
            
        </div>


        <div class="form-group mt-5" style="text-align:center; color:white; width: 15em; position: absolute; top: 19.5em;">
          <h3>RAM</h3>
          
            <%                         
              out.print("<select class=\"custom-select\" name=\"CodRam\" required=\"required\">");
              while (listadoRam.next()) {
                out.print("<option value=\"" + listadoRam.getString("CodRam") + "\">" + listadoRam.getString("MarcRam") +" "+ listadoRam.getString("ModRam") +" "+ listadoRam.getString("CapRam")+" GB"+"</option>");
              }
              out.print("</select>");                            
            %>
          
        </div>

        <div class="form-group mt-5" style="text-align:center; color:white; width: 15em; position: absolute; top: 45em; left: 2em;">
            <h3>Fuente de alimentación</h3>
            <%                         
              out.print("<select class=\"custom-select\" name=\"CodFue\" required=\"required\">");
              while (listadoFue.next()) {
                out.print("<option value=\"" + listadoFue.getString("CodFue") + "\">" + listadoFue.getString("MarFue") +" "+ listadoFue.getString("ModFue") +" "+ listadoFue.getString("VatFue")+" W"+"</option>");
              }
              out.print("</select>");                            
            %>
        </div>

        <div class="form-group mt-5" style="text-align:center; color:white; width: 15em; position: absolute; top: 9.5em; right: 9em;">
            <%                         
              out.print("<select class=\"custom-select\" name=\"CodPro\" required=\"required\">");
              while (listadoPro.next()) {
                out.print("<option value=\"" + listadoPro.getString("CodPro") + "\">" + listadoPro.getString("TipoPro") +" "+ listadoPro.getString("NomPro") + "</option>");
              }
              out.print("</select>");                            
            %>
            <h3>Procesador</h3>
        </div>

        <div class="form-group mt-5" style="text-align:center; color:white; width: 15em; position: absolute; top: 33em; right: 5.5em;">
              <h3>Placa Base</h3>
            <%                         
              out.print("<select class=\"custom-select\" name=\"CodPla\" required=\"required\">");
              while (listadoPla.next()) {
                out.print("<option value=\"" + listadoPla.getString("CodPla") + "\">" + listadoPla.getString("MarPla") +" "+ listadoPla.getString("ModPla") +" "+ listadoPla.getString("ChiPla")+"</option>");
              }
              out.print("</select>");                            
            %>
         </div>

        <div class="form-group mt-5" style="text-align:center; color:white; width: 15em; position: absolute; top: 50em; right: 10em;">
          <h3>Almacenamiento</h3>
        <%                         
          out.print("<select class=\"custom-select\" name=\"CodAlm\" required=\"required\">");
          while (listadoAlm.next()) {
            out.print("<option value=\"" + listadoAlm.getString("CodAlm") + "\">" + listadoAlm.getString("MarAlm") +" "+ listadoAlm.getString("ModAlm") +" "+ listadoAlm.getString("TipoAlm")+ " "+ listadoAlm.getString("CapAlm") + " GB" + "</option>");
          }
          out.print("</select>");                            
        %>
        </div>
        
        
        <span style="position: absolute; top: 73em; right: 54%"><button class="btn btn-success" type="submit">Guardar</button></span>
        <span style="position: absolute; top: 73em; right: 44%"><button class="btn btn-dark"><a style="text-decoration: none; color: white;" href="index.jsp">Cancelar</a></button></span>
        
        
      </form>
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
