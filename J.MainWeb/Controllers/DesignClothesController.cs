using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace J.MainWeb.Controllers
{
	public class DesignClothesController : Controller
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();
		
		public ActionResult Index()
		{
			return View();
		}

	}
}
