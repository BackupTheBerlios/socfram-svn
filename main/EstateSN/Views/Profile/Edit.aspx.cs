using System;
using System.Web;
using System.Web.Mvc;
using estatesnModel;

namespace EstateSN.Views.Profile
{
    public partial class Edit : ViewPage<SiteUser>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = ViewData.UserName + " - редактирование";
            if (!ViewData.CountryReference.IsLoaded)
                ViewData.CountryReference.Load();
        }
    }
}
