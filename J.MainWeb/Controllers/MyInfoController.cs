using J.MainWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace J.MainWeb.Controllers
{
	public class MyInfoController : BaseController
	{
		public ActionResult Index()
		{
			return View();
		}

		#region 我的订单
		public ActionResult MyOrders()
		{
			return View();
		}
		#endregion
	}
}
