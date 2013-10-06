using Com.Alipay;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using J.Entities;
using J.MainWeb.App_Code;
using J.BusinessLogics.Basic;

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
			string return_url = System.Configuration.ConfigurationManager.AppSettings["WebUrl"] + "Alipay/Alipay_Login_return_url";
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

		public ActionResult Alipay_Login_return_url()
		{
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

					//支付宝用户号
					string user_id = Request.QueryString["user_id"];

					//授权令牌
					string token = Request.QueryString["token"];

					//支付宝用户姓名或淘宝昵称
					string real_name = Request.QueryString["real_name"];

					//用户支付宝登录账号【可能是邮箱或手机号】
					string email = Request.QueryString["email"];


					using (DBEntities db = new DBEntities())
					{
						var User = db.users.FirstOrDefault(p => p.GUID == user_id);
						if (User != null)
						{
							if (User.RealName != real_name)
								User.RealName = real_name;
							if (email != null && User.Email != email)
								User.Email = email;
							db.SaveChanges();
						}
						else
						{
							User = new user
							{
								GUID = user_id,
								RealName = real_name,
								Email = email ?? String.Empty,
								CreateTime = DateTime.Now,
								StageName = String.Empty,
								State = 1
							};
							db.users.Add(User);
							db.SaveChanges();
						}

						Session[SessionConfig.CurrentUser] = User;
					}

					//判断是否在商户网站中已经做过了这次通知返回的处理
					//如果没有做过处理，那么执行商户的业务程序
					//如果有做过处理，那么不执行商户的业务程序

					//打印页面
					//刷新父页面，自动关闭本页面
					return Content("验证成功<script type=\"text/javascript\">self.opener.location.reload(); self.opener = null; self.close(); </script>");
					

					//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
				}
				else//验证失败
				{
					//3秒后自动关闭
					return Content("验证失败<script type=\"text/javascript\">function AutoClose(){self.opener = null; self.close();} setTimeout(\"AutoClose();\",3000); </script>");
				}
			}
			else
			{
				//3秒后自动关闭
				return Content("无返回参数<script type=\"text/javascript\">function AutoClose(){self.opener = null; self.close();} setTimeout(\"AutoClose();\",3000); </script>");
			}
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
			string notify_url = System.Configuration.ConfigurationManager.AppSettings["WebUrl"] + "Alipay/Alipay_Pay_notify_url";
			//需http://格式的完整路径，不能加?id=123这类自定义参数

			//页面跳转同步通知页面路径
			string return_url = System.Configuration.ConfigurationManager.AppSettings["WebUrl"] + "Alipay/Alipay_Pay_return_url";
			//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

			//卖家支付宝帐户
			string seller_email = Config.Seller_email;
			//必填

			//商户订单号
			string out_trade_no = Order.GUID;
			//商户网站订单系统中唯一订单号，必填

			//订单名称
			string subject = Order.Subject;
			//必填

			//付款金额
			string total_fee = Order.Total.ToString();
			//必填

			//订单描述
			string body = Order.Body;

			//商品展示地址
			string show_url = System.Configuration.ConfigurationManager.AppSettings["WebUrl"] + "Logic/Buy?guid=" + Order.DesignWorkID;
			//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

			//防钓鱼时间戳
			string anti_phishing_key = "";
			//若要使用请调用类文件submit中的query_timestamp函数

			//客户端的IP地址
			string exter_invoke_ip = "";
			//非局域网的外网IP地址，如：221.0.0.1

			//共用回传参数
			string extra_common_param = "";
			//如果用户请求时传递了该参数，则返回给商户时会回传该参数

			//超时时间(TODO 需联系)
			string it_b_pay = "90m";
			//设置未付款交易的超时时间，一旦超时，该笔交易就会自动被关闭。取值范围：1m～15d 。 m-分钟，h- 小时，d- 天，1c-当天（无论交易何时创建，都在0 点关闭）。该参数数值不接受小数点，如1.5h ，可转换为90m 。 该功能需要联系支付宝配置关闭时间。

			////////////////////////////////////////////////////////////////////////////////////////////////

			//把请求参数打包成数组
			SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
			sParaTemp.Add("partner", Config.Partner);
			sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
			sParaTemp.Add("service", "create_direct_pay_by_user");
			sParaTemp.Add("payment_type", payment_type);
			sParaTemp.Add("notify_url", notify_url);
			sParaTemp.Add("return_url", return_url);
			sParaTemp.Add("seller_email", seller_email);
			sParaTemp.Add("out_trade_no", out_trade_no);
			sParaTemp.Add("subject", subject);
			sParaTemp.Add("total_fee", total_fee);
			sParaTemp.Add("body", body);
			sParaTemp.Add("show_url", show_url);
			sParaTemp.Add("anti_phishing_key", anti_phishing_key);
			sParaTemp.Add("exter_invoke_ip", exter_invoke_ip);
			sParaTemp.Add("extra_common_param", extra_common_param);

			//建立请求
			string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");
			return Content(sHtmlText);
		}

		/// <summary>
		/// 处理付款的逻辑
		/// </summary>
		/// <param name="Args"></param>
		/// <returns></returns>
		public string Alipay_Pay_logic(NameValueCollection Args)
		{
			String Result = String.Empty;

			SortedDictionary<string, string> sPara = GetRequestGet();

			if (sPara.Count > 0)//判断是否有带返回参数
			{
				Notify aliNotify = new Notify();
				bool verifyResult = aliNotify.Verify(sPara, Args["notify_id"], Args["sign"]);

				if (verifyResult)//验证成功
				{
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
					//请在这里加上商户的业务逻辑程序代码


					//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
					//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

					//商户订单号
					string out_trade_no = Args["out_trade_no"];

					//支付宝交易号
					string trade_no = Args["trade_no"];

					//交易状态
					string trade_status = Args["trade_status"];


					if (Args["trade_status"] == "TRADE_FINISHED" || Args["trade_status"] == "TRADE_SUCCESS")
					{
						//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

						//注意：
						//该种交易状态只在两种情况下出现
						//1、开通了普通即时到账，买家付款成功后。
						//2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。

						//注意：
						//该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。

						using (DBEntities db = new DBEntities())
						{
							var Order = db.orders.FirstOrDefault(p => p.GUID == out_trade_no);
							if (Order.State == 1)
							{
								//未处理订单
								DateTime payTime;
								if (Args["gmt_payment"] != null && DateTime.TryParse(Args["gmt_payment"], out payTime))
									Order.BuyerPayTime = payTime;
								else
									Order.BuyerPayTime = DateTime.Now;
								Order.State = 2;
								Order.PayType = 1;
								Order.PayOrderNo = trade_no;
								Order.PayUserID = Args["buyer_id"];
								Order.PayUserName = Args["buyer_email"];

								//添加已售数量
								Order.designwork.SalesVolume++;

								db.SaveChanges();
								Result = "success,付款成功";
							}
							else
							{
								//已处理订单
								Result = "success,已处理订单";
							}
						}
					}
					else
					{
						Result = "success,trade_status=" + Args["trade_status"];
					}

					//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
					// Result = "success"; //请不要修改或删除

					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
				}
				else //验证失败
				{
					Result = "验证失败";
				}
			}
			else
			{
				Result = "无返回参数";
			}

			return Result;
		}

		public ActionResult Alipay_Pay_return_url()
		{
			var Result = Alipay_Pay_logic(Request.QueryString);

			if (Result.Length > 7)
				Result = Result.Substring(8);

			return Content(Result);
		}

		[HttpPost]
		public ActionResult Alipay_Pay_notify_url()
		{
			var Result = Alipay_Pay_logic(Request.Form);

			if (Result.Length >= 7)
				Result = Result.Substring(0, 7);

			return Content(Result);
		}
		#endregion

		#region Post

		#endregion
	}
}
