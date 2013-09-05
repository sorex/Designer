using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace J.Utility.ImageTool
{
	public static class Basic
	{
		/// <summary>
		/// 缩放图片(等比)
		/// </summary>
		/// <param name="Source"></param>
		/// <param name="NewWidth"></param>
		/// <param name="NewHeight"></param>
		/// <returns></returns>
		public static Bitmap Zoom(Bitmap Source, int NewWidth, int NewHeight)
		{
			int x = 0, y = 0, width = NewWidth, height = NewHeight;
			if (Source.Width / Source.Height >= NewWidth / NewHeight)
			{
				//新图片宽度过大
				width = (int)(1.0 * Source.Width / Source.Height * NewHeight);
				x = (int)((NewWidth - width) / 2);
			}
			else
			{
				//新图片高度过大
				height = (int)(1.0 * Source.Height / Source.Width * NewWidth);
				y = (int)((NewHeight - height) / 2);
			}

			Bitmap Result = new Bitmap(NewWidth, NewHeight); // 创建新图片
			Graphics grap = Graphics.FromImage(Result); // 绑定画板   
			// 原图片的开始绘制位置,及宽和高 (控制Rectangle的组成参数,便可实现对图片的剪切)
			Rectangle oldRect = new Rectangle(0, 0, Source.Width, Source.Height);
			// 绘制在新画板中的位置,及宽和高 (在这里是完全填充)
			Rectangle newRect = new Rectangle(x, y, width, height);
			// 指定新图片的画面质量
			grap.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBilinear;
			// 把原图片指定位置的图像绘制到新画板中  
			//grap.Clear(Color.Transparent);
			grap.DrawImage(Source, newRect, oldRect, GraphicsUnit.Pixel);
			return Result;
		}

		public static Bitmap Merge(Bitmap BaseMap, Bitmap Map, int x, int y)
		{
			Bitmap Result = new Bitmap(BaseMap.Width, BaseMap.Height);
			Graphics grap = Graphics.FromImage(Result);

			Rectangle BaseMapRect = new Rectangle(0, 0, BaseMap.Width, BaseMap.Height);
			grap.DrawImage(BaseMap, 0, 0);

			//grap.CompositingMode = System.Drawing.Drawing2D.CompositingMode.
			Rectangle MapRect = new Rectangle(0, 0, Map.Width, Map.Height);
			grap.DrawImage(Map, x, y);

			return Result;
		}
	}
}
