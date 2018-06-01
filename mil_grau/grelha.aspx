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
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
            <h5 class="my-0 mr-md-auto font-weight-normal">Mil Grau</h5>
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="#">Home</a>
                <a class="p-2 text-dark" href="#">Receitas</a>
                <a class="p-2 text-dark" href="institucional.aspx">Institucional</a>
                <a class="p-2 text-dark" href="https://nabrasa.freshdesk.com/">Suporte</a>

            </nav>
            <a class="btn btn-outline-primary" href="#">Sair</a>
        </div>

        <div class="container page page-active" id="main" runat="server">
            <div class="row">
                <div class="col-10" id="divDisplaytemp">
                    <h1>Grelha <span id="displayTemp" class="badge badge-primary">
                        <asp:Label Text="0.00" runat="server" ID="average" /></span>
                    </h1>
                </div>

                <div class="col-2">
                    <asp:Button runat="server" Text="Novo Preparo" OnClick="btnNovoPreparo_Click" ID="btnNovoPreparo" class="btn btn-outline-dark"></asp:Button>

                </div>

            </div>

            <div class="row">
                <div class="col-6">
                    <div class="chart" id="chart">
                    </div>
                </div>

                <div class="col-6" id="cardMonitor" runat="server">

                    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                            <div class="card">
                                <h5 class="card-header">
                                    <asp:Label Text="NomeReceita" ID="lblNomeReceita" runat="server"></asp:Label></h5>
                                <div class="card-body">
                                    
                                        <asp:Label Text="00:00:00" ID="lblTempoPreparo" runat="server"></asp:Label>
                                <p class="card-text">
                                        Temperatura Minima:<asp:Label Text="tempMinima" ID="lblTempMinima" runat="server"></asp:Label>
                                        <br />
                                        Temperatura Maxima:<asp:Label Text="tempMaxima" ID="lblTempMaxima" runat="server"></asp:Label>
                                        <br />
                                    </p>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

            <div class="row infos">

                <div class="col">
                    <h6><span class="badge badge-info">Minima:
                            <asp:Label runat="server" ID="LBLminima" Text="0.00 ºC" /></span></h6>
                </div>
                <div class="col">
                    <h6><span class="badge badge-info">1 Quartil:
                            <asp:Label ID="LBL1quartil" Text="0.00 ºC" runat="server" /></span></h6>
                </div>
                <div class="col">
                    <h6><span class="badge badge-info">Media:
                            <asp:Label ID="LBLmedia" Text="0.00 ºC" runat="server" /></span></h6>
                </div>
                <div class="col">
                    <h6><span class="badge badge-info">Moda:
                            <asp:Label ID="LBLmoda" Text="0.00 ºC" runat="server" /></span></h6>
                </div>
                <div class="col">
                    <h6><span class="badge badge-info">Mediana
                            <asp:Label ID="LBLmediana" Text="0.00 ºC" runat="server" /></span></h6>
                </div>
                <div class="col">
                    <h6><span class="badge badge-info">2 Quartil
                            <asp:Label ID="LBL2quartil" Text="0.00 ºC" runat="server" /></span></h6>
                </div>
                <div class="col">
                    <h6><span class="badge badge-info">Maxima:
                            <asp:Label ID="LBLmaxima" Text="0.00 ºC" runat="server" /></span></h6>
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

        <script type="text/javascript" src="js\bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js\bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js\jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js\index.js"></script>
        <script type="text/javascript" src="js\grelha.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <div>
            <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Enabled="false" runat="server" Interval="1000">
            </asp:Timer>
        </div>

    </form>


</body>
</html>
