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

using J.MainWeb.App_Code;
using J.BusinessLogics;
using J.Utility;
using J.BusinessLogics.Basic;
using System.Drawing;

namespace J.MainWeb.Controllers
{
	public class DesignTShirtController : BaseController
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();

		public ActionResult Index()
		{
			return View();
		}

		#region Create
		public ActionResult Create()
		{
			using (DBEntities db = new DBEntities())
			{
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
				TypeAndProperties.Add("materialpicture", new List<string> { "GUID", "MaterialID", "Name", "Index", "FileName", "Width", "Height", "Top", "Left", "UploadWidth", "UploadHeight", "ShowScale" });

				//Formatting.Indented
				ViewBag.DataTShirtType = JsonConvert.SerializeObject(Materials, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });
			}

			return View();
		}

		[HttpPost]
		public ActionResult Create(string materialGUID, string colorCode, string uploadPath, int salesGoal, decimal sellingPrice, string title, int time, string description)
		{
			materialGUID = materialGUID.ToLower();
			colorCode = colorCode.ToLower();

			var dwGUID = uploadPath.ToLower();
			var userID = base.CurrentUser.GUID;

			using (DBEntities db = new DBEntities())
			{
				var material = db.materials.FirstOrDefault(p => p.GUID == materialGUID);
				if (material == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "信息未找到，请刷新后重试！" }));
				var materialColor = material.materialcolors.FirstOrDefault(p => p.ColorCode == colorCode);
				if (materialColor == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "信息未找到，请刷新后重试！" }));
				var LowBasePrice = material.Price;
				var BasePrice = PriceCompute.ComputeBasePrice(LowBasePrice, salesGoal);
				var AnticipatedIncome = PriceCompute.ComputeAnticipatedIncome(BasePrice, salesGoal, sellingPrice);
				if (AnticipatedIncome <= 0)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请提高售价，您的受益太少。" }));

				var UserFiles = Server.MapPath("~/Static/UserFiles/");
				if (!System.IO.Directory.Exists(UserFiles + userID))
					System.IO.Directory.CreateDirectory(UserFiles + userID);
				System.IO.Directory.Move(UserFiles + "temp\\" + dwGUID, UserFiles + userID + "\\" + dwGUID);

				designwork dw = new designwork
				{
					GUID = dwGUID,
					DesignerID = userID,
					MaterialID = materialGUID,
					MaterialColorID = materialColor.GUID,
					SalesGoal = salesGoal,
					BasePrice = BasePrice,
					SellingPrice = sellingPrice,
					CreateTime = DateTime.Now,
					LongTime = time,
					Title = title,
					Description = description,
					Url = "",
					SalesVolume = 0,
					State = 0
				};

				db.designworks.Add(dw);
				db.SaveChanges();

				#region 处理图片
				foreach (var p in material.materialpictures)
				{
					Bitmap oldSource = new Bitmap(UserFiles + userID + "\\" + dwGUID + "\\" + p.FileName);
					Bitmap BaseMap = new Bitmap(Server.MapPath("~/Static/SystemFiles/") + material.TypeID + "\\" + materialGUID + "\\" + colorCode + "\\" + p.FileName);

					int width = (int)(p.UploadWidth * p.ShowScale);
					int height = (int)(p.UploadHeight * p.ShowScale);

					//缩小原图
					Bitmap Source = J.Utility.ImageTool.Basic.Zoom(oldSource, width, height);

					//合成图片
					Bitmap newSource = J.Utility.ImageTool.Basic.Merge(BaseMap, Source, p.Left, p.Top);

					//缩小原图
					Bitmap Source180 = J.Utility.ImageTool.Basic.Zoom(newSource, 180, 180);
					Bitmap Source50 = J.Utility.ImageTool.Basic.Zoom(newSource, 50, 50);

					newSource.Save(UserFiles + userID + "\\" + dwGUID + "\\" + "m_" + p.FileName);
					Source180.Save(UserFiles + userID + "\\" + dwGUID + "\\" + "180_" + p.FileName);
					Source50.Save(UserFiles + userID + "\\" + dwGUID + "\\" + "50_" + p.FileName);
				}

				//缩小原图
				//Bitmap Source = J.Utility.Image.Basic.Zoom(oldSource,);
				//合成图片
				//生成180x180的合成图片
				//生成50x50的合成图片
				#endregion
			}

			return Content(JsonConvert.SerializeObject(new { code = 0, msg = dwGUID }));
		}
		#endregion

	}
}
