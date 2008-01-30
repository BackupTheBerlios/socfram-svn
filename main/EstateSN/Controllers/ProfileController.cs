using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.BindingHelpers;
using System.Linq;
using estatesnModel;
using System.Web.Security;

namespace EstateSN.Controllers
{
	public class ProfileController : Controller
	{

		[ControllerAction]
		public void Index()
		{
			//Add action logic here
		}

		

		

        [ControllerAction]
        public void Edit(int id)
        {
            estatesnEntities ee = new estatesnEntities();
            var u = from user in ee.SiteUser where user.UserID == id select user;
            RenderView("Edit", u.First<SiteUser>());
        }

        [ControllerAction]
        public void Update(int id)
        {
            estatesnEntities ee = new estatesnEntities();
            SiteUser u = (from user in ee.SiteUser where user.UserID == id select user).First<SiteUser>();
            u.FIO = Request.Form["FIO"];
			u.Country.CountryID = int.Parse(Request.Form["CountryID"]);
            ee.SaveChanges();
            RedirectToAction(new { Action = "Edit", ID = u.UserID });
        }
	}
}
