<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/atom", "root", "");
      Statement s = conexion.createStatement();
      String insercion = "";
      String codUser = "";
      String nomUser = "";
      String apeUser = "";
      String mail = "";
      String pass = "";
      String image = "";

      insercion = "SELECT * FROM usuarios WHERE mailUsu = ";
      insercion += " '";
      insercion += request.getParameter("inputEmail") + "' AND passUsu = '";
      insercion += request.getParameter("inputPassword") + "'";
      ResultSet user = s.executeQuery(insercion);
      while(user.next()) {
          codUser = user.getString("codUsu");
          nomUser = user.getString("NomUsu");
          apeUser = user.getString("apeUsu");
          mail = user.getString("mailUsu");
          pass = user.getString("passUsu");
          image = user.getString("imgUsu");
      }

      if (mail != "") {
        session.setAttribute("loginErr", "false");
        session.setAttribute("islogin", "true");
        session.setAttribute("codUser", codUser);
        session.setAttribute("nomUser", nomUser);
        session.setAttribute("apeUser", apeUser);
        session.setAttribute("mailUser", mail);
        session.setAttribute("passUser", pass);
        session.setAttribute("image", image);
        conexion.close();
        response.sendRedirect("index.jsp");
      } else {
        session.setAttribute("loginErr", "true");
        response.sendRedirect("login.jsp");
        conexion.close();
      }
    %>
  </body>
</html>