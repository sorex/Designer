using J.BusinessLogics.Models;
using J.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace J.BusinessLogics
{
	public class DesignTShirt
	{
		public static string DB2Json(IQueryable<material> Materials, int? ColorState = null)
		{
			List<M_material> Result = new List<M_material>();
			foreach (var m in Materials)
			{
				M_material tempM = new M_material();
				tempM.GUID = m.GUID;
				tempM.TypeID = m.TypeID;
				tempM.Name = m.Name;
				tempM.Price = m.Price;

				tempM.materialcolors = new List<M_materialcolor>();
				foreach (var c in m.materialcolors)
				{
					if (ColorState == null || c.State == ColorState)
					{
						M_materialcolor tempC = new M_materialcolor();
						tempC.GUID = c.GUID;
						tempC.MaterialID = c.MaterialID;
						tempC.ColorName = c.ColorName;
						tempC.ColorCode = c.ColorCode;
						tempC.IsDefault = c.IsDefault;
						tempM.materialcolors.Add(tempC);
					}
				}

				tempM.materialpictures = new List<M_materialpicture>();
				foreach (var p in m.materialpictures)
				{
					M_materialpicture tempP = new M_materialpicture();
						tempP.GUID = p.GUID;
						tempP.MaterialID = p.MaterialID;
						tempP.Name = p.Name;
						tempP.Index = p.Index;
						tempP.FileName = p.FileName;
						tempP.Width = p.Width;
						tempP.Height = p.Height;
						tempP.Top = p.Top;
						tempP.Left = p.Left;
						tempP.UploadWidth = p.UploadWidth;
						tempP.UploadHeight = p.UploadHeight;
						tempM.materialpictures.Add(tempP);
				}

				Result.Add(tempM);
			}

			return JsonConvert.SerializeObject(Result);
		}
	}
}
