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
					CreateTime = DateTime.Now,
					Subject = DesignWork.Title,
					Price = DesignWork.SellingPrice,
					Quantity = sizequantity.Values.Sum(),
					Freight = sizequantity.Values.Sum() >= SystemConfig.FreePostageNumber ? 0 : SystemConfig.BaseFreight,
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
						Quantity = s.Value
					};
					db.orderdetails.Add(OrderDetail);
				}

				db.SaveChanges();
			}

			return Content(JsonConvert.SerializeObject(new { code = 1, msg = OrderID }));
		}
		#endregion

		#region 订单详情
		public ActionResult Detail(string guid)
		{
			guid = guid.ToLower();
			using (DBEntities db = new DBEntities())
			{
				var Order = db.orders.FirstOrDefault(p => p.GUID == guid);
				if (Order == null)
					return RedirectToAction("Error", "Home", new { msg = "该订单不存在或者已确定!" });

				var MaterialPictureFileName = Order.designwork.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

				var OrderInfo = new
				{
					GUID = Order.GUID,
					CreateTime = Order.CreateTime.ToString("yyyy-MM-dd HH:mm:ss"),
					WaitBuyerPayTime = Order.WaitBuyerPayTime == null ? String.Empty : Order.WaitBuyerPayTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
					WaitSellerSendGoodsTime = Order.WaitSellerSendGoodsTime == null ? String.Empty : Order.WaitSellerSendGoodsTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
					WaitBuyerConfirmGoodsTime = Order.WaitBuyerConfirmGoodsTime == null ? String.Empty : Order.WaitBuyerConfirmGoodsTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
					TradeFinishedTime = Order.TradeFinishedTime == null ? String.Empty : Order.TradeFinishedTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
					EndTime = Order.designwork.EndTime,
					State = Order.State,
					IsOverEndTime = DateTime.Now >= Order.designwork.EndTime,

					Price = Order.Price.ToString("0.00"),
					Quantity = Order.Quantity.ToString(),
					Freight = Order.Freight.ToString("0.00"),
					Total = (Order.Price * Order.Quantity + Order.Freight).ToString("0.00"),
					DesignerEmail = Order.designwork.user.Email,
					DesignWorkID = Order.DesignWorkID,
					MaterialPictureFileName = MaterialPictureFileName,

					Consignee = Order.Consignee,
					Address = Order.Address,
					ZipCode = Order.ZipCode,
					Mobile = Order.Mobile,
					Phone = Order.Phone,
					ShippingMethod = Order.ShippingMethod
				};

				ViewBag.DataOrderInfo = JsonConvert.SerializeObject(new { OrderInfo = OrderInfo });
			}

			return View();
		}
		#endregion

		#region 确定订单和收货地址
		public ActionResult ConfirmOrder(string guid)
		{
			guid = guid.ToLower();
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

					Dictionary<string, List<string>> TypeAndProperties1 = new Dictionary<string, List<string>>();
					TypeAndProperties1.Add("address", new List<string> { "GUID", "UserID", "Consignee", "Province", "City", "County", "StreetAddress", "ZipCode", "Mobile", "Phone", "IsDefault" });
					ViewBag.DataAddresses = JsonConvert.SerializeObject(Addresses, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties1) });


					var Order = db.orders.FirstOrDefault(p => p.GUID == guid && p.State == 0);
					if (Order == null)
						return RedirectToAction("Error", "Home", new { msg = "该订单不存在或者已确定!" });

					var OrderDetails = String.Empty;
					foreach (var od in Order.orderdetails)
					{
						if (OrderDetails.Length != 0)
							OrderDetails += "、";
						OrderDetails += od.SizeName + "：" + od.Quantity + "件";
					}
					OrderDetails += "。";

					var MaterialPictureFileName = Order.designwork.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

					var OrderInfo = new {
						GUID = Order.GUID,
						Title = Order.Subject,
						OrderDetails = OrderDetails,
						Price = Order.Price.ToString("0.00"),
						Quantity = Order.Quantity.ToString(),
						Freight = Order.Freight.ToString("0.00"),
						Total = (Order.Price * Order.Quantity + Order.Freight).ToString("0.00"),
						DesignerEmail = Order.designwork.user.Email,
						DesignWorkID = Order.DesignWorkID,
						MaterialPictureFileName = MaterialPictureFileName
					};
					ViewBag.DataOrderInfo = JsonConvert.SerializeObject(new { OrderInfo = OrderInfo });
				}
			}
			return View();
		}

		[HttpPost]
		public ActionResult ConfirmOrder(string guid, string Province, string City, string County, string StreetAddress, string Mobile, string Phone, string Consignee,string ZipCode, string ShippingMethod)
		{
			guid = guid.ToLower();
			if (base.CurrentUser == null)
				return Content(JsonConvert.SerializeObject(new { code = -99, msg = "请登录后重试！" }));

			var UserID = base.CurrentUser.GUID;
			using (DBEntities db = new DBEntities())
			{
				var Order = db.orders.FirstOrDefault(p => p.GUID == guid);
				if(Order == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "订单不存在，请刷新后重试。" }));
				if (Order.UserID != UserID)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "您没有权限做此操作！" }));
				if(Order.State != 0)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "订单状态不正确。" }));

				Order.Consignee = Consignee;
				Order.Address = Province + " " + City + " " + County + " " + StreetAddress;
				Order.ZipCode = ZipCode;
				Order.Mobile = Mobile;
				Order.Phone = Phone;
				Order.ShippingMethod = ShippingMethod;
				Order.State = 1;
				Order.WaitBuyerPayTime = DateTime.Now;

				db.SaveChanges();
				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "操作成功。" }));
			}
		}
		#endregion

		public ActionResult Pay(string guid)
		{
			return View();
		}
	}
}
