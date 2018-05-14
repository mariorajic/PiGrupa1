using System.Data.SqlClient;
using System.Web.Mvc;
using PiGrupa1.Models;
using System.Data;
using System.Configuration;


namespace PiGrupa1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            DatabaseController dbCtrl = new DatabaseController();
            //dbCtrl.getConnection();
           // dbCtrl.executeQuery("INSERT INTO zadruge(id, ime) VALUES(2, 'mala zadruga')");
            
            return View("Index");
        }

        [HttpPost]
        public ActionResult Index(Gospodarstvo login)
        {
            DatabaseController dbCtrl = new DatabaseController();
            dbCtrl.getConnection();
            string s1 = "Select email,lozinka from [dbo].[gospodarstva] where email=@Email and lozinka=@Lozinka ";
            SqlCommand sqlcomm = new SqlCommand(s1);
            sqlcomm.Parameters.AddWithValue("@Email", login.Email);
            sqlcomm.Parameters.AddWithValue("@Lozinka", login.Lozinka);
            SqlDataReader sdr = dbCtrl.executeSdr(sqlcomm);
            if (sdr.Read())
            {
                Session["id"] = login.Id.ToString();
                return RedirectToAction("Welcome");     
            }
            else
            {
                ViewData["Message"] = "Unijeli ste pogrešne podatke.";
            }

            return View();
        }

        public ActionResult Welcome()
        {
            if (Session["id"] != null)
            {
                return View();
            }
            else
            {
               return RedirectToAction("Index");
            }
        }

        public ActionResult Register()
        {
            return View("Register");
        }
        
        [HttpPost]
        public ActionResult Register(Gospodarstvo add)
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
            ViewBag.Message = "Uspješno ste se registrirali. Možete se prijaviti.";
            /*if(!ModelState.IsValid)
            {
                return View(add);
            }*/
            return View("Index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}