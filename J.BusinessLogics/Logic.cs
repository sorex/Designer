using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using J.Entities;
using System.Web;

namespace J.BusinessLogics
{
	public class Logic
	{
		public bool LoginOK(string UserID, string RealName, string Email)
		{
			using (DBEntities db = new DBEntities())
			{
				var User = db.users.FirstOrDefault(p => p.GUID == UserID);
				if (User != null)
				{
					if (User.RealName != RealName)
						User.RealName = RealName;
					if (User.Email != Email)
						User.Email = Email;
					db.SaveChanges();
				}
				else
				{
					User = new user
					{
						GUID = UserID,
						RealName = RealName,
						Email = Email,
						CreateTime = DateTime.Now,
						StageName = String.Empty,
						State = 1
					};
					db.users.Add(User);
					db.SaveChanges();
				}

				System.Web.HttpContext.Current.Session[Basic.SessionConfig.CurrentUser] = User;
			}
			return true;
		}

		/// <summary>
		/// 付款完成
		/// </summary>
		/// <param name="PayType">支付接口 1:Alipay</param>
		/// <param name="PayTradeNO">支付接口交易号</param>
		/// <param name="BuyerID">购买者ID</param>
		/// <param name="OrderID">订单ID</param>
		/// <returns></returns>
		public bool PayOK(int PayType, string PayTradeNO, string BuyerID, string OrderID)
		{
			var Result = false;
			using (DBEntities db = new DBEntities())
			{
				var Order = db.orders.FirstOrDefault(p => p.GUID == OrderID && p.UserID == BuyerID && p.State == 1);
				if (Order != null)
				{
					Order.State = 2;
					Order.PayType = 1;
					Order.PayOrderNo = PayTradeNO;
					Order.BuyerPayTime = DateTime.Now;
					db.SaveChanges();
					Result = true;
				}
			}
			return Result;
		}

		/// <summary>
		/// 交易成功
		/// </summary>
		/// <param name="PayTradeNO">支付接口交易号</param>
		/// <param name="BuyerID">购买者ID</param>
		/// <param name="OrderID">订单ID</param>
		/// <returns></returns>
		public bool TradeOK(string PayTradeNO, string BuyerID, string OrderID)
		{
			var Result = false;
			using (DBEntities db = new DBEntities())
			{
				var Order = db.orders.FirstOrDefault(p => p.GUID == OrderID && p.UserID == BuyerID && p.PayOrderNo == PayTradeNO);
				if (Order != null)
				{
					Order.State = 5;
					Order.ConfirmGoodsTime = DateTime.Now;

					#region 判断一个设计的所有交易是否都完成了
					if ((from o in db.orders
						 where o.DesignWorkID == Order.DesignWorkID && (o.State != 5 || o.State != 13 || o.State != -1)
						 select o).FirstOrDefault() == null)
					{
						var DesignWork = db.designworks.FirstOrDefault(p => p.GUID == Order.DesignWorkID && p.State == 4);
						if (DesignWork != null)
						{
							DesignWork.State = 5;
							DesignWork.CompletionTime = DateTime.Now;
						}
					}
					#endregion

					db.SaveChanges();
					Result = true;
				}
			}
			return Result;
		}

		//退款
		public int Refund(string PayTradeNO, string BuyerID, string OrderID)
		{
			return 0;
		}
	}
}
