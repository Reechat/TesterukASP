using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace TesterukASP.Controllers
{

    public class UserAccountController : Controller
    {
        //[Authorize(Roles = "User")]
        //private testerukdbEntities1 db = new testerukdbEntities1();
        private Models.testDBEntities db = new Models.testDBEntities();

        // GET: histories
        public ActionResult Index()
        {
            var history = db.history.Include(h => h.AspNetUsers).Include(h => h.test);
            int count = 0;
            List<Models.history> list = new List<Models.history>();
            foreach (Models.history el in history.ToList())
            {
                if (count != 0)
                {
                    if ((list[count - 1].id_test == el.id_test) && (list[count - 1].points < el.points))
                    {
                        list[count - 1] = el;
                    }
                    else list.Add(el);
                }
                else
                {
                    list.Add(el);
                }
                count++;
            }
            return View(list);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}