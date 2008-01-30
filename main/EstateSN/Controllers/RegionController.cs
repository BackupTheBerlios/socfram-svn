using System;
using System.Web;
using System.Web.Mvc;
using estatesnModel;
using System.Linq;
using System.Collections.Generic;

using System.Collections;
using System.Text;

namespace EstateSN.Controllers
{
	public class RegionController : Controller
	{

		[ControllerAction]
		public void Index()
		{
			//Add action logic here
		}

		[ControllerAction]
		public void GetByCountry(string countryID)
		{
			int id = 0;
			if (!int.TryParse(countryID, out id)) return;

			estatesnEntities ee = new estatesnEntities();

			var c = from reg in ee.C_Region
					where reg.Country.CountryID == id
					select reg;

			StringBuilder res = new StringBuilder();
			res.Append("{\"\":\"\"");
			foreach (Region r in c)
			{
				res.Append(",\"").Append(r.RegionID).Append("\":\"")
					.Append(r.RegionName).Append("\"");
			}
			res.Append("}");

			Response.AppendHeader("Content-type", "text/javascript");
			Response.Write(res.ToString());
		}

		
	}

}
