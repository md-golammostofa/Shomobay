using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMSBO.ViewModels
{
   public class VmLoanDistribution
    {
        public long LDisId { get; set; }
        public string MemberCode { get; set; }
        public string MemberName { get; set; }
        public string MemberAddress { get; set; }
        public string MemberMobile { get; set; }
        public double LoanAmount { get; set; }
        public int TimeLimit { get; set; }
        public string RefName { get; set; }
        public string RefMobile { get; set; }
        public string Remarks { get; set; }
        public int? OrgId { get; set; }
        public string EntryUser { get; set; }
        public Nullable<DateTime> EntryDate { get; set; }
        public string UpdateUser { get; set; }
        public Nullable<DateTime> UpdateDate { get; set; }
        public double LoanInterest { get; set; }
        public string LDisCode { get; set; }
        public double NetPayable { get; set; }
        public double DailyPayable { get; set; }
        public double? TotalCollection { get; set; }
        public double? DueLoanCollection { get; set; }
        public double TotalPayDays { get; set; }
        public double TotalDueDays { get; set; }
        public string LoanStatus { get; set; }
        public double AdjustmentAmount { get; set; }
        public double NetDueAmount { get; set; }
        public string SkimName { get; set; }
        //
        public double TotalProfitAmount { get; set; }
        public double TotalPrincipalAmount { get; set; }
    }
}
