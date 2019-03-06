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
  <link rel="stylesheet" href="css/database.css">
  
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
    <!--Content-->
    <%
      request.setCharacterEncoding("UTF-8");
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/atom", "root", "");
      Statement s = conexion.createStatement();

      String estado = (request.getParameter("CodPro") == null) ? "listado" : "edicion";
      String estadoPla = (request.getParameter("CodPla") == null) ? "listadoPla" : "edicionPla";
      String estadoRam = (request.getParameter("CodRam") == null) ? "listadoRam" : "edicionRam";
      String estadoFue = (request.getParameter("CodFue") == null) ? "listadoFue" : "edicionFue";
      String estadoAlm = (request.getParameter("CodAlm") == null) ? "listadoAlm" : "edicionAlm";
    %>

    <div class="container-fluid m-0 py-5 justify-content:center;" id="database">

      <div class="container mx-auto p-5" style="background-image: url('css/img/proBack.jpg'); color:white; text-align:center; margin-top:5em;" id="procesador">
        <br><br>
        <div class="container-fluid p-2">
          <div class="panel-heading text-center"><h2>Procesadores</h2></div>
          <div class="panel panel-primary mt-5 mb-5">
            <table class="table table-striped table-hover">
              <tr style="color:white;">
                <th>Nº de CPU</th>
                <th>Tipo</th>
                <th>Nombre</th>
                <th>Nº de nucleos</th>
                <th>Precio</th>
                <th></th>
              </tr>
              <form action="<%= estado.equals("listado") ? "insertdb.jsp" : "actualizadb.jsp" %>" method="GET">
                <tr>
                  <td>
                    <%
                      if (estado.equals("edicion")) {
                    %>
                    <div class="form-group">
                    <input
                      size="10"
                      type="number"
                      disabled
                      value="<%= request.getParameter("CodPro") %>"
                      class="form-control">
                    </div>
                      
                    <input
                      name="CodPro"
                      type="hidden"
                      value="<%= request.getParameter("CodPro") %>">
                    <%
                      }
                    %>
                  </td>
                  <td>
                    <div class="form-group">
                      <select name="TipoPro" class="form-control" placeholder="None">
                        <option value="Intel" <%= estado.equals("edicion") && request.getParameter("TipoPro").equals("Intel") ? "selected" : ""%> >Intel</option>
                        <option value="AMD" <%= estado.equals("edicion") && request.getParameter("TipoPro").equals("AMD") ? "selected" : ""%>>AMD</option>
                      </select>
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estado.equals("edicion") ? request.getParameter("NomPro") : "" %>"
                        name="NomPro"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estado.equals("edicion") ? request.getParameter("NumCor") : "" %>"
                        name="NumCor"
                        type="number"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estado.equals("edicion") ? request.getParameter("PrePro") : "" %>"
                        name="PrePro"
                        type="number"
                        step="0.01"
                        min="0"
                        style="width: 100px;"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <%
                      if (estado.equals("listado")) {
                    %>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i></button>
                    <%
                    }
                    
                    if (estado.equals("edicion")) {
                    %>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i></button>
                  
                    <a href="database.jsp#procesador">
                      <button type="button" class="btn btn-dark"><i class="fas fa-ban"></i></button>
                    </a>
                    <%
                      }
                    %>
                  </td>
                </tr>
              </form>
              <%
                ResultSet listado = s.executeQuery("SELECT * FROM procesadores");
                while (listado.next()) {
              %>
              <tr>
                <td><%= listado.getString("CodPro")%></td>
                <td><%= listado.getString("TipoPro")%></td>
                <td><%= listado.getString("NomPro")%></td>
                <td><%= listado.getString("NumCor")%></td>
                <td><%= listado.getString("PrePro")%> €</td>
                <td>
                  <a
                    class="btn btn-warning "
                    href="database.jsp?CodPro=<%= listado.getString("CodPro")%>&TipoPro=<%= listado.getString("TipoPro")%>&NomPro=<%= listado.getString("NomPro")%>&NumCor=<%= listado.getString("NumCor")%>&PrePro=<%= listado.getString("PrePro")%>#procesador" role="button"><i class="fas fa-pen"></i></a>
                  <a class="btn btn-danger" href="borrarbd.jsp?CodPro=<%= listado.getString("CodPro")%>" role="button"><i class="fas fa-trash-alt"></i></a>
                </td>
              </tr>
              <%
                }
              %>
        
            </table>
          </div>
        </div>
      </div>







      
      <div class="container mx-auto mt-5 p-5" style="background-image: url('css/img/placBack.jpg'); color:white; text-align:center;" id="placabase">
        <br><br>
        <div class="container-fluid " style="margin-top:2em;">
          <div class="panel-heading text-center"><h2>Placas Base</h2></div>
          <div class="panel panel-primary mt-5 mb-5">
            <table class="table table-striped table-hover">
              <tr style="color:white;">
                <th>Nº de Placa</th>
                <th>Marca</th>
                <th>Factor de forma</th>
                <th>Modelo</th>
                <th>Chipset</th>
                <th>Socket</th>
                <th>Precio</th>
                <th></th>
              </tr>
              <form action="<%= estadoPla.equals("listadoPla") ? "insertdb.jsp" : "actualizadb.jsp" %>" method="GET">
                <tr>
                  <td>
                    <%
                      if (estadoPla.equals("edicionPla")) {
                    %>
                    <div class="form-group">
                    <input
                      size="10"
                      type="number"
                      disabled
                      value="<%= request.getParameter("CodPla") %>"
                      class="form-control">
                    </div>
                      
                    <input
                      name="CodPla"
                      type="hidden"
                      value="<%= request.getParameter("CodPla") %>">
                    <%
                      }
                    %>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoPla.equals("edicionPla") ? request.getParameter("MarPla") : "" %>"
                        name="MarPla"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <select name="FacFor" class="form-control">
                        <option value="ATX" <%= estadoPla.equals("edicionPla") && request.getParameter("FacFor").equals("ATX") ? "selected" : ""%> >ATX</option>
                        <option value="Micro ATX" <%= estadoPla.equals("edicionPla") && request.getParameter("FacFor").equals("Micro ATX") ? "selected" : ""%> >Micro ATX</option>
                        <option value="Mini ATX" <%= estadoPla.equals("edicionPla") && request.getParameter("FacFor").equals("Mini ATX") ? "selected" : ""%> >Mini ATX</option>
                        <option value="E-ATX" <%= estadoPla.equals("edicionPla") && request.getParameter("FacFor").equals("E-ATX") ? "selected" : ""%> >E-ATX</option>
                      </select>
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoPla.equals("edicionPla") ? request.getParameter("ModPla") : "" %>"
                        name="ModPla"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoPla.equals("edicionPla") ? request.getParameter("ChiPla") : "" %>"
                        name="ChiPla"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoPla.equals("edicionPla") ? request.getParameter("SockPla") : "" %>"
                        name="SockPla"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoPla.equals("edicionPla") ? request.getParameter("PrePla") : "" %>"
                        name="PrePla"
                        type="number"
                        step="0.01"
                        min="0"
                        style="width: 100px;"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <%
                      if (estadoPla.equals("listadoPla")) {
                    %>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i></button>
                    <%
                    }
                    
                    if (estadoPla.equals("edicionPla")) {
                    %>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i></button>
                  
                    <a href="database.jsp#placabase">
                      <button type="button" class="btn btn-dark"><i class="fas fa-ban"></i></button>
                    </a>
                    <%
                      }
                    %>
                  </td>
                </tr>
              </form>
              <%
                ResultSet listadoPla = s.executeQuery("SELECT * FROM `placas base`");
                while (listadoPla.next()) {
              %>
              <tr>
                <td><%= listadoPla.getString("CodPla")%></td>
                <td><%= listadoPla.getString("MarPla")%></td>
                <td><%= listadoPla.getString("FacFor")%></td>
                <td><%= listadoPla.getString("ModPla")%></td>
                <td><%= listadoPla.getString("ChiPla")%></td>
                <td><%= listadoPla.getString("SockPla")%></td>
                <td><%= listadoPla.getString("PrePla")%> €</td>
                <td>
                  <a
                    class="btn btn-warning"
                    href="database.jsp?CodPla=<%= listadoPla.getString("CodPla")%>&MarPla=<%= listadoPla.getString("MarPla")%>&FacFor=<%= listadoPla.getString("FacFor")%>&ModPla=<%= listadoPla.getString("ModPla")%>&ChiPla=<%= listadoPla.getString("ChiPla")%>&SockPla=<%= listadoPla.getString("SockPla")%>&PrePla=<%= listadoPla.getString("PrePla")%>#placabase" role="button"><i class="fas fa-pen"></i></a>
                  <a class="btn btn-danger" href="borrarbd.jsp?CodPla=<%= listadoPla.getString("CodPla")%>" role="button"><i class="fas fa-trash-alt"></i></a>
                </td>
              </tr>
              <%
                }
              %>
        
            </table>
          </div>
        </div>
      </div>







       <div class="container mx-auto mt-5 p-5" style="background-image: url('css/img/ramBack.jpg'); color:white; text-align:center;" id="ram">
        <br><br>
        <div class="container-fluid " style="margin-top:2em;">
          <div class="panel-heading text-center"><h2>Memoria RAM</h2></div>
          <div class="panel panel-primary mt-5 mb-5">
            <table class="table table-striped table-hover">
              <tr style="color:white;">
                <th>Nº de RAM</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Tipo</th>
                <th>Capacidad</th>
                <th>Hercios</th>
                <th>Precio</th>
                <th></th>
              </tr>
              <form action="<%= estadoRam.equals("listadoRam") ? "insertdb.jsp" : "actualizadb.jsp" %>" method="GET">
                <tr>
                  <td>
                    <%
                      if (estadoRam.equals("edicionRam")) {
                    %>
                    <div class="form-group">
                    <input
                      size="10"
                      type="number"
                      disabled
                      value="<%= request.getParameter("CodRam") %>"
                      class="form-control">
                    </div>
                      
                    <input
                      name="CodRam"
                      type="hidden"
                      value="<%= request.getParameter("CodRam") %>">
                    <%
                      }
                    %>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoRam.equals("edicionRam") ? request.getParameter("MarcRam") : "" %>"
                        name="MarcRam"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoRam.equals("edicionRam") ? request.getParameter("ModRam") : "" %>"
                        name="ModRam"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <select name="TipoRam" class="form-control">
                        <option value="DDR2" <%= estadoRam.equals("edicionRam") && request.getParameter("TipoRam").equals("DDR2") ? "selected" : ""%>>DDR2</option>
                        <option value="DDR3" <%= estadoRam.equals("edicionRam") && request.getParameter("TipoRam").equals("DDR3") ? "selected" : ""%>>DDR3</option>
                        <option value="DDR4" <%= estadoRam.equals("edicionRam") && request.getParameter("TipoRam").equals("DDR4") ? "selected" : ""%>>DDR4</option>
                      </select>
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoRam.equals("edicionRam") ? request.getParameter("CapRam") : "" %>"
                        name="CapRam"
                        type="number"
                        min="0"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoRam.equals("edicionRam") ? request.getParameter("HerzRam") : "" %>"
                        name="HerzRam"
                        type="number"
                        min="0"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoRam.equals("edicionRam") ? request.getParameter("PreRam") : "" %>"
                        name="PreRam"
                        type="number"
                        step="0.01"
                        min="0"
                        style="width: 100px;"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <%
                      if (estadoRam.equals("listadoRam")) {
                    %>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i></button>
                    <%
                    }
                    
                    if (estadoRam.equals("edicionRam")) {
                    %>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i></button>
                  
                    <a href="database.jsp#ram">
                      <button type="button" class="btn btn-dark"><i class="fas fa-ban"></i></button>
                    </a>
                    <%
                      }
                    %>
                  </td>
                </tr>
              </form>
              <%
                ResultSet listadoRam = s.executeQuery("SELECT * FROM `ram`");
                while (listadoRam.next()) {
              %>
              <tr>
                <td><%= listadoRam.getString("CodRam")%></td>
                <td><%= listadoRam.getString("MarcRam")%></td>
                <td><%= listadoRam.getString("ModRam")%></td>
                <td><%= listadoRam.getString("TipoRam")%></td>
                <td><%= listadoRam.getString("CapRam")%></td>
                <td><%= listadoRam.getString("HerzRam")%></td>
                <td><%= listadoRam.getString("PreRam")%> €</td>
                <td>
                  <a
                    class="btn btn-warning"
                    href="database.jsp?CodRam=<%= listadoRam.getString("CodRam")%>&MarcRam=<%= listadoRam.getString("MarcRam")%>&ModRam=<%= listadoRam.getString("ModRam")%>&TipoRam=<%= listadoRam.getString("TipoRam")%>&CapRam=<%= listadoRam.getString("CapRam")%>&HerzRam=<%= listadoRam.getString("HerzRam")%>&PreRam=<%= listadoRam.getString("PreRam")%>#ram" role="button"><i class="fas fa-pen"></i></a>
                  <a class="btn btn-danger" href="borrarbd.jsp?CodRam=<%= listadoRam.getString("CodRam")%>" role="button"><i class="fas fa-trash-alt"></i></a>
                </td>
              </tr>
              <%
                }
              %>
        
            </table>
          </div>
        </div>
      </div>

      
      
      


      <div class="container mx-auto mt-5 p-5" style="background-image: url('css/img/fuenteBack.jpg'); color:white; text-align:center;" id="fuente">
        <br><br>
        <div class="container-fluid " style="margin-top:2em;">
          <div class="panel-heading text-center"><h2>Fuente de alimentación</h2></div>
          <div class="panel panel-primary mt-5 mb-5">
            <table class="table table-striped table-hover">
              <tr style="color:white;">
                <th>Nº de Fuente</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Vatios</th>
                <th>Certificado</th>
                <th>Tipo</th>
                <th>Precio</th>
                <th></th>
              </tr>
              <form action="<%= estadoFue.equals("listadoFue") ? "insertdb.jsp" : "actualizadb.jsp" %>" method="GET">
                <tr>
                  <td>
                    <%
                      if (estadoFue.equals("edicionFue")) {
                    %>
                    <div class="form-group">
                    <input
                      size="10"
                      type="number"
                      disabled
                      value="<%= request.getParameter("CodFue") %>"
                      class="form-control">
                    </div>
                      
                    <input
                      name="CodFue"
                      type="hidden"
                      value="<%= request.getParameter("CodFue") %>">
                    <%
                      }
                    %>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoFue.equals("edicionFue") ? request.getParameter("MarFue") : "" %>"
                        name="MarFue"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoFue.equals("edicionFue") ? request.getParameter("ModFue") : "" %>"
                        name="ModFue"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoFue.equals("edicionFue") ? request.getParameter("VatFue") : "" %>"
                        name="VatFue"
                        type="number"
                        min="0"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoFue.equals("edicionFue") ? request.getParameter("CerFue") : "" %>"
                        name="CerFue"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <select name="TipoFue" class="form-control">
                        <option value="Modular" <%= estadoFue.equals("edicionFue") && request.getParameter("TipoFue").equals("Modular") ? "selected" : ""%>>Modular</option>
                        <option value="Semi-Modular" <%= estadoFue.equals("edicionFue") && request.getParameter("TipoFue").equals("Semi-Modular") ? "selected" : ""%>>Semi-Modular</option>
                        <option value="No Modular" <%= estadoFue.equals("edicionFue") && request.getParameter("TipoFue").equals("No Modular") ? "selected" : ""%>>No Modular</option>
                      </select>
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoFue.equals("edicionFue") ? request.getParameter("PreFue") : "" %>"
                        name="PreFue"
                        type="number"
                        step="0.01"
                        min="0"
                        style="width: 100px;"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <%
                      if (estadoFue.equals("listadoFue")) {
                    %>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i></button>
                    <%
                    }
                    
                    if (estadoFue.equals("edicionFue")) {
                    %>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i></button>
                  
                    <a href="database.jsp#fuente">
                      <button type="button" class="btn btn-dark"><i class="fas fa-ban"></i></button>
                    </a>
                    <%
                      }
                    %>
                  </td>
                </tr>
              </form>
              <%
                ResultSet listadoFue = s.executeQuery("SELECT * FROM `fuente de alimentacion`");
                while (listadoFue.next()) {
              %>
              <tr>
                <td><%= listadoFue.getString("CodFue")%></td>
                <td><%= listadoFue.getString("MarFue")%></td>
                <td><%= listadoFue.getString("ModFue")%></td>
                <td><%= listadoFue.getString("VatFue")%></td>
                <td><%= listadoFue.getString("CerFue")%></td>
                <td><%= listadoFue.getString("TipoFue")%></td>
                <td><%= listadoFue.getString("PreFue")%> €</td>
                <td>
                  <a
                    class="btn btn-warning"
                    href="database.jsp?CodFue=<%= listadoFue.getString("CodFue")%>&MarFue=<%= listadoFue.getString("MarFue")%>&ModFue=<%= listadoFue.getString("ModFue")%>&VatFue=<%= listadoFue.getString("VatFue")%>&CerFue=<%= listadoFue.getString("CerFue")%>&TipoFue=<%= listadoFue.getString("TipoFue")%>&PreFue=<%= listadoFue.getString("PreFue")%>#fuente" role="button"><i class="fas fa-pen"></i></a>
                  <a class="btn btn-danger" href="borrarbd.jsp?CodFue=<%= listadoFue.getString("CodFue")%>" role="button"><i class="fas fa-trash-alt"></i></a>
                </td>
              </tr>
              <%
                }
              %>
        
            </table>
          </div>
        </div>
      </div>


      <div class="container mx-auto mt-5 p-5" style="background-image: url('css/img/almBack.jpg'); color:white; text-align:center;" id="alm">
        <br><br>
        <div class="container-fluid " style="margin-top:2em;">
          <div class="panel-heading text-center"><h2>Almacenamiento</h2></div>
          <div class="panel panel-primary mt-5 mb-5">
            <table class="table table-striped table-hover">
              <tr style="color:white;">
                <th>Nº de Almacenamiento</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Tipo</th>
                <th>Capacidad</th>
                <th>Precio</th>
                <th></th>
              </tr>
              <form action="<%= estadoAlm.equals("listadoAlm") ? "insertdb.jsp" : "actualizadb.jsp" %>" method="GET">
                <tr>
                  <td>
                    <%
                      if (estadoAlm.equals("edicionAlm")) {
                    %>
                    <div class="form-group">
                    <input
                      size="10"
                      type="number"
                      disabled
                      value="<%= request.getParameter("CodAlm") %>"
                      class="form-control">
                    </div>
                      
                    <input
                      name="CodAlm"
                      type="hidden"
                      value="<%= request.getParameter("CodAlm") %>">
                    <%
                      }
                    %>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoAlm.equals("edicionAlm") ? request.getParameter("MarAlm") : "" %>"
                        name="MarAlm"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoAlm.equals("edicionAlm") ? request.getParameter("ModAlm") : "" %>"
                        name="ModAlm"
                        type="text"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <select name="TipoAlm" class="form-control">
                        <option value="HDD" <%= estadoAlm.equals("edicionAlm") && request.getParameter("TipoAlm").equals("HDD") ? "selected" : ""%>>HDD</option>
                        <option value="SSD SATA" <%= estadoAlm.equals("edicionAlm") && request.getParameter("TipoAlm").equals("SSD SATA") ? "selected" : ""%>>SSD SATA</option>
                        <option value="SSD M.2" <%= estadoAlm.equals("edicionAlm") && request.getParameter("TipoAlm").equals("SSD M.2") ? "selected" : ""%>>SSD M.2</option>
                        <option value="Intel Optane" <%= estadoAlm.equals("edicionAlm") && request.getParameter("TipoAlm").equals("Intel Optane") ? "selected" : ""%>>Intel Optane</option>
                      </select>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoAlm.equals("edicionAlm") ? request.getParameter("CapAlm") : "" %>"
                        name="CapAlm"
                        type="number"
                        min="0"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        value="<%= estadoAlm.equals("edicionAlm") ? request.getParameter("PreAlm") : "" %>"
                        name="PreAlm"
                        type="number"
                        step="0.01"
                        min="0"
                        style="width: 100px;"
                        class="form-control">
                    </div>
                  </td>
                  <td>
                    <%
                      if (estadoAlm.equals("listadoAlm")) {
                    %>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus-square"></i></button>
                    <%
                    }
                    
                    if (estadoAlm.equals("edicionAlm")) {
                    %>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i></button>
                  
                    <a href="database.jsp#alm">
                      <button type="button" class="btn btn-dark"><i class="fas fa-ban"></i></button>
                    </a>
                    <%
                      }
                    %>
                  </td>
                </tr>
              </form>
              <%
                ResultSet listadoAlm = s.executeQuery("SELECT * FROM `almacenamiento`");
                while (listadoAlm.next()) {
              %>
              <tr>
                <td><%= listadoAlm.getString("CodAlm")%></td>
                <td><%= listadoAlm.getString("MarAlm")%></td>
                <td><%= listadoAlm.getString("ModAlm")%></td>
                <td><%= listadoAlm.getString("TipoAlm")%></td>
                <td><%= listadoAlm.getString("CapAlm")%> GB</td>
                <td><%= listadoAlm.getString("PreAlm")%> €</td>
                <td>
                  <a
                    class="btn btn-warning"
                    href="database.jsp?CodAlm=<%= listadoAlm.getString("CodAlm")%>&MarAlm=<%= listadoAlm.getString("MarAlm")%>&ModAlm=<%= listadoAlm.getString("ModAlm")%>&TipoAlm=<%= listadoAlm.getString("TipoAlm")%>&CapAlm=<%= listadoAlm.getString("CapAlm")%>&PreAlm=<%= listadoAlm.getString("PreAlm")%>#alm" role="button"><i class="fas fa-pen"></i></a>
                  <a class="btn btn-danger" href="borrarbd.jsp?CodAlm=<%= listadoAlm.getString("CodAlm")%>" role="button"><i class="fas fa-trash-alt"></i></a>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>