﻿using System;
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
                Session.Abandon();
                Session.Clear();
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
            lblTempMinima.Text = (receitaSelecionada.minima.ToString()+ " Graus Celsius");
            lblTempMaxima.Text = (receitaSelecionada.maxima.ToString()+ " Graus Celsius");

            Session["tempoPreparo"] = ((receitaSelecionada.tempo_preparo * 60) * 1000);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "clearControls", $"definirTemperaturas({receitaSelecionada.minima.ToString()},{receitaSelecionada.maxima.ToString()});", true);

            //tudo relacionado a cookies
            //HttpCookie cookie = new HttpCookie("tempoPreparo", ((receitaSelecionada.tempo_preparo * 60) * 1000).ToString());
            //cookie.Expires = DateTime.MinValue;
            //response.Cookies.Set(cookie);

            Timer1.Interval = 1000;
            Timer1.Enabled = true;

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //tudo relacionado a cookies
            //HttpCookie cookie = Request.Cookies["tempoPreparo"];
            //double tempoRestante = (double.Parse(cookie.Value.ToString())-1000.0);
            //cookie.Expires = DateTime.MinValue;
            //cookie.Value = tempoRestante.ToString();
            //Response.Cookies.Set(cookie);

            double tempoRestante = (double.Parse(Session["tempoPreparo"].ToString()) - 1000.0);
            Session["tempoPreparo"] = tempoRestante;

            DateTime restante = new DateTime(2018, 1, 1, 0, 0, 0);

            restante = restante.AddMilliseconds(tempoRestante);
            
            lblTempoPreparo.Text = restante.ToString("HH:mm:ss");

            UpdatePanel1.Update();   

            if (tempoRestante <= 0)
            {
                Timer1.Enabled = false;
                finalizarPreparo();
            }
        }

        private void finalizarPreparo()
        {
            lblTempoPreparo.Text = "Retire Agora";
        }
    }
}