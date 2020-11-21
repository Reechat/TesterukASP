using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TesterukASP.Controllers
{
    [Authorize]
    public class AddHistoryController : ApiController
    {
        private Models.testDBEntities db = new Models.testDBEntities();
        // POST api/<controller>
        public void Post(Request1 value)
        {
            int count = db.history.ToList<Models.history>().Count;
            Models.history history = new Models.history {id = count, id_user = value.Id, id_test = value.test, points = value.count};
            db.history.Add(history);
            db.SaveChanges();
        }
    }
    public class Request1
    {
        public string Id { get; set; }
        public int count { get; set; }
        public int test { get; set; }
    }
}