using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Basic
{
	public class SecurityCode
	{
		private const int CodeLenght = 4;
		private const int ImageWidth = CodeLenght * 15;
		private const int ImageHeight = 24;

		public string Code { get; private set; }
		public MemoryStream Image { get; private set; }

		public SecurityCode()
		{
			this.Code = CreateCode();
			this.Image = CreateImage(this.Code);
			this.Code = this.Code.ToLower();
		}

		private string CreateCode()
		{
			string Result = String.Empty;
			int number;
			Random random = new Random();

			for (int index = 0; index < CodeLenght; index++)
			{
				number = random.Next();

				if (number % 2 == 0)
				{
					Result += (char)('0' + (char)(number % 10));     //生成数字
				}
				else
				{
					Result += (char)('A' + (char)(number % 26));     //生成字母
				}
			}
			return Result;
		}

		private MemoryStream CreateImage(String code)
		{
			if (string.IsNullOrEmpty(code))
			{
				return null;
			}

			Bitmap image = new Bitmap(ImageWidth, ImageHeight);

			Graphics graphic = Graphics.FromImage(image);

			try
			{
				Random random = new Random();

				graphic.Clear(Color.White);

				int x1 = 0, y1 = 0, x2 = 0, y2 = 0;

				for (int index = 0; index < 25; index++)
				{
					x1 = random.Next(image.Width);
					x2 = random.Next(image.Width);
					y1 = random.Next(image.Height);
					y2 = random.Next(image.Height);

					graphic.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
				}

				Font font = new Font("Arial", 14, (FontStyle.Bold | FontStyle.Italic));
				LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Red, Color.DarkRed, 1.2f, true);
				graphic.DrawString(code, font, brush, 2, 2);

				int x = 0;
				int y = 0;

				//画图片的前景噪音点
				for (int i = 0; i < 100; i++)
				{
					x = random.Next(image.Width);
					y = random.Next(image.Height);

					image.SetPixel(x, y, Color.FromArgb(random.Next()));
				}

				//画图片的边框线
				graphic.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

				//将图片验证码保存为流Stream返回
				System.IO.MemoryStream Result = new System.IO.MemoryStream();
				image.Save(Result, System.Drawing.Imaging.ImageFormat.Png);
				return Result;
			}
			finally
			{
				graphic.Dispose();
				image.Dispose();
			}
		}
	}
}
