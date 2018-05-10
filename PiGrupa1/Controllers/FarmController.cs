using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Web.Mvc;

namespace PiGrupa1.Controllers
{
    public class FarmController : Controller
    {
        // GET
        public ActionResult CreateFarm()
        {
            return View();
        }
    }
}