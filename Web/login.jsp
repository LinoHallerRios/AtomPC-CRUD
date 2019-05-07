<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="css/img/atom.png" type="image/gif" sizes="16x16">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
    <script src="js/myjs.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
            integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
    </script>
    <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Atom PC</title>
  </head>

  <body style="background: #007bff; background: linear-gradient(to right, #0062E6, #33AEFF);">
    <%  session.setAttribute("islogin", "false");
      if (((String) (session.getAttribute("signupErr"))).equals("false")) {
    %>
    <div id="logreg-forms" class="p-3" style="border: 0; border-radius: 1rem; box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);">
      <form action="loginCheck.jsp" class="form-signin">
        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Iniciar sesión</h1>
        <input type="email" style="height: auto; border-radius: 2rem;" name="inputEmail" class="form-control mb-3" placeholder="Correo electrónico" required=""
               autofocus="">
        <input type="password" style="height: auto; border-radius: 2rem;" name="inputPassword" class="form-control mb-3" placeholder="Contraseña" required="">
        <% if (((String) (session.getAttribute("loginErr"))).equals("true")) { %>
        <p style="color: red;">Inicio de sesión incorrecto</p>
        <% } %>
        <button class="btn btn-primary btn-block" style="font-size: 80%;border-radius: 5rem;letter-spacing: .1rem;font-weight: bold;padding: 1rem;transition: all 0.2s;" type="submit"><i class="fas fa-sign-in-alt"></i> Entrar</button>
        <hr>
        <button class="btn btn-info btn-block" style="font-size: 80%;border-radius: 5rem;letter-spacing: .1rem;font-weight: bold;padding: 1rem;transition: all 0.2s;" type="button" id="btn-signup"><i class="fas fa-user-plus"></i>
          Registrar cuenta nueva</button>
      </form>
      <form action="signup.jsp" class="form-signup">
        <input type="text" style="height: auto; border-radius: 2rem;" name="user-name" class="form-control" placeholder="Nombre" required="" autofocus="">
        <input type="text" style="height: auto; border-radius: 2rem;" name="user-lastName" class="form-control" placeholder="Apellidos" required="" autofocus="">
        <input type="email" style="height: auto; border-radius: 2rem;" name="user-email" class="form-control" placeholder="Correo electrónico" required autofocus="">
        <input type="text" style="height: auto; border-radius: 2rem;" name="user-img" class="form-control" placeholder="Imagen de perfil (link)" autofocus="">
        <input type="password" style="height: auto; border-radius: 2rem;" minlength="6" name="user-pass" class="form-control" placeholder="Contraseña" required
               autofocus="">
        <input type="password" style="height: auto; border-radius: 2rem;" minlength="6" name="user-repeatpass" class="form-control" placeholder="Repetir contraseña"
               required autofocus="">
        <button class="btn btn-primary btn-block" style="font-size: 80%;border-radius: 5rem;letter-spacing: .1rem;font-weight: bold;padding: 1rem;transition: all 0.2s;" type="submit"><i class="fas fa-user-plus"></i>
          Resgistrarse</button>
        <a href="login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Atrás</a>
      </form>
      <br>
    </div>
    <% } else {%>
    <div id="logreg-forms">
      <form action="loginCheck.jsp" class="form-signin">
        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Iniciar sesión</h1>
        <input type="email" style="height: auto; border-radius: 2rem;" name="inputEmail" class="form-control mb-3" placeholder="Correo electrónico" required=""
               autofocus="">
        <input type="password" style="height: auto; border-radius: 2rem;" name="inputPassword" class="form-control mb-3" placeholder="Contraseña" required="">
        <% if (((String) (session.getAttribute("loginErr"))).equals("true")) { %>
        <p style="color: red;">Inicio de sesión incorrecto</p>
        <% } %>
        <button class="btn btn-primary btn-block" style="font-size: 80%;border-radius: 5rem;letter-spacing: .1rem;font-weight: bold;padding: 1rem;transition: all 0.2s;" type="submit"><i class="fas fa-sign-in-alt"></i> Entrar</button>
        <hr>
        <button class="btn btn-info btn-block" style="font-size: 80%;border-radius: 5rem;letter-spacing: .1rem;font-weight: bold;padding: 1rem;transition: all 0.2s;" type="button" id="btn-signup"><i class="fas fa-user-plus"></i>
          Registrar cuenta nueva</button>
      </form>
      <form action="signup.jsp" class="form-signup">
        <input type="text" style="height: auto; border-radius: 2rem;" value="<%= session.getAttribute("user-name-sign")%>" name="user-name" class="form-control"
               placeholder="Nombre completo" required="" autofocus="">
        <input type="text" style="height: auto; border-radius: 2rem;" value="<%= session.getAttribute("user-lastName-sign")%>" name="user-lastName"
               class="form-control" placeholder="Apellidos" required="" autofocus="">
        <input type="email" style="height: auto; border-radius: 2rem;" value="<%= session.getAttribute("user-email-sign")%>" name="user-email" class="form-control"
               placeholder="Correo electrónico" required autofocus="">
        <input type="text" style="height: auto; border-radius: 2rem;" value="<%= session.getAttribute("user-img-sign")%>" name="user-img" class="form-control"
               placeholder="Imagen de perfil (link)" autofocus="">
        <input type="password" style="height: auto; border-radius: 2rem;" minlength="6" name="user-pass" class="form-control" placeholder="Contraseña" required
               autofocus="">
        <input type="password" style="height: auto; border-radius: 2rem;" minlength="6" name="user-repeatpass" class="form-control" placeholder="Repetir contraseña"
               required autofocus="">
        <% if (((String) (session.getAttribute("signupErr"))).equals("true")) { %>
        <p style="color: red;">Las contraseñas no coinciden</p>
        <% } %>
        <button class="btn btn-primary btn-block" style="font-size: 80%;border-radius: 5rem;letter-spacing: .1rem;font-weight: bold;padding: 1rem;transition: all 0.2s;" type="submit"><i class="fas fa-user-plus"></i>
          Resgistrarse</button>
        <a href="login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Atrás</a>
      </form>
      <br>
    </div>
    <% }%>
    <script>
      <%
      if (((String)(session.getAttribute("signupErr"))).equals("true")) {
        session.setAttribute("signupErr", "false"); %>
        $('#logreg-forms .form-signin').toggle(); // display:block or none
        $('#logreg-forms .form-signup').toggle(); // display:block or none
      <% } %>
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <script src="./js/scripts.js"></script>
  </body>

</html>