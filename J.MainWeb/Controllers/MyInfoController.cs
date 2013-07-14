using J.BusinessLogics.Basic;
using J.Entities;
using J.MainWeb.App_Code;
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
	}
}
