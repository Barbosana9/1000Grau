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

                string sql = "SELECT TOP 30 * FROM temperaturalog ORDER BY id DESC ";

                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader temperaturas = command.ExecuteReader();

                double media = 0.0;

                int total = 0;

                while (temperaturas.Read())
                {
                    media += double.Parse(temperaturas["temperaturaLog"].ToString());
                    total++;
                }

                connection.Close();

                reverter(connection);

                return media / total;
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
    }
}
