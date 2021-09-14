using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMSBO.Models
{
   public class LoanDistribution
    {
        [Key]
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
        public string LoanStatus { get; set; }
        public string SkimName { get; set; }

    }
}
