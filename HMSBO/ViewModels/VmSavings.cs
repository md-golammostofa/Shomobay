using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMSBO.ViewModels
{
   public class VmSavings
    {
        public long SavingId { get; set; }
        public string MemberCode { get; set; }
        public string MemberName { get; set; }
        public string MemberAddress { get; set; }
        public string MemberMobile { get; set; }
        public double SavingAmount { get; set; }
        public Nullable<DateTime> SavingDate { get; set; }
        public string Remarks { get; set; }
        public int? OrgId { get; set; }
        public string EntryUser { get; set; }
        public Nullable<DateTime> EntryDate { get; set; }
        public string UpdateUser { get; set; }
        public Nullable<DateTime> UpdateDate { get; set; }
        public double? TotalSavings { get; set; }
        public double? TotalAdjust { get; set; }
        public double? CurrentSavings { get; set; }
    }
}
