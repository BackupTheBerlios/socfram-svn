using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using estatesnModel;
using System.Collections.Generic;

namespace EstateSN.Controllers
{
	public class UserController : Controller
	{

		[ControllerAction]
		public void Index(int? id)
		{
			if (!id.HasValue) id = 4;

			estatesnEntities ee = new estatesnEntities();
			var u = from user in ee.SiteUser where user.UserID == id select user;

			UserIndexViewData vd = new UserIndexViewData();
			vd.User = u.First<SiteUser>();
			vd.User.CountryReference.Load();
			vd.Countries = (from c_country in ee.C_Country select c_country).ToList<Country>();
			RenderView("Index", vd);
		}

		[ControllerAction]
		public void Login()
		{
			RenderView("Login");
		}

		[ControllerAction]
		public void Logout()
		{
			FormsAuthentication.SignOut();
			Response.Redirect("/");
		}

		[ControllerAction]
		public void Authenticate(string userName, string password, string rememberMe, string returnUrl)
		{

			// figure out if username and password are correct 
			if (Membership.ValidateUser(userName, password))
			{
				// everything is good, create an authticket and go 
				FormsAuthentication.SetAuthCookie(userName, (rememberMe != null));
				
				Response.Redirect(returnUrl);
			}

			else
			{
				// something was wrong, figure out which and pass it into view 
				if (Membership.GetUser(userName) == null)
					ViewData["ErrorMessage"] = "Неверное имя пользователя.";
				else
					ViewData["ErrorMessage"] = "Неверный пароль.";

				TempData["userName"] = userName;
				RenderView("Login");
			}
		}

		[ControllerAction]
		public void Create(string userName, string email, string password1, string password2)
		{
			SiteUser u = new SiteUser();
			u.UserName = userName;
			u.EMail = email;
			u.Password = password1;
			estatesnEntities ee = new estatesnEntities();
			ee.AddToSiteUser(u);
			ee.SaveChanges();

			if (Membership.CreateUser(userName, password1, email) == null)
				throw new MembershipCreateUserException("An unspecified error occurred.");

			FormsAuthentication.SetAuthCookie(userName, true);
			Response.Redirect("/");

		}
	}

	public class UserIndexViewData
	{
		public SiteUser User { get; set; }
		public List<Country> Countries { get; set; }

	}
}
