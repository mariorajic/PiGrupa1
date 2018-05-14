using System.Data.SqlClient;
using System.Runtime.CompilerServices;
using System.Web.Mvc;

namespace PiGrupa1.Controllers
{
    public class DatabaseController : Controller
    {
        private SqlConnection conn;

        public void getConnection()
        {
            conn = new SqlConnection("Server=rppp.fer.hr,3000;Database=PI-10;User Id=pi10;Password=Z+N+A+L+A+C");
            conn.Open();
        }
     
        public void executeQuery(string query)
        {
            SqlCommand command = new SqlCommand(query, conn);
            command.ExecuteNonQuery();
        }

        public void executeCommand(SqlCommand sqlcomm)
        {
            sqlcomm.Connection = conn;
            sqlcomm.ExecuteNonQuery();
        }
    }
}