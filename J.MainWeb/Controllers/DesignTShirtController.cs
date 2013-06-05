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
			return View();
		}

		public ActionResult Create()
		{
			using (DBEntities db = new DBEntities())
			{
				var Materials = (from m in db.materials.Include(p => p.materialpictures).Include(p => p.materialcolors)
								 where m.TypeID == "TShirt" && m.State == 1
								 select m).ToList();

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
