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
    
      String userName = request.getParameter("user-name");
      String userLastName = request.getParameter("user-lastName");
      String userMail = request.getParameter("user-email");
      String userImg = request.getParameter("user-img");
      String userPass = request.getParameter("user-pass");
      String userRepeatPass = request.getParameter("user-repeatpass");

      session.setAttribute("user-name-sign", userName);
      session.setAttribute("user-lastName-sign", userLastName);
      session.setAttribute("user-email-sign", userMail);
      session.setAttribute("user-img-sign", userImg);
      session.setAttribute("user-pass-sign", userPass);
      session.setAttribute("user-repeatpass-sign", userRepeatPass);

      if (userRepeatPass.equals(userPass)) {
        insercion = "INSERT INTO `usuarios`(`NomUsu`, `apeUsu`, `mailUsu`, `PassUsu`, `imgUsu`) ";
        insercion += "VALUES ('";
        insercion += userName + "', '";
        insercion += userLastName + "', '";
        insercion += userMail + "', '";
        insercion += userPass + "', '";
        insercion += userImg + "')";

        s.execute(insercion);
        conexion.close();
        response.sendRedirect("index.jsp");
      } else {
        session.setAttribute("signupErr", "true");
        response.sendRedirect("login.jsp");
        conexion.close();
      }
    %>
  </body>
</html>