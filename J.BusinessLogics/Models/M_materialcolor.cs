using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Models
{
	public class M_materialcolor
	{
		public string GUID { get; set; }
		public string MaterialID { get; set; }
		public string ColorName { get; set; }
		public string ColorCode { get; set; }
		public bool IsDefault { get; set; }
	}
}
