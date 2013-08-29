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
using J.Utility;
using System.IO;
using J.MainWeb.App_Code;

namespace J.MainWeb.Controllers
{
	public class HomeController : BaseController
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();

		public ActionResult Index()
		{
			if (Session[SessionConfig.CurrentUser] == null)
				using (DBEntities db = new DBEntities())
				{
					var User = (from u in db.users
								where u.GUID == "9ece1f8700bb4dd38832f14e4b480107"
								select u).FirstOrDefault();

					Session[SessionConfig.CurrentUser] = User;
				}
			
			return View();
		}

		#region 验证码
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

		public ActionResult CheckSecurityCode(string SecurityCode)
		{
			if (Session[SessionConfig.SecurityCode] != null && Session[SessionConfig.SecurityCode].ToString() == SecurityCode.Trim().ToLower())
				return Content(JsonConvert.SerializeObject(new { code = 1, msg = "验证码输入正确。" }));
			else
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "验证码输入错误。" }));
		}
		#endregion

		#region 注册
		/*
		public ActionResult Register()
		{
			return View();
		}

		public ActionResult CheckLoginName(string LoginName)
		{
			using (DBEntities db = new DBEntities())
			{
				if (db.users.Count(p => p.LoginName == LoginName.ToLower()) == 0)
					return Content(JsonConvert.SerializeObject(new { code = 1, msg = "该账户可注册。" }));
				else
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该账户已被注册。" }));
			}
		}

		public ActionResult CheckStageName(string StageName)
		{
			using (DBEntities db = new DBEntities())
			{
				if (db.users.Count(p => p.StageName == StageName) == 0)
					return Content(JsonConvert.SerializeObject(new { code = 1, msg = "该昵称可注册。" }));
				else
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该昵称已被注册。" }));
			}
		}

		[HttpPost]
		public ActionResult Register(string LoginName, string Password, string StageName, string SecurityCode)
		{
			LoginName = Encoding.UTF8.GetString(Convert.FromBase64String(LoginName)).Trim().ToLower();
			Password = Encoding.UTF8.GetString(Convert.FromBase64String(Password));

			if (!CheckData.IsEmail(LoginName))
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "帐号必须使用邮箱！" }));

			if (LoginName.Length > 50)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "帐号邮箱不能超过50个字符！" }));

			if (Password.Length > 30 || Password.Length < 4)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "密码必须在4~30个字符！" }));

			if (StageName.Length > 30 || StageName.Length < 4)
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "昵称必须在4~30个字符！" }));

			if (!(Session[SessionConfig.SecurityCode] != null && Session[SessionConfig.SecurityCode].ToString() == SecurityCode.Trim().ToLower()))
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "验证码输入错误！" }));

			using (DBEntities db = new DBEntities())
			{
				//if (db.users.Count(p => p.LoginName == LoginName.ToLower()) > 0)
				//	return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该账户已被注册。请重试！" }));

				if (db.users.Count(p => p.StageName == StageName) > 0)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "该昵称已被注册。请重试！" }));

				user User = new user()
				{
					GUID = Basic.NewGuid(),
					LoginName = LoginName,
					Email = LoginName,
					Password = new DESEncrypt().EncryptString(Password),
					StageName = StageName,
					CreateTime = DateTime.Now,
					State = 0
				};

				db.users.Add(User);
				try
				{
					db.SaveChanges();
					Session[SessionConfig.CurrentUser] = User;
				}
				catch (Exception e)
				{
					logger.Debug(e.Message);
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "未知错误。请重试！" }));
				}
			}

			return Content(JsonConvert.SerializeObject(new { code = 1, msg = "注册成功。" }));
		}
		*/
		#endregion

		#region 登录
		/*
		public ActionResult Login()
		{
			return View();
		}

		[HttpPost]
		public ActionResult Login(string LoginName, string Password, string SecurityCode)
		{
			LoginName = Encoding.UTF8.GetString(Convert.FromBase64String(LoginName)).Trim().ToLower();
			Password = Encoding.UTF8.GetString(Convert.FromBase64String(Password));

			if (!(Session[SessionConfig.SecurityCode] != null && Session[SessionConfig.SecurityCode].ToString() == SecurityCode.Trim().ToLower()))
				return Content(JsonConvert.SerializeObject(new { code = -1, msg = "<p><span style='color: red;'>验证码</span>输入错误！</p>" }));

			Password = new DESEncrypt().EncryptString(Password);

			using (DBEntities db = new DBEntities())
			{
				var User = (from u in db.users
							where u.LoginName == LoginName && u.Password == Password
							select u).FirstOrDefault();

				if (User == null)
					return Content(JsonConvert.SerializeObject(new { code = -1, msg = "<p><span style='color: red;'>邮箱</span>或<span style='color: red;'>密码</span>错误！</p>" }));
				else
				{
					Session[SessionConfig.CurrentUser] = User;
					return Content(JsonConvert.SerializeObject(new { code = 1, msg = "登录成功。" }));
				}
			}
		}

		public ActionResult LoginPartial()
		{
			return PartialView();
		}
		*/
		#endregion

		public ActionResult Error(string msg)
		{
			ViewBag.Message = msg;
			return View();
		}

		#region API
		[HttpPost]
		public ActionResult UploadDesignImage(string GUID, string UploadPath)
		{
			if(base.CurrentUser == null)
				return Redirect("Home/Login");
			HttpPostedFileBase file = Request.Files["Filedata"]; //获取单独文件的访问
			var fileGuid = Guid.NewGuid().ToString();//生成随机的guid
			try
			{
				if (file != null)
				{
					materialpicture mp;
					using (DBEntities db = new DBEntities())
					{
						mp = db.materialpictures.FirstOrDefault(p => p.GUID == GUID);
					}
					if (mp == null)
						return Content(JsonConvert.SerializeObject(new { state = "error", msg = "服务器禁止上传规定外的文件！" }));
					if (String.IsNullOrWhiteSpace(UploadPath))
						UploadPath = Basic.NewGuid();

					var UploadFullPath = Server.MapPath("~/Static/UserFiles") + "\\temp\\" + UploadPath;

					//上传路径不存在则创建路径
					if (!Directory.Exists(UploadFullPath))
						Directory.CreateDirectory(UploadFullPath);

					//已存在文件则删除
					if (System.IO.File.Exists(UploadFullPath + "\\" + mp.FileName))
						System.IO.File.Delete(UploadFullPath + "\\" + mp.FileName);

					file.SaveAs(UploadFullPath + "\\" + mp.FileName);
					System.Drawing.Image img = System.Drawing.Image.FromFile(UploadFullPath + "\\" + mp.FileName);
					//图片尺寸不正确则删除
					if (img.Height != mp.UploadHeight || img.Width != mp.UploadWidth)
					{
						img.Dispose();
						System.IO.File.Delete(UploadFullPath + "\\" + mp.FileName);
						return Content(JsonConvert.SerializeObject(new { state = "error", msg = "图片尺寸不正确，必须上传 " + mp.UploadWidth + "x" + mp.UploadHeight + " 大小的图片。" }));
					}
					img.Dispose();

					return Content(JsonConvert.SerializeObject(new { state = "success", msg = UploadPath, userID = base.CurrentUser.GUID }));
				}
				return Content(JsonConvert.SerializeObject(new { state = "error", msg = "文件不存在，请重新上传！" }));
			}
			catch (Exception e)
			{
				return Content(JsonConvert.SerializeObject(new { state = "error", msg = e.Message }));
			}
		}
		#endregion
	}
}
