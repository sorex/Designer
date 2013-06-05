using J.Entities;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using System.Data.Entity;

using J.BusinessLogics;
using J.Utility;

namespace J.MainWeb.Controllers
{
	public class DesignTShirtController : Controller
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();

		public ActionResult Index()
		{
			return View();
		}

		public ActionResult Create()
		{
			using (DBEntities db = new DBEntities())
			{
				ViewBag.DataTShirtType = DesignTShirt.DB2Json(from m in db.materials.Include(p => p.materialpictures).Include(p => p.materialcolors)
															  where m.TypeID == "TShirt" && m.State == 1
															  select m, 1);

				return View();
			}
		}
	}
}
