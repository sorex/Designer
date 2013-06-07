using J.Entities;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft;
using Newtonsoft.Json;
using System.Data.Entity;

using J.BusinessLogics;
using J.Utility;
using J.BusinessLogics.Basic;

namespace J.MainWeb.Controllers
{
	public class DesignTShirtController : Controller
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();

		public ActionResult Index()
		{
			//using (DBEntities db = new DBEntities())
			//{
			//	var Ms = from m in db.materials
			//			 select m;
			//
			//	foreach (var m in Ms)
			//	{
			//		materialpicture mp1 = new materialpicture{
			//			FileName = "01.png",
			//			 GUID = Basic.NewGuid(),
			//			  Height = 
			//		};
			//	}
			//}

			return View();
		}

		public ActionResult Create()
		{
			using (DBEntities db = new DBEntities())
			{
				//.Include(p => p.materialpictures).Include(p => p.materialcolors)
				var Materials = (from m in db.materials
								 where m.TypeID == "TShirt" && m.State == 1
								 select m).ToList();

				foreach (var m in Materials)
				{
					m.materialpictures = m.materialpictures.OrderBy(p => p.Index).ToList();
					m.materialcolors = m.materialcolors.Where(p => p.State == 1).OrderBy(p => p.ColorName).OrderByDescending(p => p.IsDefault).ToList();
				}

				Dictionary<string, List<string>> TypeAndProperties = new Dictionary<string, List<string>>();
				TypeAndProperties.Add("material", new List<string> { "GUID", "TypeID", "Name", "Price", "materialcolors", "materialpictures" });
				TypeAndProperties.Add("materialcolor", new List<string> { "GUID", "MaterialID", "ColorName", "ColorCode", "IsDefault", "State" });
				TypeAndProperties.Add("materialpicture", new List<string> { "GUID", "MaterialID", "Name", "Index", "FileName", "Width", "Height", "Top", "Left", "UploadWidth", "UploadHeight" });

				//Formatting.Indented
				ViewBag.DataTShirtType = JsonConvert.SerializeObject(Materials, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });
			}
			
			return View();
		}
	}
}
