using J.BusinessLogics.Basic;
using J.Entities;
using J.MainWeb.App_Code;
using J.Utility;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace J.MainWeb.Controllers
{
	public class LogicController : BaseController
	{
		#region 预览并发布
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

				ViewBag.DataMaterialpictures = JsonConvert.SerializeObject(dw.material.materialpictures, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });
			}
			return View();
		}

		[HttpPost]
		[ActionName("Preview")]
		public ActionResult PreviewPost(string guid)
		{
			var UserID = base.CurrentUser.GUID;
			guid = guid.ToLower();
			using (DBEntities db = new DBEntities())
			{
				var dw = db.designworks.FirstOrDefault(p => p.GUID == guid && p.DesignerID == UserID);
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

		#region 购买
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
		#endregion

		#region 创建订单
		[HttpPost]
		public ActionResult CreateOrder(string guid, string sizes, string quantities)
		{
			if (base.CurrentUser == null)
				return Content(JsonConvert.SerializeObject(new { code = -99, msg = "请登录后重试！" }));

			var UserID = base.CurrentUser.GUID;
			var OrderID = Basic.NewGuid();
			var DesignWorkID = guid.ToLower();

			var sizequantity = new Dictionary<string, int>();
			var sizesStr = sizes.Trim(',').ToLower().Split(',');
			var quantitiesStr = quantities.Trim(',').ToLower().Split(',');
			for (int i = 0; i < sizesStr.Length; i++)
			{
				int tempQuantity = 0;
				if (!int.TryParse(quantitiesStr[i], out tempQuantity))
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "数据错误，请重试！" }));
				
				sizequantity.Add(sizesStr[i], tempQuantity);
			}

			using(DBEntities db = new DBEntities())
			{
				var DesignWork = db.designworks.FirstOrDefault(p=>p.GUID == DesignWorkID);
				var sizesDB = db.materialsizes.Where(p => sizesStr.Contains(p.GUID)).ToList();
				if(sizesDB.Count() != sizesStr.Count())
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "选择的尺寸不存在，请重试！" }));

				order Order = new order()
				{
					GUID = OrderID,
					UserID = UserID,
					DesignWorkID = DesignWorkID,
					State = 0,
					RefundState = 0,
					WaitBuyerPayTime = DateTime.Now,
					Subject = DesignWork.Title,
					Price = DesignWork.SellingPrice,
					Body = DesignWork.material.Description
				};
				db.orders.Add(Order);
				
				foreach (var s in sizequantity)
				{
					var OrderDetail = new orderdetail()
					{
						GUID = Basic.NewGuid(),
						OrderID = OrderID,
						SizeID = s.Key,
						SizeName = sizesDB.FirstOrDefault(p => p.GUID == s.Key).SizeName,
						Number = s.Value
					};
					db.orderdetails.Add(OrderDetail);
				}

				db.SaveChanges();
			}

			return Content(JsonConvert.SerializeObject(new { code = 1, msg = OrderID }));
		}
		#endregion

		#region 确定订单和收货地址
		public ActionResult  ConfirmOrder(string guid)
		{
			if (base.CurrentUser == null)
				ViewBag.UnLogin = true;
			else
			{
				ViewBag.UnLogin = false;
				var UserID = base.CurrentUser.GUID;

			using (DBEntities db = new DBEntities())
			{
				var Addresses = (from a in db.addresses
								where a.UserID == UserID
								select a).ToList();

				Dictionary<string, List<string>> TypeAndProperties = new Dictionary<string, List<string>>();
				TypeAndProperties.Add("address", new List<string> { "GUID", "UserID", "Consignee", "Province", "City", "County", "StreetAddress", "ZipCode", "Mobile", "Phone", "IsDefault" });

				ViewBag.DataAddresses = JsonConvert.SerializeObject(Addresses, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });
			}
			}
			return View();
		}
		#endregion
	}
}
