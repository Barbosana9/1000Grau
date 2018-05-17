<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grelha.aspx.cs" Inherits="mil_grau.grelha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css\bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css\bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css\index.css" type="text/css" />

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

            <div class="container" id="main">
                <div class="row">
                    <div class="col-12">
                        <h1>Grelha <span id="displayTemp" class="badge badge-primary">
                            <asp:Label Text="0.00" runat="server" ID="average"/></span>
                             

                        </h1>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-12">

                        <div class="chart" id="chart">

                            <div id="curve_chart" style="width:50%;"></div>

                        </div>

                    </div>
                </div>


                <div class="row">
                    <div class="col">
                        <asp:Button runat="server" Text="Novo Preparo" OnClick="btnNovoPreparo_Click" id="btnNovoPreparo" class="btn btn-outline-dark"></asp:Button>
                    </div>

                </div>

                <!--botão para adicionar um novo preparo-->

            </div>

        </div>
    </form>
    <script type="text/javascript" src="js\bootstrap.bundle.js"></script>
    <script type="text/javascript" src="js\bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js\jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js\index.js"></script>
    <script type="text/javascript" src="js\grelha.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


</body>
</html>
