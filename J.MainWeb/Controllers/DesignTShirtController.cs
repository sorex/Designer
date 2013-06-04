using J.Entities;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using System.Data.Entity;

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
			List<material> Materials;
			string a = String.Empty;
			using (DBEntities db = new DBEntities())
			{
				Materials = (from m in db.materials
							 where m.TypeID == "TShirt" && m.State == 1
							 select m).ToList();
				
				if (Materials != null)
				{
					foreach (var m in Materials)
					{
						if (m.materialcolors.Count > 0)
						{
							foreach (var c in m.materialcolors)
							{
								a += c.ColorName + ":" + c.ColorCode + ",";
							}
						}
					}
				}
			}
			ViewBag.obj = JsonConvert.SerializeObject(Materials);
			return View();
		}

	}
}
