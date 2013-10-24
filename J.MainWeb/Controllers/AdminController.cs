using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using J.Entities;

namespace J.MainWeb.Controllers
{
	public class AdminController : Controller
	{
		//
		// GET: /Admin/

		public ActionResult Index()
		{
			return View();
		}

		/// <summary>
		/// 生产任务
		/// </summary>
		/// <param name="date">当日需要移送到工厂的日期(2013-12-31)</param>
		/// <returns></returns>
		public ActionResult ProductionTask(string date = null)
		{
			DateTime StartTime;
			if (date == null || DateTime.TryParse(date + " 00:00:00", out StartTime))
			{
				StartTime = DateTime.Parse(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd") + " 00:00:00");
			}
			DateTime EndTime = StartTime.AddDays(1);
			
			using (DBEntities db = new DBEntities())
			{
				var EndDesignworks = (from d in db.designworks
						  where d.EndTime >= StartTime && d.EndTime < EndTime
						  select d).ToList();

				foreach (var d in EndDesignworks)
				{

				}
			}
			return View();
		}

		public ActionResult ProductionTaskAccept(string date)
		{
			DateTime StartTime = DateTime.Parse(date + " 00:00:00");
			DateTime EndTime = StartTime.AddDays(1);

			using (DBEntities db = new DBEntities())
			{
				var EndDesignworks = (from d in db.designworks
									  where d.EndTime >= StartTime && d.EndTime < EndTime
									  select d).ToList();

				foreach (var d in EndDesignworks)
				{
					if (d.SalesGoal <= d.SalesVolume)
					{
						//预售成功
					}
					else
					{
						//预售失败，退款中
					}
				}
			}


			return View();
		}

		/// <summary>
		/// 发货任务
		/// </summary>
		/// <param name="date">任务递交到工厂的日期</param>
		/// <returns></returns>
		public ActionResult SendGoodsTask(string date)
		{
			return View();
		}

		/// <summary>
		/// 退款操作界面（退款操作，退款查询）
		/// </summary>
		/// <returns></returns>
		public ActionResult RefundManage()
		{
			return View();
		}

		/// <summary>
		/// 退货操作界面（退货操作，退货查询）
		/// </summary>
		/// <returns></returns>
		public ActionResult RefundGoodsManage()
		{
			return View();
		}
	}
}
