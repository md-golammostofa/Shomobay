using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace HMSBO.ViewModels
{
   public class VmMember
    {
        public long MemberId { get; set; }
        public string MemberCode { get; set; }
        public string MemberName { get; set; }
        public string MemberAddress { get; set; }
        public string MemberMobile { get; set; }
        public string Remarks { get; set; }
        public int? OrgId { get; set; }
        public string EntryUser { get; set; }
        public Nullable<DateTime> EntryDate { get; set; }
        public string UpdateUser { get; set; }
        public Nullable<DateTime> UpdateDate { get; set; }
        public string NIDNumber { get; set; }
        public string MemberStatus { get; set; }
        public string MemberImage { get; set; }
        public HttpPostedFileBase MemImage { get; set; }
    }
}
