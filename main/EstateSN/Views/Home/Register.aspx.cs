using System;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Linq;
using estatesnModel;

namespace EstateSN.Views.Home
{
	public partial class Register : ViewPage, ICallbackEventHandler
	{
		string checkResult = "";

		protected override void OnInit(EventArgs e)
		{
			if (!String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
				Response.Redirect("/");
			base.OnInit(e);
		}

		public string GetCallbackResult()
		{
			return checkResult;
		}

		public void RaiseCallbackEvent(string eventArgument)
		{
            estatesnEntities ee = new estatesnEntities();
            var c = from user in ee.SiteUser 
					where user.UserName.ToLower() == eventArgument.Trim().ToLower()
					select user;

            if (c.Count<SiteUser>() > 0)
                checkResult = "Пользователь существует";
            else
                checkResult = "OK";
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{

				string cbReference = Page.ClientScript.GetCallbackEventReference(this, "args", "ReceiveServerData", "");
				string strCallback = "function CallServer(args,context){" + cbReference + ";}";
				Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CallServer", strCallback, true);
			}
		}
	}
}
