using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.BindingHelpers;

namespace EstateSN.Views.User
{
	public partial class Login : ViewPage
	{
		protected override void OnInit(EventArgs e)
		{
			if (!String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
				Response.Redirect("/");
			base.OnInit(e);
		}
	}
}



