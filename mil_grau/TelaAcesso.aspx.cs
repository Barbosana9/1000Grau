using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace mil_grau
{
    public partial class TelaAcesso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            string codigo = txtCod.Text;

            string Nome = null, codArduino = null;

            if (codigo == "")
            {
                lblErro.Text = "Preencha um Código";
            }
            else
            {

                using (SqlConnection conn = new SqlConnection("Server=tcp:milgrau.database.windows.net,1433;Initial Catalog=cardapio;Persist Security Info=False;User ID=picanha;Password=info@211;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30"))
                {
                    conn.Open();

                    // Cria um comando para selecionar registros da tabela, trazendo todas as pessoas que nasceram depois de 1/1/1900
                    using (SqlCommand cmd = new SqlCommand("select * from Acesso where Cod_arduino = "+codigo, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            //Obtém os registros, um por vez
                            while (reader.Read() == true)
                            {

                                Nome = reader["Nome"].ToString();
                                codArduino = reader["Cod_arduino"].ToString();
                            }
                        }
                    }
                }

                if(Nome == "" && codArduino == "")
                {
                    lblErro.Text = "Código não localizado";
                } else
                {
                    Response.Redirect("grelha.aspx");
                }

            }
        }
    }
}