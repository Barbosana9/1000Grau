<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TelaAcesso.aspx.cs" Inherits="mil_grau.TelaAcesso" %>


<!doctype html>
<html lang="en">
  <head>
    <link href="css/TelaAcesso.css" rel="stylesheet" type ="text/css" />
    <title>Na Brasa</title>
  </head>
    
  <body class="text-center" >
     <div>
         <h1 class="acesso"> Acesso </h1>
        <form class="form-signin" action="institucional.html">   
            <img class="mb-4" src="#" alt="" width="72" height="72">             
            
            <br />
            
            <label for="inputID" class="id">ID </label >                 
            <input id="inputid" class="form-control" placeholder="Codigo Arduino" >                                
            <br /> <br />
            <button class="entrar" type="submit"> Entrar </button>
            
        </form>
      </div>
 
  </body>
</html>