using Microsoft.AspNet.Identity;
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
            string userId = User.Identity.GetUserId();
            var history = db.history.Include(h => h.AspNetUsers).Include(h => h.test).Where(h => h.id_user == userId).OrderBy(h => h.id_test);

            List<Models.history> list = new List<Models.history>();
            List<Models.history> historyList = history.ToList();

            int count = 0;
            foreach (Models.history el in historyList)
            {//что-то с листом
                if (count == 0)
                {
                    list.Add(el);
                    count++;
                    continue;
                }

                if (list[count - 1].id_test == el.id_test)
                {
                    if (list[count - 1].points <= el.points)
                    {
                        list[count - 1] = el;
                    }
                }
                else
                {
                    list.Add(el);
                    count++;
                }
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