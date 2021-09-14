using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMSBO.ViewModels
{
   public class VmMoneyCollection
    {
        public long MCId { get; set; }
        public string MCName { get; set; }
        public string MCMobile { get; set; }
        public string MemberCode { get; set; }
        public string MemberName { get; set; }
        public string MemberAddress { get; set; }
        public string MemberMobile { get; set; }
        public double MCAmount { get; set; }
        public string LDisCode { get; set; }
        public Nullable<DateTime> MCDate { get; set; }
        public string Remarks { get; set; }
        public int? OrgId { get; set; }
        public string EntryUser { get; set; }
        public Nullable<DateTime> EntryDate { get; set; }
        public string UpdateUser { get; set; }
        public Nullable<DateTime> UpdateDate { get; set; }
        //
        public double SavingsAmount { get; set; }
        //
        public double PrincipalAmount { get; set; }
        public double ProfitAmount { get; set; }

    }
}
