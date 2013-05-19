using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace J.BusinessLogics.Basic
{
	public class CheckData
	{
		public static bool IsEmail(string data)
		{
			Regex regex = new Regex("^[//w-]+(//.[//w-]+)*@[//w-]+(//.[//w-]+)+$");
			return regex.IsMatch(data.Trim());
		}
	}
}
