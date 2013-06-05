using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Models
{
	public class M_material
	{
		public string GUID { get; set; }
		public string TypeID { get; set; }
		public string Name { get; set; }
		public decimal Price { get; set; }
		public List<M_materialcolor> materialcolors { get; set; }
		public List<M_materialpicture> materialpictures { get; set; }
	}
}
