using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SGUMusicShop.Models;

namespace SGUMusicShop.Controllers
{
    public class HomeController : Controller
    {
        QLSSNDKEntities _db = new QLSSNDKEntities();
        // GET: Home
        public ActionResult Index()
        {
            return View(_db.SanPhams.ToList());
        }
    }
}