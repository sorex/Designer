using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Basic
{
	public class SystemConfig
	{
		/// <summary>
		/// 用户最大地址存储数量
		/// </summary>
		public const int MaxAddresses = 6;

		/// <summary>
		/// 每页数据量
		/// </summary>
		public const int PageSize = 25;

		/// <summary>
		/// 包邮数量，2件起包邮
		/// </summary>
		public const int FreePostageNumber = 2;

		/// <summary>
		/// 基础运费，不够包邮时加的运费
		/// </summary>
		public const decimal BaseFreight = 8.0m;
	}
}
