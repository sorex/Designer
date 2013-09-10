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
using System.Drawing;

namespace J.MainWeb.Controllers
{
	public class HomeController : BaseController
	{
		private static Logger logger = LogManager.GetCurrentClassLogger();

		//[OutputCache(Duration = 3600)]
		public ActionResult Index()
		{
			//if (Session[SessionConfig.CurrentUser] == null)
			//	using (DBEntities db = new DBEntities())
			//	{
			//		var User = (from u in db.users
			//					where u.GUID == "9ece1f8700bb4dd38832f14e4b480107"
			//					select u).FirstOrDefault();

			//		Session[SessionConfig.CurrentUser] = User;
			//	}

			using (DBEntities db = new DBEntities())
			{
				var ShowIDs = "b1bed31ded4740f6801bc5490badbc6d,dc68dcd318d14e019c23ba84a2605c03".Split(',');
				var search = (from dw in db.designworks
							  where ShowIDs.Contains(dw.GUID)
							  orderby dw.StartTime descending
							  select dw).ToList();

				var result = new[] { new {
					GUID = "GUID", 
					DesignerID = "DesignerID",
					MaterialPictureFileName = "MaterialPictureFileName",
					DesignerName = "DesignerName",
					Title = "Title",
					Description = "Description",
					SellingPrice = "1.00",
					SalesVolume = "1",
					SalesGoal = "1",
					EndTime = "2013-07-10 14:52"
				} }.ToList();
				result.Clear();

				foreach (var dw in search)
				{
					var MaterialPictureFileName = dw.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

					result.Add(new
					{
						GUID = dw.GUID,
						DesignerID = dw.user.GUID,
						MaterialPictureFileName = MaterialPictureFileName,
						DesignerName = dw.user.StageName,
						Title = dw.Title,
						Description = dw.Description,
						SellingPrice = dw.SellingPrice.ToString("0.00"),
						SalesVolume = dw.SalesVolume.Value.ToString(),
						SalesGoal = dw.SalesGoal.ToString(),
						EndTime = dw.EndTime == null ? String.Empty : dw.EndTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
					});
				}

				ViewBag.Data = JsonConvert.SerializeObject(new { items = result });
			}

			return View();
		}

		//[OutputCache(Duration = 3600)]
		public ActionResult AllDesign(int pageIndex = 0)
		{
			using (DBEntities db = new DBEntities())
			{
				var alldesignworks = from dw in db.designworks
									 where dw.State > 0
									 orderby dw.EndTime descending
									 select dw;

				var recordCount = alldesignworks.Count();
				//页数以0开始，无余数时需-1
				var pageAll = recordCount == 0 ? 0 : recordCount / SystemConfig.AllDesignPageSize - (recordCount % SystemConfig.AllDesignPageSize == 0 ? 1 : 0);
				if (pageIndex > pageAll) pageIndex = pageAll;

				var search = alldesignworks.Skip(pageIndex * SystemConfig.AllDesignPageSize).Take(SystemConfig.AllDesignPageSize).ToList();


				var result = new[] { new {
					GUID = "GUID", 
					DesignerID = "DesignerID",
					MaterialPictureFileName = "MaterialPictureFileName",
					DesignerName = "DesignerName",
					Title = "Title",
					Description = "Description",
					SellingPrice = "1.00",
					SalesVolume = "1",
					SalesGoal = "1",
					EndTime = "2013-07-10 14:52"
				} }.ToList();
				result.Clear();

				foreach (var dw in search)
				{
					var MaterialPictureFileName = dw.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

					result.Add(new
					{
						GUID = dw.GUID,
						DesignerID = dw.user.GUID,
						MaterialPictureFileName = MaterialPictureFileName,
						DesignerName = dw.user.StageName,
						Title = dw.Title,
						Description = dw.Description,
						SellingPrice = dw.SellingPrice.ToString("0.00"),
						SalesVolume = dw.SalesVolume.Value.ToString(),
						SalesGoal = dw.SalesGoal.ToString(),
						EndTime = dw.EndTime == null ? String.Empty : dw.EndTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
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

		public ActionResult UserDesign(string userID, int pageIndex = 0)
		{

			using (DBEntities db = new DBEntities())
			{
				var alldesignworks = from dw in db.designworks
									 where dw.State > 0 && dw.DesignerID == userID
									 orderby dw.EndTime descending
									 select dw;

				var recordCount = alldesignworks.Count();
				//页数以0开始，无余数时需-1
				var pageAll = recordCount == 0 ? 0 : recordCount / SystemConfig.AllDesignPageSize - (recordCount % SystemConfig.AllDesignPageSize == 0 ? 1 : 0);
				if (pageIndex > pageAll) pageIndex = pageAll;

				var search = alldesignworks.Skip(pageIndex * SystemConfig.AllDesignPageSize).Take(SystemConfig.AllDesignPageSize).ToList();


				var result = new[] { new {
					GUID = "GUID", 
					DesignerID = "DesignerID",
					MaterialPictureFileName = "MaterialPictureFileName",
					DesignerName = "DesignerName",
					Title = "Title",
					Description = "Description",
					SellingPrice = "1.00",
					SalesVolume = "1",
					SalesGoal = "1",
					EndTime = "2013-07-10 14:52"
				} }.ToList();
				result.Clear();

				foreach (var dw in search)
				{
					var MaterialPictureFileName = dw.material.materialpictures.OrderBy(p => p.Index).FirstOrDefault().FileName;

					result.Add(new
					{
						GUID = dw.GUID,
						DesignerID = dw.user.GUID,
						MaterialPictureFileName = MaterialPictureFileName,
						DesignerName = dw.user.StageName,
						Title = dw.Title,
						Description = dw.Description,
						SellingPrice = dw.SellingPrice.ToString("0.00"),
						SalesVolume = dw.SalesVolume.Value.ToString(),
						SalesGoal = dw.SalesGoal.ToString(),
						EndTime = dw.EndTime == null ? String.Empty : dw.EndTime.Value.ToString("yyyy-MM-dd HH:mm:ss"),
					});
				}

				ViewBag.Data = JsonConvert.SerializeObject(new { items = result });
				ViewBag.HasNext = pageAll > pageIndex;
				ViewBag.NextPageIndex = pageIndex + 1;
				ViewBag.HasPrev = pageIndex > 0;
				ViewBag.PrevPageIndex = pageIndex - 1;
				ViewBag.pageIndex = pageIndex;

				ViewBag.userID = userID;
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

		#region 添加数据
		/*
		public ActionResult AddData()
		{
			using (DBEntities db = new DBEntities())
			{
				var mt = db.materialtypes.FirstOrDefault(p => p.GUID == "tshirt");

				#region material
				var m1 = new material
				{
					GUID = "womanshorttee",
					TypeID = mt.GUID,
					Name = "女士短袖T恤",
					Price = 45.0m,
					Description = String.Empty,
					PictureNumber = 2,
					State = 1
				};
				#endregion
				#region materialsize
				var m1ms1 = new materialsize
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					SizeName = "XS",
					Index = 1
				};
				var m1ms2 = new materialsize
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					SizeName = "S",
					Index = 2
				};
				var m1ms3 = new materialsize
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					SizeName = "M",
					Index = 3
				};
				var m1ms4 = new materialsize
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					SizeName = "L",
					Index = 4
				};
				#endregion
				#region materialcolor
				var m1mc1 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "白色",
					ColorCode = "ffffff",
					IsDefault = true,
					State = 1
				};
				var m1mc2 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "黑色",
					ColorCode = "1a1a1a",
					IsDefault = false,
					State = 1
				};
				var m1mc3 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "灰色",
					ColorCode = "d4cfc3",
					IsDefault = false,
					State = 1
				};
				var m1mc4 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "深蓝色",
					ColorCode = "1a2f78",
					IsDefault = false,
					State = 1
				};
				var m1mc5 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "深红色",
					ColorCode = "9f0110",
					IsDefault = false,
					State = 1
				};
				var m1mc6 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "橙色",
					ColorCode = "e54d09",
					IsDefault = false,
					State = 1
				};
				var m1mc7 = new materialcolor
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					ColorName = "紫色",
					ColorCode = "4b256e",
					IsDefault = false,
					State = 1
				};
				#endregion
				#region materialpicture
				var m1mp1 = new materialpicture
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					Name = "正面",
					Index = 1,
					FileName = "01.png",
					Width = 530,
					Height = 630,
					Top = 105,
					Left = 145,
					UploadWidth = 842,
					UploadHeight = 1190,
					ShowScale = 0.285m
				};
				var m1mp2 = new materialpicture
				{
					GUID = Basic.NewGuid(),
					MaterialID = m1.GUID,
					Name = "背面",
					Index = 2,
					FileName = "02.png",
					Width = 530,
					Height = 630,
					Top = 105,
					Left = 145,
					UploadWidth = 842,
					UploadHeight = 1190,
					ShowScale = 0.285m
				};
				#endregion

				#region AddToDB
				db.materials.Add(m1);
				db.materialcolors.Add(m1mc1);
				db.materialcolors.Add(m1mc2);
				db.materialcolors.Add(m1mc3);
				db.materialcolors.Add(m1mc4);
				db.materialcolors.Add(m1mc5);
				db.materialcolors.Add(m1mc6);
				db.materialcolors.Add(m1mc7);
				db.materialpictures.Add(m1mp1);
				db.materialpictures.Add(m1mp2);
				db.materialsizes.Add(m1ms1);
				db.materialsizes.Add(m1ms2);
				db.materialsizes.Add(m1ms3);
				db.materialsizes.Add(m1ms4);
				db.SaveChanges();
				#endregion
				#region 保存文件
				// D:\Work\GitHub\Designer\J.MainWeb\Static\SystemFiles\tshirt
				foreach (var mc in m1.materialcolors)
				{
					foreach (var mp in m1.materialpictures)
					{
						CreateP(m1.GUID, mc.ColorCode, mp.FileName, mp.Index);
					}
				}
				#endregion
			}

			return View();
		}

		public void CreateP(string guid, string ColorCode, string FileName, int Index)
		{
			var dir = "D:\\Work\\GitHub\\Designer\\J.MainWeb\\Static\\SystemFiles\\tshirt\\" + guid + "\\" + ColorCode;
			if (!Directory.Exists(dir))
				Directory.CreateDirectory(dir);

			Bitmap SolidColor = new Bitmap(530, 630);
			Graphics grapSolidColor = Graphics.FromImage(SolidColor);
			grapSolidColor.Clear(J.Utility.ImageTool.Basic.ColorFromHEX(ColorCode));
			if (Index == 1)
				J.Utility.ImageTool.Basic.Merge(SolidColor, new Bitmap("C:/Users/Jasper/Desktop/图片/女士短袖（正）.png"), 0, 0).Save(dir + "\\" + FileName);
			else
				J.Utility.ImageTool.Basic.Merge(SolidColor, new Bitmap("C:/Users/Jasper/Desktop/图片/女士短袖（反）.png"), 0, 0).Save(dir + "\\" + FileName);
		}
		*/
		#endregion
	}
}
