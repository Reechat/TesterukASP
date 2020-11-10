using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TesterukASP;

namespace TesterukASP.Controllers
{
    public class historiesController : Controller
    {
        private testerukdbEntities1 db = new testerukdbEntities1();

        // GET: histories
        public ActionResult Index()
        {
            var history = db.history.Include(h => h.employee).Include(h => h.test);
            return View(history.ToList());
        }

        // GET: histories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            history history = db.history.Find(id);
            if (history == null)
            {
                return HttpNotFound();
            }
            return View(history);
        }

        // GET: histories/Create
        public ActionResult Create()
        {
            ViewBag.id_user = new SelectList(db.employee, "id", "name");
            ViewBag.id_test = new SelectList(db.test, "id", "name");
            return View();
        }

        // POST: histories/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в разделе https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_user,id_test,points")] history history)
        {
            if (ModelState.IsValid)
            {
                db.history.Add(history);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_user = new SelectList(db.employee, "id", "name", history.id_user);
            ViewBag.id_test = new SelectList(db.test, "id", "name", history.id_test);
            return View(history);
        }

        // GET: histories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            history history = db.history.Find(id);
            if (history == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_user = new SelectList(db.employee, "id", "name", history.id_user);
            ViewBag.id_test = new SelectList(db.test, "id", "name", history.id_test);
            return View(history);
        }

        // POST: histories/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в разделе https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_user,id_test,points")] history history)
        {
            if (ModelState.IsValid)
            {
                db.Entry(history).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_user = new SelectList(db.employee, "id", "name", history.id_user);
            ViewBag.id_test = new SelectList(db.test, "id", "name", history.id_test);
            return View(history);
        }

        // GET: histories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            history history = db.history.Find(id);
            if (history == null)
            {
                return HttpNotFound();
            }
            return View(history);
        }

        // POST: histories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            history history = db.history.Find(id);
            db.history.Remove(history);
            db.SaveChanges();
            return RedirectToAction("Index");
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
