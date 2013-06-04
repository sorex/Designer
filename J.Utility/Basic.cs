using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace J.Utility
{
	public static class Basic
	{
		public static string NewGuid()
		{
			return Guid.NewGuid().ToString("N");
		}
	}
}
