using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMSBO.ViewModels
{
   public class VmLoanSkim
    {
        public long SkimId { get; set; }
        public string SkimName { get; set; }
        public double Interest { get; set; }
        public int TimeLimit { get; set; }
        public string Remarks { get; set; }
        public int? OrgId { get; set; }
        public string EntryUser { get; set; }
        public Nullable<DateTime> EntryDate { get; set; }
        public string UpdateUser { get; set; }
        public Nullable<DateTime> UpdateDate { get; set; }
    }
}
