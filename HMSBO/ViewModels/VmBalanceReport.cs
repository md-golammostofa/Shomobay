using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMSBO.ViewModels
{
   public class VmBalanceReport
    {
        public double? TotalInvest { get; set; }
        public double? TotalDistribution { get; set; }
        public double? TotalCollection { get; set; }
        public double? TotalWithdraw { get; set; }
        public double? Balance { get; set; }
    }
}
