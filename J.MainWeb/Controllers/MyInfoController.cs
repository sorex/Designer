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

		#region 我的设计
		public ActionResult MyDesignworks(int pageIndex = 0)
		{
			var pageSize = 25;
			using (DBEntities db = new DBEntities())
			{
				var designerID = base.CurrentUser.GUID;
				var alldesignworks = from dw in db.designworks
									 where dw.DesignerID == designerID
									 orderby dw.StartTime descending
									 select dw;

				var recordCount = alldesignworks.Count();
				//页数以0开始，无余数时需-1
				var pageAll = recordCount / pageSize - (recordCount % pageSize == 0 ? 1 : 0);
				if (pageIndex > pageAll) pageIndex = pageAll;
				
				var search = alldesignworks.Skip(pageIndex * pageSize).Take(pageSize).ToList();

				var result = new[] { new {
					GUID = "GUID", 
					LoginName = "LoginName",
					MaterialID = "MaterialID",
					MaterialTypeID = "MaterialTypeID",
					ColorCode = "ColorCode",
					MaterialPictureName = "MaterialPictureName",
					Title = "Title",
					SellingPrice = "1.00",
					SalesVolume = "1",
					SalesGoal = "1",
					AnticipatedIncome = "1.00",
					StartTime = "2013-07-10 14:52",
					EndTime = "2013-07-10 14:52",
					State = 1
				} }.ToList();
				result.Clear();

				foreach (var dw in search)
				{
					var AnticipatedIncome = dw.SalesVolume >= dw.SalesGoal ? PriceCompute.ComputeAnticipatedIncome(dw.BasePrice, dw.SalesVolume.Value, dw.SellingPrice) : 0;
					var MaterialPictureName = dw.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().Name;
					result.Add(new
					{
						GUID = dw.GUID,
						LoginName = dw.user.LoginName,
						MaterialID = dw.MaterialID,
						MaterialTypeID = dw.material.TypeID,
						ColorCode = dw.materialcolor.ColorCode,
						MaterialPictureName = MaterialPictureName,
						Title = dw.Title,
						SellingPrice = dw.SellingPrice.ToString("0.00"),
						SalesVolume = dw.SalesVolume.Value.ToString(),
						SalesGoal = dw.SalesGoal.ToString(),
						AnticipatedIncome = AnticipatedIncome.ToString("0.00"),
						StartTime = dw.StartTime.ToString("yyyy-MM-dd HH:mm"),
						EndTime = dw.EndTime.ToString("yyyy-MM-dd HH:mm"),
						State = dw.State
					});
				}

				ViewBag.Data = JsonConvert.SerializeObject(new { items = result });
				ViewBag.HasNext = pageAll > pageIndex;
				ViewBag.NextPageIndex = pageIndex + 1;
				ViewBag.HasPrev = pageIndex > 0;
				ViewBag.PrevPageIndex = pageIndex-1;
				ViewBag.pageIndex = pageIndex;
			}
			return View();
		}
		#endregion

		#region 收货地址
		public ActionResult MyAddresses()
		{
			using (DBEntities db = new DBEntities())
			{
				var UserID = base.CurrentUser.GUID;
				var Addresses = (from a in db.addresses
								 where a.UserID == UserID
								 select a).ToList();

				Dictionary<string, List<string>> TypeAndProperties = new Dictionary<string, List<string>>();
				TypeAndProperties.Add("address", new List<string> { "GUID", "UserID", "Consignee", "Province", "City", "County", "StreetAddress", "ZipCode", "Mobile", "Phone", "IsDefault" });

				ViewBag.Data = JsonConvert.SerializeObject(Addresses, new JsonSerializerSettings { ContractResolver = new DynamicContractResolver(TypeAndProperties) });
			}
			return View();
		}

		[HttpPost]
		public ActionResult SaveAddress(string GUID, string Consignee, string Province, string City, string County, string StreetAddress, string ZipCode, string Mobile, string Phone, bool IsDefault)
		{
			GUID = GUID.ToLower();

			if (base.CurrentUser == null)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请登录后重试！" }));
			var UserID = base.CurrentUser.GUID;

			var ErrorMessage = String.Empty;
			int IntZipCode;

			#region checkdata
			if (Consignee.Length < 2 || Consignee.Length > 15)
				ErrorMessage += "<p><span style='color:red;'>收货人姓名</span> 不能少于2个字，不能超过15个字</p>";
			if (Province.Length < 2 || Province.Length > 15)
				ErrorMessage += "<p><span style='color:red;'>所在省</span> 不能少于2个字，不能超过15个字</p>";
			if (City.Length < 2 || City.Length > 15)
				ErrorMessage += "<p><span style='color:red;'>所在市</span> 不能少于2个字，不能超过15个字</p>";
			if (County.Length < 2 || County.Length > 15)
				ErrorMessage += "<p><span style='color:red;'>所在区/县</span> 不能少于2个字，不能超过15个字</p>";
			if (StreetAddress.Length < 5 || StreetAddress.Length > 60)
				ErrorMessage += "<p><span style='color:red;'>街道地址</span> 最少5个字，最多不能超过60个字</p>";
			if (!((int.TryParse(ZipCode, out IntZipCode) && ZipCode.Length == 6) || ZipCode.Length == 0))
				ErrorMessage += "<p><span style='color:red;'>邮政编码</span> 必须由6个数字构成</p>";
			if (Mobile.Length == 0 && Phone.Length == 0)
				ErrorMessage += "<p><span style='color:red;'>电话号码、手机号码</span> 必填一项</p>";
			if (Mobile.Length > 20)
				ErrorMessage += "<p><span style='color:red;'>手机号码</span> 不能超过20个字</p>";
			if (Phone.Length > 20)
				ErrorMessage += "<p><span style='color:red;'>电话号码</span> 不能超过20个字</p>";
			
			if (ErrorMessage.Length > 0)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = ErrorMessage }));
			#endregion

			if (GUID.Length != 0)
			{
				using (DBEntities db = new DBEntities())
				{
					var Address = db.addresses.FirstOrDefault(p => p.GUID == GUID);
					if (Address == null)
						return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该地址不存在，请刷新后重试！" }));

					if (IsDefault)
					{
						var other = db.addresses.FirstOrDefault(p => p.UserID == UserID && p.IsDefault == true);
						if (other != null)
							other.IsDefault = false;
					}

					Address.Consignee = Consignee;
					Address.Province = Province;
					Address.City = City;
					Address.County = County;
					Address.StreetAddress = StreetAddress;
					Address.ZipCode = ZipCode;
					Address.Mobile = Mobile;
					Address.Phone = Phone;
					Address.IsDefault = IsDefault;

					db.SaveChanges();
				}
			}
			else
			{
				using (DBEntities db = new DBEntities())
				{
					if(db.addresses.Count(p=>p.UserID == UserID) >= SystemConfig.MaxAddresses)
						return Content(JsonConvert.SerializeObject(new { code = -1, msg = "每个用户最多只能存储" + SystemConfig.MaxAddresses + "个收货地址。" }));

					var Address = new address();
					Address.GUID = Basic.NewGuid();
					Address.UserID = UserID;
					Address.Consignee = Consignee;
					Address.Province = Province;
					Address.City = City;
					Address.County = County;
					Address.StreetAddress = StreetAddress;
					Address.ZipCode = ZipCode;
					Address.Mobile = Mobile;
					Address.Phone = Phone;
					Address.IsDefault = IsDefault;

					db.addresses.Add(Address);
					db.SaveChanges();
				}
			}
			return Content(JsonConvert.SerializeObject(new { code = 1, msg = "保存成功！" }));
		}

		[HttpPost]
		public ActionResult DeleteAddress(string guid)
		{
			var GUID = guid.ToLower();

			if (base.CurrentUser == null)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请登录后重试！" }));
			var UserID = base.CurrentUser.GUID;

			using (DBEntities db = new DBEntities())
			{
				var Address = db.addresses.FirstOrDefault(p => p.UserID == UserID && p.GUID == GUID);
				if (Address == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该地址不存在，请刷新后重试！" }));

				db.addresses.Remove(Address);
				db.SaveChanges();
				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "删除成功！" }));
			}
		}

		[HttpPost]
		public ActionResult DefaultAddress(string guid)
		{
			var GUID = guid.ToLower();

			if (base.CurrentUser == null)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请登录后重试！" }));
			var UserID = base.CurrentUser.GUID;

			using (DBEntities db = new DBEntities())
			{
				var Address = db.addresses.FirstOrDefault(p => p.UserID == UserID && p.GUID == GUID);
				if (Address == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该地址不存在，请刷新后重试！" }));

				var OldAddress = db.addresses.FirstOrDefault(p => p.UserID == UserID && p.IsDefault == true);
				OldAddress.IsDefault = false;

				Address.IsDefault = true;

				db.SaveChanges();
				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "设置默认地址成功！" }));
			}
		}
		#endregion
	}
}
