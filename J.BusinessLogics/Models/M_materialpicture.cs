using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Models
{
	public class M_materialpicture
	{
		public string GUID { get; set; }
		public string MaterialID { get; set; }
		public string Name { get; set; }
		public int Index { get; set; }
		public string FileName { get; set; }
		public int Width { get; set; }
		public int Height { get; set; }
		public int Top { get; set; }
		public int Left { get; set; }
		public int UploadWidth { get; set; }
		public int UploadHeight { get; set; }
	}
}
