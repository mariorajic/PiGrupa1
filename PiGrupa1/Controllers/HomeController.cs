using System.Web.Mvc;

namespace PiGrupa1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            DatabaseController dbCtrl = new DatabaseController();
            dbCtrl.getConnection();
            dbCtrl.executeQuery("INSERT INTO zadruge(id, ime) VALUES(2, 'mala zadruga')");
            
            return View("Index");
        }

        public ActionResult Register()
        {
            return View("Register");
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