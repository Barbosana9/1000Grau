<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grelha.aspx.cs" Inherits="mil_grau.grelha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css\bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css\bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css\index.css" type="text/css" />
    <link rel="stylesheet" href="css\grelha.css" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">

        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
            <h5 class="my-0 mr-md-auto font-weight-normal">Mil Grau</h5>
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="#">Home</a>
                <a class="p-2 text-dark" href="#">Receitas</a>
                <a class="p-2 text-dark" href="institucional.aspx">Institucional</a>

            </nav>
            <a class="btn btn-outline-primary" href="#">Sair</a>
        </div>

        <div>

            <div class="container page page-active" id="main" runat="server">
                <div class="row">
                    <div class="col-10">
                        <h1>Grelha <span id="displayTemp" class="badge badge-primary">
                            <asp:Label Text="0.00" runat="server" ID="average"/></span>
                        </h1>
                    </div>

                    <div class="col-2">
                        <asp:Button runat="server" Text="Novo Preparo" OnClick="btnNovoPreparo_Click" id="btnNovoPreparo" class="btn btn-outline-dark"></asp:Button>
                       
                    </div>

                </div>
                
                <div class="row">
                    <div class="col-12">

                        <div class="chart" id="chart">

                            <div id="curve_chart" style="width:100%; height:30%;"></div>

                        </div>
                        
                    </div>
                </div>

                <div class="row infos">
                        
                        <div class="col">
                            <h6><span class="badge badge-info">Minima: <asp:Label runat="server" ID="LBLminima" Text="0.00 ºC" /></span></h6>
                        </div>
                        <div class="col">
                            <h6><span class="badge badge-info">1 Quartil: <asp:Label ID="LBL1quartil" Text="0.00 ºC" runat="server" /></span></h6>
                        </div>
                        <div class="col">
                            <h6><span class="badge badge-info">Media: <asp:Label ID="LBLmedia" Text="0.00 ºC" runat="server" /></span></h6>
                        </div>
                        <div class="col">
                            <h6><span class="badge badge-info">Moda: <asp:Label ID="LBLmoda" Text="0.00 ºC" runat="server" /></span></h6>
                        </div>
                        <div class="col">
                            <h6><span class="badge badge-info">Mediana <asp:Label ID="LBLmediana" Text="0.00 ºC" runat="server" /></span></h6>
                        </div>
                        <div class="col">
                            <h6><span class="badge badge-info">2 Quartil <asp:Label ID="LBL2quartil" Text="0.00 ºC" runat="server" /></span></h6>
                        </div>
                        <div class="col">
                            <h6><span class="badge badge-info">Maxima: <asp:Label ID="LBLmaxima" Text="0.00 ºC" runat="server" /></span></h6>
                        </div>
                    
                    </div>
              </div>

        </div>

        <div class="novaReceita" id="novaReceitaPagina" runat="server">
             

            <div class="container">

            <div class="row">

                <div class="col-12">

                    <asp:Button runat="server" OnClick="BTNfecharSelecionarReceita_Click"  ID="BTNfecharSelecionarReceita" CssClass="btn btn-danger" Text="Fechar" />

                </div>

            </div>

                <div class="row">

                    <div class="dropdown">
                    
                        <asp:DropDownList ID="DDLreceitas" OnSelectedIndexChanged="DDLreceitas_SelectedIndexChanged" runat="server" ></asp:DropDownList>

                    </div>
                </div>
               </div>
        </div>

    <script type="text/javascript" src="js\bootstrap.bundle.js"></script>
    <script type="text/javascript" src="js\bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js\jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js\index.js"></script>
    <script type="text/javascript" src="js\grelha.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


    </form>
    

</body>
</html>
