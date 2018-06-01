using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace mil_grau
{
    public class ConnectionFactory
    {

        private static string connectionString = "Server=tcp:milgrau.database.windows.net,1433;Initial Catalog=cardapio;Persist Security Info=False;User ID=picanha;Password=info@211;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30";

        public double getTempeture()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sql = "SELECT TOP 1 * FROM temperaturalog";

                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader temperaturas = command.ExecuteReader();

                double temperatura = 0.0;

                while (temperaturas.Read())
                {
                    temperatura = double.Parse(temperaturas["temperaturaLog"].ToString());
                }

                connection.Close();

                return temperatura;
            }
        }

        public bool Login(string acesso)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sql = "SELECT * FROM Acesso";

                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader CodAcessos = command.ExecuteReader();

                while (CodAcessos.Read())
                {
                    if (acesso == CodAcessos["COD_Arduino"].ToString())
                    {
                        return true;
                    }

                }

                connection.Close();

                return false;

            }

        }

        private void reverter(SqlConnection connection)
        {

            connection.Open();

            string sql = "TRUNCATE TABLE temperaturaLog;";

            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();

            connection.Close();

        }

        public List<ModelReceita> ObterReceita()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sql = "SELECT * FROM receita";

                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader receitas = command.ExecuteReader();

                List<ModelReceita> listaDeRecitas = new List<ModelReceita>();

                while (receitas.Read())
                {
                    ModelReceita receita = new ModelReceita();

                    receita.cod_receita = int.Parse(receitas["cod_receita"].ToString());
                    receita.nomeReceita = receitas["Nome"].ToString();
                    receita.maxima = double.Parse(receitas["Maxima"].ToString());
                    receita.minima = double.Parse(receitas["Minima"].ToString());
                    receita.tempo_preparo = int.Parse(receitas["Tempo_preparo"].ToString());

                    listaDeRecitas.Add(receita);
                }

                connection.Close();

                return listaDeRecitas;

            }
        }

        public ModelReceita ObterReceita(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sql = $"SELECT * FROM receita WHERE cod_receita = {id}";

                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader receitas = command.ExecuteReader();

                List<ModelReceita> listaDeRecitas = new List<ModelReceita>();

                ModelReceita receita = new ModelReceita();

                while (receitas.Read())
                {
                    receita.cod_receita = int.Parse(receitas["cod_receita"].ToString());
                    receita.nomeReceita = receitas["Nome"].ToString();
                    receita.maxima = double.Parse(receitas["Maxima"].ToString());
                    receita.minima = double.Parse(receitas["Minima"].ToString());
                    receita.tempo_preparo = int.Parse(receitas["Tempo_preparo"].ToString());  
                }

                connection.Close();

                return receita;

            }
        }
    }
}
