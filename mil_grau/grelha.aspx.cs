using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace mil_grau
{
    public partial class grelha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            novaReceitaPagina.Visible = false;

            if (!IsPostBack)
            {
                ConnectionFactory bancoDeDados = new ConnectionFactory();

                List<ModelReceita> receitas = bancoDeDados.ObterReceita();

                foreach (ModelReceita receita in receitas)
                {

                    ListItem i = new ListItem(receita.nomeReceita, receita.cod_receita.ToString(), true);
                    DDLreceitas.Items.Add(i);

                }

                cardMonitor.Visible = false;
                Timer1.Enabled = false;
            }
        }

        protected void btnNovoPreparo_Click(object sender, EventArgs e)
        {
            btnNovoPreparo.Visible = false;
            main.Visible = false;
            novaReceitaPagina.Visible = true;
                                  
        }

        [System.Web.Services.WebMethod]
        public static double getTempeture()
        {
            ConnectionFactory bancoDeDados = new ConnectionFactory();

            return double.Parse(bancoDeDados.getTempeture().ToString());
        }

        protected void DDLreceitas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void BTNfecharSelecionarReceita_Click(object sender, EventArgs e)
        {
            novaReceitaPagina.Visible = false;
            main.Visible = true;
            btnNovoPreparo.Visible = true;
        }

        protected void BTNSelecionarReceita_Click(object sender, EventArgs e)
        {
            main.Visible = true;
            cardMonitor.Visible = true;
            
            ConnectionFactory connection = new ConnectionFactory();

            ModelReceita receitaSelecionada = connection.ObterReceita(int.Parse(DDLreceitas.SelectedItem.Value));

            lblNomeReceita.Text = receitaSelecionada.nomeReceita;
            lblTempMinima.Text = (receitaSelecionada.minima.ToString()+ " ºC");
            lblTempMaxima.Text = (receitaSelecionada.maxima.ToString()+ " ºC");

            Session["tempoPreparo"] = ((receitaSelecionada.tempo_preparo * 60) * 1000);

            Timer1.Interval = 1000;
            Timer1.Enabled = true;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            double tempoRestante = (double.Parse(Session["tempoPreparo"].ToString()) - 1000.0);
            Session["tempoPreparo"] = tempoRestante;

            double real = (tempoRestante / 1000)/60;

            lblTempoPreparo.Text = real.ToString()+" Tempo Restante: " + tempoRestante.ToString(); 
            UpdatePanel1.Update();
        }
    }
}