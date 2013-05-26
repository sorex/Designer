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
			Regex r = new Regex(@"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
			Match m = r.Match(data);
			return m.Success;
		}
	}
}
