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

        <form id="form1" runat ="server">
            
            <img class="mb-4" src="#" alt="" width="72" height="72">             
            
            <br />
            
            <label for="inputID" class="id">ID </label >    
            

            <asp:Textbox runat="server"  ID="txtCod" class="form-control" placeholder="Codigo Arduino"/> 
            
            <asp:Label runat="server" ID="lblErro" /> 
            

            <br /> <br />
            <asp:Button runat="server" ID="btnLogar" Text="Entrar" OnClick="btnLogar_Click" class="entrar"/>


        </form>
      </div>
 
  </body>
</html>