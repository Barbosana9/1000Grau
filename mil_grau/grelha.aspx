<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grelha.aspx.cs" Inherits="mil_grau.grelha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monitor</title>
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="css\bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css\bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css\index.css" type="text/css" />
    <link rel="stylesheet" href="css\grelha.css" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header">
                <div class="mdl-layout__header-row">
                    <!-- Title -->
                    <span class="mdl-layout-title">NA BRASA</span>
                    <!-- Add spacer, to align navigation to the right -->
                    <div class="mdl-layout-spacer"></div>
                    <!-- Navigation. We hide it in small screens. -->
                    <nav class="mdl-navigation mdl-layout--large-screen-only">
                        <a class="mdl-navigation__link" href="#">Home</a>
                        <a class="mdl-navigation__link" href="#">Receitas</a>
                        <a class="mdl-navigation__link" href="institucional.aspx">Institucional</a>
                        <a class="mdl-navigation__link" href="https://nabrasa.freshdesk.com/">Suporte</a>
                    </nav>
                </div>
            </header>

            <div class="mdl-layout__drawer">
                <nav class="mdl-navigation">
                    <a class="mdl-navigation__link" href="#">Home</a>
                    <a class="mdl-navigation__link" href="#">Receitas</a>
                    <a class="mdl-navigation__link" href="institucional.aspx">Institucional</a>
                    <a class="mdl-navigation__link" href="https://nabrasa.freshdesk.com/">Suporte</a>
                </nav>
            </div>

            <main class="mdl-layout__content">
                <div class="page-content">
                    <!-- Your content goes here -->

                    <div class="page page-active" id="main" runat="server">
                        <div class="mdl-grid">

                            <div class="mdl-cell mdl-cell--10-col" id="divDisplaytemp">
                                <h2 class="lblMonitor">Grelha <span id="displayTemp" class="badge badge-primary">
                                    <asp:Label Text="0.00" runat="server" ID="average" /></span>
                                </h2>
                            </div>

                            <div class="mdl-cell mdl-cell--2-col">
                                <asp:Button runat="server" Text="Iniciar Preparo" OnClick="btnNovoPreparo_Click" ID="btnNovoPreparo" class="btn btn-outline-dark"></asp:Button>

                            </div>

                        </div>

                        <div class="mdl-grid">


                            <div class="mdl-cell mdl-cell--4-col" id="cardMonitor" runat="server">

                                <div class="card">
                                    <h5 class="card-header">
                                        <asp:Label Text="NomeReceita" ID="lblNomeReceita" runat="server"></asp:Label></h5>
                                    <div class="card-body">
                                        
                                        <h5 class="card-title">

                                            <label for="lblTempoPreparo">Tempo Restante: </label>
                                            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:Label Text="00:00:00" ID="lblTempoPreparo" runat="server"></asp:Label>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        
                                            <label for="lblTempMinama">Temperatura Minima: </label>
                                            <asp:Label Text="tempMinima" ID="lblTempMinima" runat="server"></asp:Label>
                                            
                                            <label for="lbltempMaxima">Temperatura Maxima: </label>
                                            <asp:Label Text="tempMaxima" ID="lblTempMaxima" runat="server"></asp:Label>
                                            
                                        </h5>
                                    </div>
                                </div>

                            </div>


                            <div class="mdl-cell mdl-cell--6-col mdl-cell--6-col-phone mdl-cell-8-col-tablet" runat="server" id="chart_div">
                                <div class="chart" id="chart" style="width: 100%; height: 100%;">
                                </div>
                            </div>

                            <div class="mdl-cell mdl-cell--2-col-desktop mdl-cell--6-col-phone mdl-cell--8-col-tablet infos">
                                <ul class="list-group ">
                                    <li class="list-group-item">Minima:
                                        <asp:Label runat="server" ID="LBLminima" Text="0.00 ºC" /></li>
                                    <li class="list-group-item">Quartil 1:
                                        <asp:Label ID="LBL1quartil" Text="0.00 ºC" runat="server" /></li>
                                    <li class="list-group-item">Media:
                                        <asp:Label ID="LBLmedia" Text="0.00 ºC" runat="server" /></li>
                                    <li class="list-group-item">Moda:
                                        <asp:Label ID="LBLmoda" Text="0.00 ºC" runat="server" /></li>
                                    <li class="list-group-item">Mediana:
                                        <asp:Label ID="LBLmediana" Text="0.00 ºC" runat="server" /></li>
                                    <li class="list-group-item">Quartil 2: 
                                        <asp:Label ID="LBL2quartil" Text="0.00 ºC" runat="server" /></li>
                                    <li class="list-group-item">Maxima:
                                        <asp:Label ID="LBLmaxima" Text="0.00 ºC" runat="server" /></li>
                                </ul>
                            </div>

                        </div>

                    </div>


                    <div class="novaReceita" id="novaReceitaPagina" runat="server">


                        <div class="container">


                            <div class="row">

                                <div class="col-12">

                                    <h3 class="LabelNovaReceita">Escolha uma Receita</h3>

                                </div>
                            </div>

                            <div class="row">

                                <div class="col-12">

                                    <asp:DropDownList ID="DDLreceitas" OnSelectedIndexChanged="DDLreceitas_SelectedIndexChanged" CssClass="ListaReceitas" runat="server"></asp:DropDownList>

                                </div>
                            </div>

                            <div class="row">

                                <div class="col-6">

                                    <asp:Button runat="server" OnClick="BTNSelecionarReceita_Click" ID="BTNSelecionarReceita" CssClass="btn btn-primary" Text="Monitorar" />

                                </div>

                                <div class="col-6">

                                    <asp:Button runat="server" OnClick="BTNfecharSelecionarReceita_Click" ID="BTNfecharSelecionarReceita" CssClass="btn btn-danger" Text="Fechar" />

                                </div>


                            </div>
                        </div>
                    </div>

                </div>

            </main>
        </div>





        <script type="text/javascript" src="js\bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js\bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js\jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js\index.js"></script>
        <script type="text/javascript" src="js\grelha.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="https://code.getmdl.io/1.3.0/material.min.js"></script>

        <div>
            <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Enabled="false" runat="server" Interval="1000">
            </asp:Timer>
        </div>

    </form>


</body>
</html>
