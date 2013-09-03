using Com.Alipay;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using J.Entities;
using J.MainWeb.App_Code;

namespace J.MainWeb.Controllers
{
	public class AlipayController : BaseController
	{
		//
		// GET: /Alipay/

		public ActionResult Index()
		{
			return View();
		}

		#region 服务器异步通知页面
		/// <summary>
		/// 功能：服务器异步通知页面
		/// 版本：3.3
		/// 日期：2012-07-10
		/// 说明：
		/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
		/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
		/// 
		/// ///////////////////页面功能说明///////////////////
		/// 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
		/// 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
		/// 该页面调试工具请使用写文本函数logResult。
		/// 如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
		/// </summary>
		[HttpPost]
		public ActionResult notify_url()
		{
			String Result = String.Empty;
			SortedDictionary<string, string> sPara = GetRequestPost();

			if (sPara.Count > 0)//判断是否有带返回参数
			{
				Notify aliNotify = new Notify();
				bool verifyResult = aliNotify.Verify(sPara, Request.Form["notify_id"], Request.Form["sign"]);

				if (verifyResult)//验证成功
				{
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
					//请在这里加上商户的业务逻辑程序代码
					#region 自行添加的业务逻辑
					string user_id = Request.Form["user_id"];
					string trade_status = Request.Form["trade_status"];
					string refund_status = Request.Form["refund_status"];

					if (user_id != null)
					{
						//执行登陆逻辑
					}
					if (trade_status != null)
					{
						//交易逻辑
						if(refund_status != null)
						{
							//退款状态
						}
						else
						{
							//交易状态
						}
					}
					#endregion

					//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
					//获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表

					//商户订单号

					string out_trade_no = Request.Form["out_trade_no"];

					//支付宝交易号

					string trade_no = Request.Form["trade_no"];

					//交易状态
					//string trade_status = Request.Form["trade_status"];


					if (Request.Form["trade_status"] == "WAIT_BUYER_PAY")
					{//该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款

						//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

						Result = "success";  //请不要修改或删除
					}
					else if (Request.Form["trade_status"] == "WAIT_SELLER_SEND_GOODS")
					{//该判断示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货

						//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

						Result = "success";  //请不要修改或删除
					}
					else if (Request.Form["trade_status"] == "WAIT_BUYER_CONFIRM_GOODS")
					{//该判断表示卖家已经发了货，但买家还没有做确认收货的操作

						//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

						Result = "success";  //请不要修改或删除
					}
					else if (Request.Form["trade_status"] == "TRADE_FINISHED")
					{//该判断表示买家已经确认收货，这笔交易完成

						//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

						Result = "success";  //请不要修改或删除
					}
					else
					{
						Result = "success";  //其他状态判断。
					}

					//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
				}
				else//验证失败
				{
					Result = "fail";
				}
			}
			else
			{
				Result = "无通知参数";
			}

			return Content(Result);
		}

		/// <summary>
		/// 获取支付宝POST过来通知消息，并以“参数名=参数值”的形式组成数组
		/// </summary>
		/// <returns>request回来的信息组成的数组</returns>
		public SortedDictionary<string, string> GetRequestPost()
		{
			int i = 0;
			SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
			NameValueCollection coll;
			//Load Form variables into NameValueCollection variable.
			coll = Request.Form;

			// Get names of all forms into a string array.
			String[] requestItem = coll.AllKeys;

			for (i = 0; i < requestItem.Length; i++)
			{
				sArray.Add(requestItem[i], Request.Form[requestItem[i]]);
			}

			return sArray;
		}
		#endregion

		#region 页面跳转同步通知页面
		/// <summary>
		/// 功能：页面跳转同步通知页面
		/// 版本：3.3
		/// 日期：2012-07-10
		/// 说明：
		/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
		/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
		/// 
		/// ///////////////////////页面功能说明///////////////////////
		/// 该页面可在本机电脑测试
		/// 可放入HTML等美化页面的代码、商户业务逻辑程序代码
		/// 该页面可以使用ASP.NET开发工具调试，也可以使用写文本函数LogResult进行调试
		/// </summary>
		public ActionResult return_url()
		{
			String Result = String.Empty;
			SortedDictionary<string, string> sPara = GetRequestGet();

			if (sPara.Count > 0)//判断是否有带返回参数
			{
				Notify aliNotify = new Notify();
				bool verifyResult = aliNotify.Verify(sPara, Request.QueryString["notify_id"], Request.QueryString["sign"]);

				if (verifyResult)//验证成功
				{
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
					//请在这里加上商户的业务逻辑程序代码


					//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
					//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

					//商户订单号

					string out_trade_no = Request.QueryString["out_trade_no"];

					//支付宝交易号

					string trade_no = Request.QueryString["trade_no"];

					//交易状态
					string trade_status = Request.QueryString["trade_status"];


					if (Request.QueryString["trade_status"] == "WAIT_SELLER_SEND_GOODS")
					{
						//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
					}
					else
					{
						Result = "trade_status=" + Request.QueryString["trade_status"];
					}

					//打印页面
					Result = "验证成功<br />";

					//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
				}
				else//验证失败
				{
					Result = "验证失败";
				}
			}
			else
			{
				Result = "无返回参数";
			}

			return Content(Result);
		}

		/// <summary>
		/// 获取支付宝GET过来通知消息，并以“参数名=参数值”的形式组成数组
		/// </summary>
		/// <returns>request回来的信息组成的数组</returns>
		public SortedDictionary<string, string> GetRequestGet()
		{
			int i = 0;
			SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
			NameValueCollection coll;
			//Load Form variables into NameValueCollection variable.
			coll = Request.QueryString;

			// Get names of all forms into a string array.
			String[] requestItem = coll.AllKeys;

			for (i = 0; i < requestItem.Length; i++)
			{
				sArray.Add(requestItem[i], Request.QueryString[requestItem[i]]);
			}

			return sArray;
		}
		#endregion

		#region Login
		public ActionResult Alipay_Login()
		{
			////////////////////////////////////////////请求参数////////////////////////////////////////////

			//目标服务地址
			string target_service = "user.auth.quick.login";
			//必填
			//必填，页面跳转同步通知页面路径
			string return_url = "http://www.cysjf.com/Alipay/return_url_login";
			//需http://格式的完整路径，不允许加?id=123这类自定义参数

			//防钓鱼时间戳
			string anti_phishing_key = "";
			//若要使用请调用类文件submit中的query_timestamp函数

			//客户端的IP地址
			string exter_invoke_ip = "";
			//非局域网的外网IP地址，如：221.0.0.1


			////////////////////////////////////////////////////////////////////////////////////////////////

			//把请求参数打包成数组
			SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
			sParaTemp.Add("partner", Config.Partner);
			sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
			sParaTemp.Add("service", "alipay.auth.authorize");
			sParaTemp.Add("target_service", target_service);
			sParaTemp.Add("return_url", return_url);
			sParaTemp.Add("anti_phishing_key", anti_phishing_key);
			sParaTemp.Add("exter_invoke_ip", exter_invoke_ip);

			//建立请求
			string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");

			return Content(sHtmlText);
		}
		#endregion

		#region Pay
		public ActionResult Alipay_Pay(string OrderID)
		{
			order Order = null;
			string UserID = base.CurrentUser.GUID;
			using (DBEntities db = new DBEntities())
			{
				Order = db.orders.FirstOrDefault(p => p.GUID == OrderID && p.UserID == UserID && p.State == 1);
			}

			if (Order == null)
				return RedirectToAction("Error", "Home", new { Message = "订单不存在，或者已超时！" });


			////////////////////////////////////////////请求参数////////////////////////////////////////////

			//支付类型
			string payment_type = "1";
			//必填，不能修改
			//服务器异步通知页面路径
			string notify_url = "http://www.xxx.com/create_partner_trade_by_buyer-CSHARP-UTF-8/notify_url.aspx";
			//需http://格式的完整路径，不能加?id=123这类自定义参数

			//页面跳转同步通知页面路径
			string return_url = "http://www.xxx.com/create_partner_trade_by_buyer-CSHARP-UTF-8/return_url.aspx";
			//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

			//卖家支付宝帐户
			string seller_email = System.Configuration.ConfigurationManager.AppSettings["SellerEmail"];
			//必填

			//商户订单号
			string out_trade_no = Order.GUID;
			//商户网站订单系统中唯一订单号，必填

			//订单名称
			string subject = Order.Subject;
			//必填

			//商品单价
			string price = Order.Price.ToString();
			//必填

			//商品数量
			string quantity = Order.Quantity.ToString();
			//必填，建议默认为1，不改变值，把一次交易看成是一次下订单而非购买一件商品
			//物流费用
			string logistics_fee = Order.Freight.ToString();
			//必填，即运费
			//物流类型
			string logistics_type = "EXPRESS";
			//必填，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
			//物流支付方式
			string logistics_payment = Order.Freight == 0 ? "SELLER_PAY" : "BUYER_PAY";
			//必填，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）

			//商品总价
			string total_fee = Order.Total.ToString();
			//可空

			//订单描述

			string body = Order.Body;
			//商品展示地址
			string show_url = System.Configuration.ConfigurationManager.AppSettings["WebUrl"] + "Logic/Buy?guid=" + Order.DesignWorkID;
			//需以http://开头的完整路径，如：http://www.xxx.com/myorder.html

			//收货人姓名
			string receive_name = Order.Consignee;
			//如：张三

			//收货人地址
			string receive_address = Order.Address;
			//如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号

			//收货人邮编
			string receive_zip = Order.ZipCode;
			//如：123456

			//收货人电话号码
			string receive_phone = Order.Phone;
			//如：0571-88158090

			//收货人手机号码
			string receive_mobile = Order.Mobile;
			//如：13312341234


			////////////////////////////////////////////////////////////////////////////////////////////////

			//把请求参数打包成数组
			SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
			sParaTemp.Add("partner", Config.Partner);
			sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
			sParaTemp.Add("service", "create_partner_trade_by_buyer");
			sParaTemp.Add("payment_type", payment_type);
			sParaTemp.Add("notify_url", notify_url);
			sParaTemp.Add("return_url", return_url);
			sParaTemp.Add("seller_email", seller_email);
			sParaTemp.Add("out_trade_no", out_trade_no);
			sParaTemp.Add("subject", subject);
			sParaTemp.Add("price", price);
			sParaTemp.Add("quantity", quantity);
			sParaTemp.Add("logistics_fee", logistics_fee);
			sParaTemp.Add("logistics_type", logistics_type);
			sParaTemp.Add("logistics_payment", logistics_payment);
			sParaTemp.Add("total_fee", total_fee);
			sParaTemp.Add("body", body);
			sParaTemp.Add("show_url", show_url);
			sParaTemp.Add("receive_name", receive_name);
			sParaTemp.Add("receive_address", receive_address);
			sParaTemp.Add("receive_zip", receive_zip);
			sParaTemp.Add("receive_phone", receive_phone);
			sParaTemp.Add("receive_mobile", receive_mobile);

			//建立请求
			string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");
			return Content(sHtmlText);

		}
		#endregion
	}
}
