﻿using J.Entities;
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
			var userGUID = base.CurrentUser.GUID;
			var userEmail = base.CurrentUser.Email;

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
				if (!System.IO.Directory.Exists(UserFiles + userEmail))
					System.IO.Directory.CreateDirectory(UserFiles + userEmail);
				System.IO.Directory.Move(UserFiles + "temp\\" + dwGUID, UserFiles + userEmail + "\\" + dwGUID);

				designwork dw = new designwork
				{
					GUID = dwGUID,
					DesignerID = userGUID,
					MaterialID = materialGUID,
					MaterialColorID = materialColor.GUID,
					SalesGoal = salesGoal,
					BasePrice = BasePrice,
					SellingPrice = sellingPrice,
					StartTime = DateTime.Now,
					EndTime = DateTime.Now.AddDays(time),
					Title = title,
					Description = description,
					Url = "",
					SalesVolume = 0,
					State = 0
				};

				db.designworks.Add(dw);
				db.SaveChanges();
			}

			return Content(JsonConvert.SerializeObject(new { code = 0, msg = dwGUID }));
		}
		#endregion

		#region Preview
		public ActionResult Preview(string guid)
		{
			guid = guid.ToLower();
			using (DBEntities db = new DBEntities())
			{
				var dw = db.designworks.FirstOrDefault(p => p.GUID == guid);
				if (dw == null)
					return RedirectToAction("Error", "Home", new { msg = "该活动的预览不存在!" });

				ViewBag.Title = dw.Title;

				ViewBag.Data = JsonConvert.SerializeObject(new
				{
					DesignworkID = dw.GUID,
					UserEmail = dw.user.Email,
					Description = dw.Description,
					MaterialDescription = dw.material.Description,
					CurrentMaterialTypeID = dw.material.TypeID,
					CurrentMaterialID = dw.MaterialID,
					CurrentColorCode = dw.materialcolor.ColorCode
				});

				Dictionary<string, List<string>> TypeAndProperties = new Dictionary<string, List<string>>();
				TypeAndProperties.Add("materialpicture", new List<string> { "GUID", "MaterialID", "Name", "Index", "FileName", "Width", "Height", "Top", "Left", "UploadWidth", "UploadHeight", "ShowScale" });

				ViewBag.DataMaterialpictures = JsonConvert.SerializeObject(dw.material.materialpictures , new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });
			}
			return View();
		}

		[HttpPost]
		[ActionName("Preview")]
		public ActionResult PreviewPost(string guid)
		{
			guid = guid.ToLower();
			using (DBEntities db = new DBEntities())
			{
				var dw = db.designworks.FirstOrDefault(p => p.GUID == guid);
				if (dw == null)
					return RedirectToAction("Error", "Home", new { msg = "该活动的预览不存在!" });
				if (dw.State != 0)
					return RedirectToAction("Error", "Home", new { msg = "该活动不能发布!" });

				dw.State = 1;
				var time = dw.EndTime - dw.StartTime;
				dw.StartTime = DateTime.Now;
				dw.EndTime = dw.StartTime.AddMilliseconds(time.TotalMilliseconds);
				db.SaveChanges();
			}
			return Content(JsonConvert.SerializeObject(new { code = 1, msg = guid }));
		}
		#endregion

		public ActionResult Buy(string guid)
		{
			guid = guid.ToLower();
			using (DBEntities db = new DBEntities())
			{
				var dw = db.designworks.FirstOrDefault(p => p.GUID == guid);
				if (dw == null)
					return RedirectToAction("Error", "Home", new { msg = "该活动的预览不存在!" });

				ViewBag.Title = dw.Title;

				ViewBag.Data = JsonConvert.SerializeObject(new
				{
					DesignworkID = dw.GUID,
					UserEmail = dw.user.Email,
					Description = dw.Description,
					MaterialDescription = dw.material.Description,
					CurrentMaterialTypeID = dw.material.TypeID,
					CurrentMaterialID = dw.MaterialID,
					CurrentColorCode = dw.materialcolor.ColorCode
				});

				Dictionary<string, List<string>> TypeAndProperties = new Dictionary<string, List<string>>();
				TypeAndProperties.Add("materialpicture", new List<string> { "GUID", "MaterialID", "Name", "Index", "FileName", "Width", "Height", "Top", "Left", "UploadWidth", "UploadHeight", "ShowScale" });
				ViewBag.DataMaterialpictures = JsonConvert.SerializeObject(dw.material.materialpictures, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });

				Dictionary<string, List<string>> TypeAndProperties2 = new Dictionary<string, List<string>>();
				TypeAndProperties2.Add("designwork", new List<string> { "GUID", "DesignerID", "MaterialID", "MaterialColorID", "SalesGoal", "BasePrice", "SellingPrice", "StartTime", "EndTime", "SalesVolume", "State" });
				ViewBag.DataDesignwork = JsonConvert.SerializeObject(dw, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties2) });

				Dictionary<string, List<string>> TypeAndProperties3 = new Dictionary<string, List<string>>();
				TypeAndProperties3.Add("materialsize", new List<string> { "GUID", "MaterialID", "SizeName", "Index" });
				ViewBag.DataSize = JsonConvert.SerializeObject(dw.material.materialsizes.OrderBy(p => p.Index), new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties3) });
			}
			return View();
		}
	}
}
