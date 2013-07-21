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
			var quantitiesStr = sizes.Trim(',').ToLower().Split(',');
			for (int i = 0; i < sizesStr.Length; i++)
			{
				sizequantity.Add(sizesStr[i], int.Parse(quantitiesStr[i]));
			}

			using(DBEntities db = new DBEntities())
			{
				var DesignWork = db.designworks.FirstOrDefault(p=>p.GUID == DesignWorkID);

				/*
				 未效验输入数据的正确性和有效性
				 */

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
					//未完成
					var OrderDetail = new orderdetail() {
						GUID = Basic.NewGuid(),
						OrderID = OrderID,
						SizeID = s.Key
					};
				}
			}

			return Content(JsonConvert.SerializeObject(new { code = 1, msg = OrderID }));
		}
	}
}
