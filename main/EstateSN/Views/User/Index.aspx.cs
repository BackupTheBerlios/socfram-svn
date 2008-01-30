using System;
using System.Web;
using System.Web.Mvc;
using estatesnModel;
using EstateSN.Controllers;
using System.Collections.Generic;
using System.Web.UI;
using System.Linq;

namespace EstateSN.Views.User
{
	public partial class Index : ViewPage<UserIndexViewData>
	{
		/*public string GetCallbackResult()
		{
			return "";
		}

		public void RaiseCallbackEvent(string eventArgument)
		{
			int id = int.Parse(eventArgument);
			estatesnEntities ee = new estatesnEntities();
			var c = from reg in ee.C_Region 
					where reg.Country.CountryID == id
					select reg;

			
			int i = c.Count<Region>();
			
		}*/
		
	}
}
