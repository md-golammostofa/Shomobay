using MMSLHMS.DAL;
using MMSLHMS.DAL.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MMSLHMS.Controllers
{
    [CustomAuthorize]
    public class UserController : BaseController
    {
        // GET: User
        private DataContext db = new DataContext();
        public ActionResult Index()
        {
            ViewBag.CountActiveMember = db.tblMembers.Where(m=>m.OrgId==User.OrgId).Select(m => m.MemberId).Count();

            var todaydist = db.tblLoanDistribution.Where(ld => ld.OrgId == User.OrgId && DbFunctions.TruncateTime(ld.EntryDate.Value) == DbFunctions.TruncateTime(DateTime.Today)).ToList();
            ViewBag.TodayLoanDistribution = todaydist.Sum(l => l.LoanAmount);

            var todaycoll = db.tblMoneyCollection.Where(mc => mc.OrgId == User.OrgId && DbFunctions.TruncateTime(mc.EntryDate.Value) == DbFunctions.TruncateTime(DateTime.Today)).ToList();
            ViewBag.TodayCollection = todaycoll.Sum(c => c.MCAmount);

            var totaldist = db.tblLoanDistribution.Where(ld => ld.OrgId == User.OrgId).ToList();
            ViewBag.TotalDistribution = totaldist.Sum(l => l.LoanAmount);

            var totalcoll = db.tblMoneyCollection.Where(mc => mc.OrgId == User.OrgId).ToList();
            ViewBag.TotalCollection = totalcoll.Sum(m => m.MCAmount);

            var totalsave = db.tblSavings.Where(s => s.OrgId == User.OrgId).ToList();
            ViewBag.TotalSavings = totalsave.Sum(s => s.SavingAmount);

            var totalInvest = db.tblInvestment.Where(i => i.OrgId == User.OrgId).ToList();
            ViewBag.TotalInvestment = totalInvest.Sum(i => i.InvestAmount);

            var totalSavingAdj = db.tblLoanAdjustment.Where(l => l.OrgId == User.OrgId).ToList();
            ViewBag.SavingAdjustment = totalSavingAdj.Sum(s => s.AdjustmentAmount);
            return View();
        }
    }
}