<%@page import="java.sql.ResultSet"%>
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
      String insercion = "";
      String volver = "";

      if ((request.getParameter("TipoPro") != null)) {
        insercion = "INSERT INTO `procesadores`(`TipoPro`, `NomPro`, `NumCor`, `PrePro`) ";
        insercion += "VALUES ('";
        insercion += request.getParameter("TipoPro") + "', '";
        insercion += request.getParameter("NomPro") + "', '";
        insercion += request.getParameter("NumCor") + "', ";
        insercion += request.getParameter("PrePro") + ")";
        volver = "pro";
      }

      if ((request.getParameter("MarPla") != null)) {
        insercion = "INSERT INTO `placas base`(`MarPla`, `FacFor`, `ModPla`, `ChiPla`, `SockPla`, `PrePla`) ";
        insercion += "VALUES ('";
        insercion += request.getParameter("MarPla") + "', '";
        insercion += request.getParameter("FacFor") + "', '";
        insercion += request.getParameter("ModPla") + "', '";
        insercion += request.getParameter("ChiPla") + "', '";
        insercion += request.getParameter("SockPla") + "', ";
        insercion += request.getParameter("PrePla") + ")";
        volver = "pla";
      }

      if ((request.getParameter("MarcRam") != null)) {
        insercion = "INSERT INTO `ram`(`MarcRam`, `ModRam`, `TipoRam`, `CapRam`, `HerzRam`, `PreRam`) ";
        insercion += "VALUES ('";
        insercion += request.getParameter("MarcRam") + "', '";
        insercion += request.getParameter("ModRam") + "', '";
        insercion += request.getParameter("TipoRam") + "', '";
        insercion += request.getParameter("CapRam") + "', '";
        insercion += request.getParameter("HerzRam") + "', ";
        insercion += request.getParameter("PreRam") + ")";
        volver = "ram";
      }

      if ((request.getParameter("MarFue") != null)) {
        insercion = "INSERT INTO `fuente de alimentacion`(`MarFue`, `ModFue`, `VatFue`, `CerFue`, `TipoFue`, `PreFue`) ";
        insercion += "VALUES ('";
        insercion += request.getParameter("MarFue") + "', '";
        insercion += request.getParameter("ModFue") + "', '";
        insercion += request.getParameter("VatFue") + "', '";
        insercion += request.getParameter("CerFue") + "', '";
        insercion += request.getParameter("TipoFue") + "', ";
        insercion += request.getParameter("PreFue") + ")";
        volver = "fue";
      }

      if ((request.getParameter("MarAlm") != null)) {
        insercion = "INSERT INTO `almacenamiento`(`MarAlm`, `ModAlm`, `TipoAlm`, `CapAlm`, `PreAlm`) ";
        insercion += "VALUES ('";
        insercion += request.getParameter("MarAlm") + "', '";
        insercion += request.getParameter("ModAlm") + "', '";
        insercion += request.getParameter("TipoAlm") + "', '";
        insercion += request.getParameter("CapAlm") + "', ";
        insercion += request.getParameter("PreAlm") + ")";
        volver = "alm";
      }

      if ((request.getParameter("NomOrd") != null)) {
        insercion = "INSERT INTO `ordenadores`(`NomOrd`, `CodPro`, `CodPla`, `CodRam`, `CodFue`, `CodAlm`) ";
        insercion += "VALUES ('";
        insercion += request.getParameter("NomOrd") + "', '";
        insercion += request.getParameter("CodPro") + "', '";
        insercion += request.getParameter("CodPla") + "', '";
        insercion += request.getParameter("CodRam") + "', '";
        insercion += request.getParameter("CodFue") + "',";
        insercion += request.getParameter("CodAlm") + ")";
        volver = "ord";
      }

      s.execute(insercion);
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
        location.replace("listaPC.jsp");
      <% } %>
    </script>
    
  </body>
</html>
