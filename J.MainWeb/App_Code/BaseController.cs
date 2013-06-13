using J.BusinessLogics.Basic;
using J.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace J.MainWeb.App_Code
{
	public class BaseController : Controller
	{
		public user CurrentUser
		{
			get
			{
				if (Session[SessionConfig.CurrentUser] != null)
					return (user)Session[SessionConfig.CurrentUser];
				else
					return null;
			}
		}
	}
}