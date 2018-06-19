<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroReceita.aspx.cs" Inherits="mil_grau.Receita" %>

<!DOCTYPE html>
<meta name='viewport' content='width=device-width, initial-scale=1' />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receita</title>
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="css\bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css\bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css\index.css" type="text/css" />
    <link rel="stylesheet" href="css\grelha.css" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblNomeReceita" Text="Nome Receita" runat="server"></asp:Label>
            <asp:TextBox ID="txtNomeReceita" Text="" runat="server"></asp:TextBox>
            <asp:Label ID="ErroNome" Text="" runat="server"></asp:Label>


            <asp:Label ID="lblTempoReceita" Text="Minutos de preparo" runat="server"></asp:Label>
            <asp:TextBox ID="txtTempoReceita" Text="" runat="server"></asp:TextBox>
            <asp:Label ID="ErroTempo" Text="" runat="server"></asp:Label>


            <asp:Label ID="lblTemperaturaMinima" Text="Temperatura Minima" runat="server"></asp:Label>
            <asp:TextBox ID="txtTemperaturaMinima" Text="" runat="server"></asp:TextBox>
            <asp:Label ID="ErroMinima" Text="" runat="server"></asp:Label>


            <asp:Label ID="lblTemperaturaMaxima" Text="Temperatura Maxima" runat="server"></asp:Label>
            <asp:TextBox ID="txtTemperaturaMaxima" Text="" runat="server"></asp:TextBox>
            <asp:Label ID="ErroMaxima" Text="" runat="server"></asp:Label>


            <asp:Button Text="Cadastrar" runat="server" ID="btnCadastrar" OnClick="btnCadastrar_Click" />

        </div>
    </form>
    <script type="text/javascript" src="js\bootstrap.bundle.js"></script>
    <script type="text/javascript" src="js\bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js\jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js\index.js"></script>
    <script type="text/javascript" src="js\grelha.js"></script>
</body>
</html>
