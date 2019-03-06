<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/atom", "root", "");
      Statement s = conexion.createStatement();
      String actualizacion = "";
      String volver = "";

      if ((request.getParameter("TipoPro") != null)) {
        actualizacion = "UPDATE procesadores SET TipoPro='";
        actualizacion += request.getParameter("TipoPro");
        actualizacion += "', NomPro='";
        actualizacion += request.getParameter("NomPro");
        actualizacion += "', NumCor='";
        actualizacion += request.getParameter("NumCor");
        actualizacion += "', PrePro=";
        actualizacion += request.getParameter("PrePro");
        actualizacion += " WHERE CodPro=";
        actualizacion += request.getParameter("CodPro");
        volver = "pro";
      }

      if ((request.getParameter("MarPla") != null)) {
        actualizacion = "UPDATE `placas base` SET MarPla='";
        actualizacion += request.getParameter("MarPla");
        actualizacion += "', FacFor='";
        actualizacion += request.getParameter("FacFor");
        actualizacion += "', ModPla='";
        actualizacion += request.getParameter("ModPla");
        actualizacion += "', ChiPla='";
        actualizacion += request.getParameter("ChiPla");
        actualizacion += "', SockPla='";
        actualizacion += request.getParameter("SockPla");
        actualizacion += "', PrePla=";
        actualizacion += request.getParameter("PrePla");
        actualizacion += " WHERE CodPla=";
        actualizacion += request.getParameter("CodPla");
        volver = "pla";
      }

      if ((request.getParameter("MarcRam") != null)) {
        actualizacion = "UPDATE `ram` SET MarcRam='";
        actualizacion += request.getParameter("MarcRam");
        actualizacion += "', ModRam='";
        actualizacion += request.getParameter("ModRam");
        actualizacion += "', TipoRam='";
        actualizacion += request.getParameter("TipoRam");
        actualizacion += "', CapRam='";
        actualizacion += request.getParameter("CapRam");
        actualizacion += "', HerzRam='";
        actualizacion += request.getParameter("HerzRam");
        actualizacion += "', PreRam=";
        actualizacion += request.getParameter("PreRam");
        actualizacion += " WHERE CodRam=";
        actualizacion += request.getParameter("CodRam");
        volver = "ram";
      }

      if ((request.getParameter("MarFue") != null)) {
        actualizacion = "UPDATE `fuente de alimentacion` SET MarFue='";
        actualizacion += request.getParameter("MarFue");
        actualizacion += "', ModFue='";
        actualizacion += request.getParameter("ModFue");
        actualizacion += "', VatFue='";
        actualizacion += request.getParameter("VatFue");
        actualizacion += "', CerFue='";
        actualizacion += request.getParameter("CerFue");
        actualizacion += "', TipoFue='";
        actualizacion += request.getParameter("TipoFue");
        actualizacion += "', PreFue=";
        actualizacion += request.getParameter("PreFue");
        actualizacion += " WHERE CodFue=";
        actualizacion += request.getParameter("CodFue");
        volver = "fue";
      }

      if ((request.getParameter("MarAlm") != null)) {
        actualizacion = "UPDATE `almacenamiento` SET MarAlm='";
        actualizacion += request.getParameter("MarAlm");
        actualizacion += "', ModAlm='";
        actualizacion += request.getParameter("ModAlm");
        actualizacion += "', TipoAlm='";
        actualizacion += request.getParameter("TipoAlm");
        actualizacion += "', CapAlm='";
        actualizacion += request.getParameter("CapAlm");
        actualizacion += "', PreAlm=";
        actualizacion += request.getParameter("PreAlm");
        actualizacion += " WHERE CodAlm=";
        actualizacion += request.getParameter("CodAlm");
        volver = "alm";
      }

      s.execute(actualizacion);
      conexion.close();
    %>

    <script>
      <% if (volver.equals("pro")) { %>
        location.replace("database.jsp#procesador");
      <% } %>

      <% if (volver.equals("pla")) { %>
        location.replace("database.jsp#placabase");
      <% } %>

      <% if (volver.equals("ram")) { %>
        location.replace("database.jsp#ram");
      <% } %>

      <% if (volver.equals("fue")) { %>
        location.replace("database.jsp#fuente");
      <% } %>

      <% if (volver.equals("alm")) { %>
        location.replace("database.jsp#alm");
      <% } %>
    </script>

  </body>
</html>