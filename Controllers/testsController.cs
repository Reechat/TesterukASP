using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace TesterukASP.Controllers
{
    public class TestsController : Controller
    {

        // GET: Tests
        public ActionResult Test1()
        {
            ViewBag.IdUser = User.Identity.GetUserId();
            return View();
        }
        public ActionResult Test2()
        {
            ViewBag.IdUser = User.Identity.GetUserId();
            return View();
        }
        public ActionResult Test3()
        {
            ViewBag.IdUser = User.Identity.GetUserId();
            return View();
        }
    }
}