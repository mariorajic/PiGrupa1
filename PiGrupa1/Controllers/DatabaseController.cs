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
            conn = new SqlConnection("Server=rppp.fer.hr,3000;Database=PI-01;User Id=pi01;Password=zvucnik+1");
            conn.Open();
        }
     
        public void executeQuery(string query)
        {
            SqlCommand command = new SqlCommand(query, conn);
            command.ExecuteNonQuery();
        }
    }
}