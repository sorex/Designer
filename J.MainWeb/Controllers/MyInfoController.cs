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
		#region 我的资料
		public ActionResult Index()
		{
			if (base.CurrentUser != null)
			{
				var User = new
				{
					Email = base.CurrentUser.Email,
					RealName = base.CurrentUser.RealName,
					CreateTime = base.CurrentUser.CreateTime.ToString("yyyy-MM-dd"),
					StageName = base.CurrentUser.StageName
				};
				ViewBag.Data = JsonConvert.SerializeObject(User);
			}
			else
				ViewBag.Data = "null";

			return View();
		}

		[HttpPost]
		public ActionResult ChangeEmail(string email)
		{
			email = email.Trim();
			if (base.CurrentUser != null)
			{
				var userGUID = base.CurrentUser.GUID;
				using (DBEntities db = new DBEntities())
				{
					var user = db.users.FirstOrDefault(p => p.GUID == userGUID);
					if (user.Email == String.Empty)
					{
						user.Email = email;
						db.SaveChanges();
						base.CurrentUser.Email = email;
						return Content(JsonConvert.SerializeObject(new { code = 1, msg = "保存成功！" }));
					}
					else
						return Content(JsonConvert.SerializeObject(new { code = -1, msg = "不能修改【支付宝账号】。" }));
				}
			}
			else
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请登录后重试。" }));
		}

		[HttpPost]
		public ActionResult ChangeStageName(string stagename)
		{
			stagename = stagename.Trim();
			if (base.CurrentUser != null)
			{
				var userGUID = base.CurrentUser.GUID;
				using (DBEntities db = new DBEntities())
				{
					var user = db.users.FirstOrDefault(p => p.GUID == userGUID);
					if (db.users.Count(p => p.StageName == stagename) > 0)
						return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该名称已被使用。" }));
					if (user.StageName == String.Empty)
					{
						user.StageName = stagename;
						db.SaveChanges();
						base.CurrentUser.StageName = stagename;

						return Content(JsonConvert.SerializeObject(new { code = 1, msg = "保存成功！" }));
					}
					else
						return Content(JsonConvert.SerializeObject(new { code = -1, msg = "不能修改【艺名】。" }));
				}
			}
			else
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请登录后重试。" }));
		}
		#endregion

		#region 我的订单
		public ActionResult MyOrders(int pageIndex = 0)
		{
			var UserID = String.Empty;
			if(base.CurrentUser != null)
				UserID = base.CurrentUser.GUID;
			using (DBEntities db = new DBEntities())
			{
				var allorders = from o in db.orders
								where o.UserID == UserID
								orderby o.CreateTime descending
								select o;

				var recordCount = allorders.Count();
				//页数以0开始，无余数时需-1
				var pageAll = recordCount == 0 ? 0 :recordCount / SystemConfig.PageSize - (recordCount % SystemConfig.PageSize == 0 ? 1 : 0);
				if (pageIndex > pageAll) pageIndex = pageAll;

				var search = allorders.Skip(pageIndex * SystemConfig.PageSize).Take(SystemConfig.PageSize).ToList();

				var result = new[] { new {
					GUID = "GUID", 
					DesignWorkID = "DesignWorkID",
					CreateTime = "2013-07-10 14:52",
					Title = "Title",
					OrderDetails = "OrderDetails",
					Price = "1.00",
					Quantity = "1",
					Freight = "1.00",
					Total = "1.00",
					State = 1,
					DesignerID = "sorex@163.com",
					MaterialPictureFileName = "MaterialPictureFileName",
					DesignWorkState = 1
				} }.ToList();
				result.Clear();

				foreach (var o in search)
				{
					var OrderDetails = String.Empty;
					foreach (var od in o.orderdetails)
					{
						if (OrderDetails.Length != 0)
							OrderDetails += "、";
						OrderDetails += od.SizeName + "：" + od.Quantity + "件";
					}
					OrderDetails += "。";

					var MaterialPictureFileName = o.designwork.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

					result.Add(new
					{
						GUID = o.GUID, 
						DesignWorkID = o.designwork.GUID,
						CreateTime = o.CreateTime.ToString("yyyy-MM-dd HH:mm"),
						Title = o.Subject,
						OrderDetails = OrderDetails,
						Price = o.Price.ToString("0.00"),
						Quantity = o.Quantity.ToString(),
						Freight = o.Freight.ToString("0.00"),
						Total = (o.Price * o.Quantity + o.Freight).ToString("0.00"),
						State = o.State,
						DesignerID = o.designwork.user.GUID,
						MaterialPictureFileName = MaterialPictureFileName,
						DesignWorkState = o.designwork.State
					});
				}

				ViewBag.Data = JsonConvert.SerializeObject(new { items = result });
				ViewBag.HasNext = pageAll > pageIndex;
				ViewBag.NextPageIndex = pageIndex + 1;
				ViewBag.HasPrev = pageIndex > 0;
				ViewBag.PrevPageIndex = pageIndex - 1;
				ViewBag.pageIndex = pageIndex;
			}
			return View();
		}

		#region 退款/退货
		public ActionResult Refund(string guid)
		{
			var GUID = guid.ToLower();

			if (base.CurrentUser == null)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "请登录后重试！" }));
			var UserID = base.CurrentUser.GUID;

			using (DBEntities db = new DBEntities())
			{
				var Order = db.orders.FirstOrDefault(p => p.UserID == UserID && p.GUID == GUID);
				if (Order == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该订单不存在，请刷新后重试！" }));
				if (Order.State != 2)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该订单不可退款！请联系管理员，处理询问详情。" }));

				Order.State = 6;
				db.SaveChanges();
				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "退款申请已提交！" }));
			}
		}
		#endregion
		#endregion

		#region 我的设计
		public ActionResult MyDesignworks(int pageIndex = 0)
		{
			using (DBEntities db = new DBEntities())
			{
				var designerID = base.CurrentUser.GUID;
				var alldesignworks = from dw in db.designworks
									 where dw.DesignerID == designerID
									 orderby dw.CreateTime descending
									 select dw;

				var recordCount = alldesignworks.Count();
				//页数以0开始，无余数时需-1
				var pageAll = recordCount == 0 ? 0 : recordCount / SystemConfig.PageSize - (recordCount % SystemConfig.PageSize == 0 ? 1 : 0);
				if (pageIndex > pageAll) pageIndex = pageAll;

				var search = alldesignworks.Skip(pageIndex * SystemConfig.PageSize).Take(SystemConfig.PageSize).ToList();

				var result = new[] { new {
					GUID = "GUID", 
					MaterialID = "MaterialID",
					MaterialTypeID = "MaterialTypeID",
					ColorCode = "ColorCode",
					Title = "Title",
					SellingPrice = "1.00",
					SalesVolume = "1",
					SalesGoal = "1",
					AnticipatedIncome = "1.00",
					CreateTime = "2013-07-10 14:52",
					StartTime = "2013-07-10 14:52",
					EndTime = "2013-07-10 14:52",
					State = 1,
					DesignerID = "DesignerID",
					MaterialPictureFileName = "MaterialPictureFileName"
				} }.ToList();
				result.Clear();

				foreach (var dw in search)
				{
					var AnticipatedIncome = dw.SalesVolume >= dw.SalesGoal ? PriceCompute.ComputeAnticipatedIncome(dw.BasePrice, dw.SalesVolume.Value, dw.SellingPrice) : 0;
					var MaterialPictureFileName = dw.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

					result.Add(new
					{
						GUID = dw.GUID,
						MaterialID = dw.MaterialID,
						MaterialTypeID = dw.material.TypeID,
						ColorCode = dw.materialcolor.ColorCode,
						Title = dw.Title,
						SellingPrice = dw.SellingPrice.ToString("0.00"),
						SalesVolume = dw.SalesVolume.Value.ToString(),
						SalesGoal = dw.SalesGoal.ToString(),
						AnticipatedIncome = AnticipatedIncome.ToString("0.00"),
						CreateTime = dw.CreateTime.ToString("yyyy-MM-dd HH:mm"),
						StartTime = dw.StartTime == null ? String.Empty : dw.StartTime.Value.ToString("yyyy-MM-dd HH:mm"),
						EndTime = dw.EndTime == null ? String.Empty : dw.EndTime.Value.ToString("yyyy-MM-dd HH:mm"),
						State = dw.State,
						DesignerID = dw.user.GUID,
						MaterialPictureFileName = MaterialPictureFileName
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

		[HttpDelete]
		public ActionResult DeleteDesignwork(string guid)
		{
			using (DBEntities db = new DBEntities())
			{
				var UserID = base.CurrentUser.GUID;
				var Designwork = (from d in db.designworks
								  where d.GUID == guid
								 select d).FirstOrDefault();

				if(Designwork == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该设计不存在！" }));
				else if(Designwork.DesignerID != UserID)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "您没有权限删除该设计！" }));
				else if(Designwork.State != 0)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该设计不处于设计状态，不可删除！" }));

				db.designworks.Remove(Designwork);
				db.SaveChanges();

				var UserFiles = Server.MapPath("~/Static/UserFiles/");
				System.IO.Directory.Delete(UserFiles + UserID + "\\" + guid, true);

				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "删除成功！" }));
			}
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
