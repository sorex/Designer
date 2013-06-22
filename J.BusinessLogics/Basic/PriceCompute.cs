using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Basic
{
	public class PriceCompute
	{
		/// <summary>
		/// 由最低成本和销售量计算实际成本
		/// </summary>
		/// <param name="LowBasePrice"></param>
		/// <param name="salesGoal"></param>
		/// <returns></returns>
		public static decimal ComputeBasePrice(decimal LowBasePrice, int salesGoal)
		{
			decimal Result = LowBasePrice;
			if (salesGoal <= 20)
			{
				//10件原价，20件减2元
				Result = Result - (salesGoal / 10 - 1) * 2;
			}
			else if (salesGoal <= 50)
			{
				//20件以上，每多10件再减1元
				Result = Result - 2 - (salesGoal / 10 - 2) * 1;
			}
			else if (salesGoal <= 100)
			{
				//50件以上，每多10件再减0.5元
				Result = Result - 5 - (salesGoal / 10 - 5) * 0.5m;
			}
			else if (salesGoal <= 200)
			{
				//100件以上，每多10件再减0.2元
				Result = Result - 7.5m - (salesGoal / 10 - 10) * 0.2m;
			}
			else if (salesGoal > 200)
			{
				//200件以上直接减10元
				Result = Result - 10;
			}
			return Result;
		}

		/// <summary>
		/// 计算预期最终受益，必须大于0
		/// </summary>
		/// <param name="basePrice"></param>
		/// <param name="salesGoal"></param>
		/// <param name="SellingPrice"></param>
		/// <returns></returns>
		public static decimal ComputeAnticipatedIncome(decimal basePrice, int salesGoal, decimal SellingPrice)
		{
			decimal AnticipatedIncome = (SellingPrice - Math.Round(SellingPrice * 0.012m, 2)) * salesGoal - basePrice * salesGoal;
			decimal tax = Math.Round(AnticipatedIncome * 0.005m, 2);
			if (tax < 1)
				tax = 1;
			else if (tax > 25)
				tax = 25;
			return AnticipatedIncome - tax;
		}
	}
}
