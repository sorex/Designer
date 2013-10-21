using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
		/// <param name="date">当日需要移送到工厂的日期</param>
		/// <returns></returns>
		public ActionResult ProductionTask(string date)
		{
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
