using System;
using System.Web.Mvc;
using PiGrupa1.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace PiGrupa1.Controllers
{
    public class GospodarstvoController : Controller
    {
        // GET
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Gospodarstvo add)
        {
            DatabaseController dbCtrl = new DatabaseController();
            dbCtrl.getConnection();
            //AddGospodarstva obj = new AddGospodarstva();
            string s1 =
                "Insert into [dbo].[gospodarstva] (ime,prezime,kontakt,email,lozinka) values (@Ime,@Prezime,@Kontakt,@Email,@Lozinka)";
            SqlCommand sqlcomm = new SqlCommand(s1);
            sqlcomm.Parameters.AddWithValue("@Ime", add.Ime);
            sqlcomm.Parameters.AddWithValue("@Prezime", add.Prezime);
            sqlcomm.Parameters.AddWithValue("@Kontakt", add.Kontakt);
            sqlcomm.Parameters.AddWithValue("@Email", add.Email);
            sqlcomm.Parameters.AddWithValue("@Lozinka", add.Lozinka);
            
            dbCtrl.executeCommand(sqlcomm);
          
            return View(add);
        }
        
    }
}
