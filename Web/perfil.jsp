<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ATOM PC</title>
  <link rel="icon" href="css/img/atom.png" type="image/gif" sizes="16x16">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
    integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <link href="css/perfil.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
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
</head>

<body>
<% if (((String) (session.getAttribute("islogin"))).equals("true")) { %>
  <div class="container-fluid">
    <div class="row no-gutter">
      <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
      <div class="col-md-8 col-lg-6">
        <a href="index.jsp">
          <span style="margin-top: 0.4vw; margin-right: 2vw; position: absolute; top: 8vw; left: 20.4vw">
            <img src="css/img/atom ico.png" alt="" height="43vw" id="gif">
          </span></a>
        <div class="login d-flex align-items-center py-5">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-md-9 col-lg-8 mx-auto box p-5">
                <div style="text-align: center">
                  <img
                    src="<%= session.getAttribute("image") %>"
                    width="128px" height="128px" alt="profile picture" class="rounded-circle">
                  <h3 class="login-heading mb-4 mt-3">Bienvenido! <%= session.getAttribute("nomUser") %> </h3>
                  <hr>
                </div>
                <div class="row justify-content-center">
                  <div class="col-md-3" style="text-align: left">
                    <p><b>Nombre:</b></p>
                    <p><b>Apellidos:</b></p>
                    <p><b>Correo:</b></p>
                  </div>
                  <div class="col-md-3" style="text-align: left">
                    <p><%= session.getAttribute("nomUser") %></p>
                    <p><%= session.getAttribute("apeUser") %></p>
                    <p><%= session.getAttribute("mailUser") %></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<% } else { %>
<% response.sendRedirect("index.jsp"); }%>
</body>

</html>