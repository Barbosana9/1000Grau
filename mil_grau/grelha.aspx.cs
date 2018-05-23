using System;
using System.Collections.Generic;
using System.Linq;
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
        }

        protected void btnNovoPreparo_Click(object sender, EventArgs e)
        {
            btnNovoPreparo.Visible = false;
            main.Visible = false;
            novaReceitaPagina.Visible = true;

            ConnectionFactory bancoDeDados = new ConnectionFactory();

            List<ModelReceita> receitas = bancoDeDados.ObterReceita();
            
            foreach(ModelReceita receita in receitas)
            {

                ListItem i = new ListItem(receita.nomeReceita, receita.cod_receita.ToString(), true);
                DDLreceitas.Items.Add(i);

            }

                       
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
    }
}