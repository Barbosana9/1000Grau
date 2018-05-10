<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tela de login.aspx.cs" Inherits="mil_grau.Tela_de_login" %>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>NA BRASA</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin">
      <img class="mb-6" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="100" height="100">
      <h1 class="h3 mb-3 font-weight-normal">Por favor inscreva-se</h1>
      <label for="inputacesso" class="sr-only">Acesso</label>
      <input type="acesso" id="inputEmail" class="form-control" placeholder="ID Arduino" required autofocus>
      
      <%--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">--%>
        <label>
          <input type="checkbox" value="remember-me"> Lembre-se de mim
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Próxima</button>
      <p class="mt-8 mb-6 text-muted">&copy; 2017-2018</p>
    </form>
  </body>
</html