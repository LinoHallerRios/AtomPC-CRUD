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
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/atom", "root", "");
      Statement s = conexion.createStatement();
      String borrado = "";
      String volver = "";

      if ((request.getParameter("CodPro") != null)) {
        borrado = "DELETE FROM procesadores WHERE CodPro=";
        borrado += request.getParameter("CodPro");
        volver = "pro";
      }

      if ((request.getParameter("CodPla") != null)) {
        borrado = "DELETE FROM `placas base` WHERE CodPla=";
        borrado += request.getParameter("CodPla");
        volver = "pla";
      }

      if ((request.getParameter("CodRam") != null)) {
        borrado = "DELETE FROM `ram` WHERE CodRam=";
        borrado += request.getParameter("CodRam");
        volver = "ram";
      }

      if ((request.getParameter("CodFue") != null)) {
        borrado = "DELETE FROM `fuente de alimentacion` WHERE CodFue=";
        borrado += request.getParameter("CodFue");
        volver = "fue";
      }

      if ((request.getParameter("CodAlm") != null)) {
        borrado = "DELETE FROM `almacenamiento` WHERE CodAlm=";
        borrado += request.getParameter("CodAlm");
        volver = "alm";
      }

      if ((request.getParameter("CodOrd") != null)) {
        borrado = "DELETE FROM `ordenadores` WHERE CodOrd=";
        borrado += request.getParameter("CodOrd");
        volver = "ord";
      }

      s.execute(borrado);
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

      <% if (volver.equals("ord")) { %>
        location.replace("listaPC.jsp#");
      <% } %>
    </script>
  </body>
</html>
