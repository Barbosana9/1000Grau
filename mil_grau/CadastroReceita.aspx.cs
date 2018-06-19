using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mil_grau
{
    public partial class Receita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            ModelReceita modelReceita = Validar();

            if (modelReceita.nomeReceita != "" || modelReceita.maxima != null || modelReceita.minima != null || modelReceita.tempo_preparo != null)
            {
                ConnectionFactory connection = new ConnectionFactory();
                connection.InserirReceita(modelReceita);

                txtNomeReceita.Text = "";
                txtTemperaturaMinima.Text = "";
                txtTemperaturaMaxima.Text = "";
                txtTemperaturaMaxima.Text = "";

            }
        }

        private ModelReceita Validar()
        {
            ModelReceita modelReceita = new ModelReceita();

            if (txtNomeReceita.Text == "")
            {
                ErroNome.Text = "Insira o Nome da Receita";
                txtNomeReceita.Text = "";
            }
            else
            {
                ErroNome.Text = "";
                modelReceita.nomeReceita = txtNomeReceita.Text;
            }


            if (txtTemperaturaMinima.Text != "")
            {
                try
                {
                    modelReceita.minima = int.Parse(txtTemperaturaMinima.Text);
                }
                catch (FormatException)
                {
                    ErroMinima.Text = "Insira a temperatura em numeros inteiros";
                    txtTemperaturaMinima.Text = "";
                }
            }
            else
            {
                ErroMinima.Text = "Insira uma Temperatura Minima";
            }

            if (txtTemperaturaMaxima.Text != "")
            {
                try
                {
                    modelReceita.maxima = int.Parse(txtTemperaturaMaxima.Text);
                }
                catch (FormatException)
                {
                    ErroMaxima.Text = "Insira a temperatura em numeros inteiros";
                    txtTemperaturaMaxima.Text = "";
                }
            }
            else
            {
                ErroMaxima.Text = "Insira uma Temperatura Maxima";
            }

            if (txtTempoReceita.Text != "")
            {
                try
                {
                    modelReceita.tempo_preparo = int.Parse(txtTempoReceita.Text);
                }
                catch (FormatException)
                {
                    ErroTempo.Text = "Insira o Tempo em minutos";
                }

            }
            else
            {
                ErroTempo.Text = "Insira o Tempo de Preparo";
            }

            return modelReceita;
        }
    }
}