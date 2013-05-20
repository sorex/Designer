using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using NLog;

using J.Entities;
using J.BusinessLogics.Basic;
using System.Text;
using J.Utility.Cryptography;

namespace J.MainWeb.Controllers
{
	public class HomeController : Controller
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();

		public ActionResult Index()
		{
			return View();
		}

		#region 注册
		public ActionResult Register()
		{
			return View();
		}

		public ActionResult SecurityCode()
		{
			SecurityCode sc = new SecurityCode();

			HttpContext.Response.ClearContent();

			if (null != sc.Image)
			{
				try
				{
					Session[SessionConfig.SecurityCode] = sc.Code;
					return File(sc.Image.ToArray(), "image/png");
				}
				finally
				{
					sc.Image.Close();
					sc.Image.Dispose();
				}
			}
			return Content("Error");
		}

		public ActionResult CheckLoginName(string LoginName)
		{
			using (DBEntities db = new DBEntities())
			{
				if(db.Users.Count(p=>p.LoginName == LoginName.ToLower()) == 0)
					return Content(JsonConvert.SerializeObject(new { code = 1, msg = "该账户可注册。" }));
				else
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该账户已被注册。" }));
			}
		}

		public ActionResult CheckStageName(string StageName)
		{
			using (DBEntities db = new DBEntities())
			{
				if (db.Users.Count(p => p.StageName == StageName) == 0)
					return Content(JsonConvert.SerializeObject(new { code = 1, msg = "该昵称可注册。" }));
				else
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该昵称已被注册。" }));
			}
		}

		public ActionResult CheckSecurityCode(string SecurityCode)
		{
			if (Session[SessionConfig.SecurityCode] != null && Session[SessionConfig.SecurityCode].ToString() == SecurityCode.Trim().ToLower())
				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "验证码输入正确。" }));
			else
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "验证码输入错误。" }));
		}


		[HttpPost]
		public ActionResult Register(string LoginName, string Password, string StageName, string SecurityCode)
		{
			LoginName = Encoding.UTF8.GetString(Convert.FromBase64String(LoginName)).Trim();
			Password = Encoding.UTF8.GetString(Convert.FromBase64String(Password));
			StageName = Encoding.UTF8.GetString(Convert.FromBase64String(StageName));

			if(!CheckData.IsEmail(Password))
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "帐号必须使用邮箱！" }));

			if (Password.Length > 50)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "帐号邮箱不能超过50个字符！" }));

			if (Password.Length > 30 || Password.Length < 4)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "密码必须在4~30个字符！" }));

			if (StageName.Length > 30 || StageName.Length < 4)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "昵称必须在4~30个字符！" }));

			if (!(Session[SessionConfig.SecurityCode] != null && Session[SessionConfig.SecurityCode].ToString() == SecurityCode.Trim().ToLower()))
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "验证码输入错误！" }));

			using (DBEntities db = new DBEntities())
			{
				if (db.Users.Count(p => p.LoginName == LoginName.ToLower()) > 0)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该账户已被注册。请重试！" }));

				if (db.Users.Count(p => p.StageName == StageName) > 0)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该昵称已被注册。请重试！" }));

				User user = new User() 
				{ 
					GUID = Guid.NewGuid().ToString(),
					LoginName = LoginName,
					Email = LoginName,
					Password = new DESEncrypt().EncryptString(Password),
					StageName = StageName,
					CreateTime = DateTime.Now,
					State = 0
				};

				db.Users.Add(user);
				try
				{
					db.SaveChanges();
					Session[SessionConfig.CurrentUser] = user;
				}
				catch (Exception e)
				{
					logger.Debug(e.Message);
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "未知错误。请重试！" }));
				}
			}

			return Content(JsonConvert.SerializeObject(new { code = 1, msg = "注册成功。" }));
		}
		#endregion
	}
}
