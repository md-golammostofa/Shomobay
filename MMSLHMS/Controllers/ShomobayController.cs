using HMSBO.Models;
using HMSBO.ViewModels;
using Microsoft.Reporting.WebForms;
using MMSLHMS.CustomFiles.Filters;
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
    public class ShomobayController : BaseController
    {
        private DataContext db = new DataContext();
        // GET: Shomobay
        #region Members
        [HttpGet]
        public ActionResult MemberList(string flag,string mCode,string mName,string mMobile)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var member = db.tblMembers.Where(m=>m.OrgId==User.OrgId && (mCode == null || mCode.Trim() == "" || m.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || m.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || m.MemberMobile.ToLower().Contains(mMobile.Trim()))).ToList();
                List<VmMember> memberslist = new List<VmMember>();
                foreach (var item in member)
                {
                    VmMember vm = new VmMember()
                    {
                        MemberId = item.MemberId,
                        MemberName = item.MemberName,
                        MemberCode = item.MemberCode,
                        MemberAddress = item.MemberAddress,
                        MemberMobile = item.MemberMobile,
                        NIDNumber=item.NIDNumber,
                        MemberStatus=item.MemberStatus,
                        Remarks = item.Remarks,
                        EntryUser = item.EntryUser,
                        EntryDate = item.EntryDate,
                    };
                    memberslist.Add(vm);
                }
                return PartialView("_MemberList", memberslist);
            }
        }
        [HttpPost]
        [ValidateJsonAntiForgeryToken]
        public ActionResult SaveMember(VmMember member)
        {
            bool IsSuccess = false;
            int mcode = 1;
            int membercode = 0;
            var codeM = db.tblMembers.Where(l => l.OrgId == User.OrgId).OrderByDescending(o => o.MemberId).FirstOrDefault();
            
            if (codeM != null)
            {
                int mmmmmm = Convert.ToInt16(codeM.MemberCode);
                membercode = mmmmmm + 1;
            }
            else
            {
                membercode = mcode;
            }
            if (ModelState.IsValid)
            {
                if (member.MemberId == 0)
                {
                    Member mb = new Member();
                    mb.MemberCode = membercode.ToString().PadLeft(4, '0');
                    mb.MemberName = member.MemberName;
                    mb.MemberAddress = member.MemberAddress;
                    mb.MemberMobile = member.MemberMobile;
                    mb.NIDNumber = member.NIDNumber;
                    mb.Remarks = member.Remarks;
                    mb.MemberStatus = "Active";
                    mb.OrgId = User.OrgId;
                    mb.EntryDate = DateTime.Now;
                    mb.EntryUser = User.UserName;
                    if (member.MemImage != null)
                    {
                        mb.MemberImage = Utility.SaveImage(member.MemImage.InputStream, member.MemImage.FileName, Utility.MemberImage, User.OrgId);
                    }
                    db.tblMembers.Add(mb);
                    IsSuccess = true;
                }
                else
                {
                    var memberUpdate = db.tblMembers.Where(m => m.MemberId == member.MemberId).FirstOrDefault();
                    if (memberUpdate != null)
                    {
                        memberUpdate.MemberName = member.MemberName;
                        memberUpdate.MemberMobile = member.MemberMobile;
                        memberUpdate.MemberAddress = member.MemberAddress;
                        memberUpdate.NIDNumber = member.NIDNumber;
                        memberUpdate.UpdateUser = User.UserName;
                        memberUpdate.MemberStatus = member.MemberStatus;
                        memberUpdate.Remarks = member.Remarks;
                        memberUpdate.UpdateDate = DateTime.Now;
                    }
                }
                db.SaveChanges();
            }
            return Json(IsSuccess);
        }

        #region - Base64 Image String
        [HttpPost, ValidateJsonAntiForgeryToken]
        public ActionResult GetImageBase64String(long memId)
        {
            string memImg = string.Empty;
            try
            {
                if (memId > 0)
                {
                    var allmember = db.tblMembers.Where(o => o.MemberId == memId).ToList();
                    var member = allmember.FirstOrDefault();
                    if (member != null)
                    {
                        if (!string.IsNullOrEmpty(member.MemberImage))
                        {
                            memImg = Utility.GetImage(string.Format(@"{0}", member.MemberImage));
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return Json(new { memberImg = memImg});
        }
        #endregion

        public ActionResult UpdateMemberStatus(long memberId,string status)
        {
            bool IsSuccess = false;
            var member = db.tblMembers.Where(m => m.OrgId == User.OrgId && m.MemberId == memberId).FirstOrDefault();
            if(memberId != 0)
            {
                member.MemberStatus = status;
                member.UpdateDate = DateTime.Now;
                member.UpdateUser = User.UserName;
                IsSuccess = true;
            }
            db.SaveChanges();
            return Json(IsSuccess);
        }
        #endregion

        #region Investment
        public ActionResult InvestmentList(string flag)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var investment = db.tblInvestment.ToList();
                List<VmInvestment> investments = new List<VmInvestment>();
                foreach(var item in investment)
                {
                    VmInvestment vm = new VmInvestment()
                    {
                        InvestmentId = item.InvestmentId,
                        InvestAmount = item.InvestAmount,
                        InvestDate = item.InvestDate,
                        Remarks = item.Remarks,
                        EntryUser = item.EntryUser,
                    };
                    investments.Add(vm);
                }
                return PartialView("_InvestmentList", investments);
            }
        }

        public ActionResult SaveInvestment(VmInvestment investment)
        {
            bool IsSuccess = false;
            if (ModelState.IsValid)
            {
                if (investment.InvestmentId == 0)
                {
                    Investment invest = new Investment()
                    {
                        InvestAmount = investment.InvestAmount,
                        InvestDate = DateTime.Now,
                        Remarks = investment.Remarks,
                        OrgId = User.OrgId,
                        EntryDate = DateTime.Now,
                        EntryUser = User.UserName,
                    };
                    db.tblInvestment.Add(invest);
                    IsSuccess = true;
                }
                else
                {
                    var inv = db.tblInvestment.FirstOrDefault();
                    if (inv != null)
                    {
                        inv.InvestAmount = investment.InvestAmount;
                        inv.Remarks = investment.Remarks;
                        inv.UpdateDate = DateTime.Now;
                        inv.UpdateUser = User.UserName;
                    }
                }
                db.SaveChanges();
            }
            return Json(IsSuccess);
        }
        #endregion

        #region Skim
        [HttpGet]
        public ActionResult LoanSkimList(string flag)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var skim = db.tblLoanSkim.Where(m => m.OrgId == User.OrgId).ToList();
                List<VmLoanSkim> skimList = new List<VmLoanSkim>();
                foreach (var item in skim)
                {
                    VmLoanSkim vm = new VmLoanSkim()
                    {
                        SkimId = item.SkimId,
                        SkimName = item.SkimName,
                        Interest = item.Interest,
                        TimeLimit = item.TimeLimit,
                        Remarks = item.Remarks,
                        EntryUser = item.EntryUser,
                        EntryDate = item.EntryDate,
                    };
                    skimList.Add(vm);
                }
                return PartialView("_LoanSkimList", skimList);
            }
        }

        public ActionResult SaveLoanSkim(VmLoanSkim model)
        {
            bool IsSuccess = false;
            if (ModelState.IsValid)
            {
                if (model.SkimId == 0)
                {
                    LoanSkim loanSkim=new LoanSkim
                    {
                        SkimName = model.SkimName,
                        Interest = model.Interest,
                        TimeLimit = model.TimeLimit,
                        Remarks = model.Remarks,
                        OrgId = User.OrgId,
                        EntryDate = DateTime.Now,
                        EntryUser = User.UserName,
                    };
                    db.tblLoanSkim.Add(loanSkim);
                    IsSuccess = true;
                }
                else
                {
                    var skimupdate = db.tblLoanSkim.Where(m => m.SkimId == model.SkimId).FirstOrDefault();
                    if (skimupdate != null)
                    {
                        skimupdate.SkimName = model.SkimName;
                        skimupdate.Interest = model.Interest;
                        skimupdate.TimeLimit = model.TimeLimit;
                        skimupdate.UpdateUser = User.UserName;
                        skimupdate.Remarks = model.Remarks;
                        skimupdate.UpdateDate = DateTime.Now;
                    }
                }
                db.SaveChanges();
            }
            return Json(IsSuccess);
        }
        #endregion

        #region LoanDistribution
        public ActionResult LoanDistributionList(string flag,string mCode,string lCode,string mName,string mMobile)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var loanlist = db.tblLoanDistribution.Where(l=>l.OrgId==User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName==null || mName.Trim()=="" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile==null || mMobile.Trim()=="" || l.MemberMobile.ToLower().Contains(mMobile.Trim()))).ToList();
                List<VmLoanDistribution> list = new List<VmLoanDistribution>();
                foreach(var item in loanlist)
                {
                    VmLoanDistribution vmLoan = new VmLoanDistribution()
                    {
                        LDisId=item.LDisId,
                        MemberCode=item.MemberCode,
                        MemberName=item.MemberName,
                        MemberAddress=item.MemberAddress,
                        MemberMobile=item.MemberMobile,
                        LoanAmount=item.LoanAmount,
                        LoanInterest=item.LoanInterest,
                        TimeLimit=item.TimeLimit,
                        RefName=item.RefName,
                        RefMobile=item.RefMobile,
                        LDisCode=item.LDisCode,
                        LoanStatus=item.LoanStatus,
                        DailyPayable=item.DailyPayable,
                        NetPayable=item.NetPayable,
                        Remarks=item.Remarks,
                        EntryDate=item.EntryDate,
                        EntryUser=item.EntryUser,
                        SkimName=item.SkimName,
                    };
                    list.Add(vmLoan);
                }
                return PartialView("_LoanDistributionList", list);
            }
        }
        public ActionResult CreateLoanDistribution()
        {
            ViewBag.ddlLoanSkim = db.tblLoanSkim.Where(k => k.OrgId == User.OrgId).Select(m => new SelectListItem { Text = m.SkimName+"("+m.TimeLimit+"-Days-"+m.Interest+"%)", Value = m.SkimName }).ToList();

            ViewBag.ddlMemberCode = db.tblMembers.Where(m=>m.OrgId==User.OrgId && m.MemberStatus=="Active").Select(m=>new SelectListItem { Text=m.MemberCode+ "-" +m.MemberName,Value=m.MemberCode}).ToList();
            return View();
        }

        
        public ActionResult GetMemberByCode(string code)
        {
            var member = db.tblMembers.Where(m=>m.MemberCode==code).FirstOrDefault();
            VmMember vmMember = new VmMember();
            if(member != null)
            { 
                vmMember.MemberName = member.MemberName;
                vmMember.MemberAddress = member.MemberAddress;
                vmMember.MemberMobile = member.MemberMobile;
            }
            return Json(vmMember);
        }
        public ActionResult SaveLoanDistribution(VmLoanDistribution model)
        {

            bool IsSuccess = false;
            int lcode = 1;
            int loancode = 0;
            var loanc = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId).OrderByDescending(o=>o.LDisId).FirstOrDefault();
            if (loanc != null)
            {
                int lllll = Convert.ToInt16(loanc.LDisCode);
                loancode = lllll+1;
            }
            else
            {
                loancode = lcode;
            }
            if (ModelState.IsValid)
            {
                if (model.LDisId == 0)
                {

                    var skim = db.tblLoanSkim.Where(s => s.SkimName == model.SkimName).FirstOrDefault();
                    double netAmount = (((model.LoanAmount * skim.Interest) / 100) + model.LoanAmount);
                    //var loanCode= ("LC" + DateTime.Now.ToString("yy") + DateTime.Now.ToString("MM") + DateTime.Now.ToString("dd") + DateTime.Now.ToString("hh") + DateTime.Now.ToString("mm") + DateTime.Now.ToString("ss"));
                    var dailypay = (netAmount / skim.TimeLimit);
                    LoanDistribution loan = new LoanDistribution()
                    {
                        MemberCode = model.MemberCode,
                        MemberName = model.MemberName,
                        MemberAddress = model.MemberAddress,
                        MemberMobile = model.MemberMobile,
                        SkimName=skim.SkimName,
                        LoanAmount = model.LoanAmount,
                        TimeLimit = skim.TimeLimit,
                        LDisCode = loancode.ToString().PadLeft(6, '0'),
                        NetPayable = netAmount,
                        LoanStatus = "Running",
                        RefName = model.RefName,
                        RefMobile = model.RefMobile,
                        DailyPayable = dailypay,
                        Remarks = model.Remarks,
                        EntryDate = DateTime.Now,
                        OrgId = User.OrgId,
                        EntryUser = User.UserName,
                        LoanInterest=skim.Interest
                    };
                    db.tblLoanDistribution.Add(loan);
                    db.SaveChanges();
                    IsSuccess = true;
                }
            }
            return Json(IsSuccess);
        }
        public ActionResult UpdateLoanStatus(long loanId, string loanstatus)
        {
            bool IsSuccess = false;
            var loan = db.tblLoanDistribution.Where(l => l.LDisId == loanId).FirstOrDefault();
            if(loanId != 0)
            {
                loan.LoanStatus = loanstatus;
                loan.UpdateDate = DateTime.Now;
                loan.UpdateUser = User.UserName;
                IsSuccess = true;
            }
            db.SaveChanges();
            return Json(IsSuccess);

        }
        public ActionResult GetLoanDetails(string lcode)
        {
            var collection = db.tblMoneyCollection.Where(c => c.LDisCode == lcode).ToList();
            double amount = collection.Select(a => a.MCAmount).Sum();
            var loan = db.tblLoanDistribution.Where(l => l.LDisCode == lcode).FirstOrDefault();
            var adjment = db.tblLoanAdjustment.Where(adj => adj.LDisCode == lcode).ToList();
            double loandue = (loan.NetPayable - amount);
            double duedays = loandue / loan.DailyPayable;
            double payDays = loan.TimeLimit - duedays;
            double adjAmount = adjment.Select(ad => ad.AdjustmentAmount).Sum();
            VmLoanDistribution vmLoan = new VmLoanDistribution();
            if (loan != null)
            {
                vmLoan.LDisCode = lcode;
                vmLoan.MemberCode = loan.MemberCode;
                vmLoan.MemberName = loan.MemberName;
                vmLoan.MemberAddress = loan.MemberAddress;
                vmLoan.MemberMobile = loan.MemberMobile;
                vmLoan.LoanAmount = loan.LoanAmount;
                vmLoan.NetPayable = loan.NetPayable;
                vmLoan.DailyPayable = loan.DailyPayable;
                vmLoan.TotalCollection = amount;
                vmLoan.DueLoanCollection = loandue;
                vmLoan.TotalDueDays = duedays;
                vmLoan.TotalPayDays = payDays;
                vmLoan.TimeLimit = loan.TimeLimit;
                vmLoan.LoanStatus = loan.LoanStatus;
                vmLoan.EntryDate = loan.EntryDate;
                vmLoan.AdjustmentAmount = adjAmount;
                vmLoan.NetDueAmount = (loandue - adjAmount);
            }
            return PartialView("_GetLoanDetails", vmLoan);
        }
        #endregion

        #region MoneyCollection
        public ActionResult MoneyCollectionList(string flag, string mCode, string lCode, string mName, string mMobile)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
                
            }
            else
            {
                var money = db.tblMoneyCollection.Where(l => l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim()))).ToList();
                List<VmMoneyCollection> list = new List<VmMoneyCollection>();
                foreach(var item in money)
                {
                    var loan = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId).ToList();
                    var loanamount = loan.Where(l => l.LDisCode == item.LDisCode).FirstOrDefault();
                    var profit = (loanamount.LoanAmount / loanamount.TimeLimit);
                    VmMoneyCollection vmMoney = new VmMoneyCollection
                    {
                        MCId = item.MCId,
                        MCName = item.MCName,
                        MCMobile = item.MCMobile,
                        MCDate = item.MCDate,
                        MemberCode = item.MemberCode,
                        MemberName = item.MemberName,
                        MemberMobile = item.MemberMobile,
                        MemberAddress = item.MemberAddress,
                        MCAmount = item.MCAmount,
                        LDisCode = item.LDisCode,
                        Remarks = item.Remarks,
                        EntryDate = item.EntryDate,
                        EntryUser = item.EntryUser,
                        ProfitAmount = (item.MCAmount - profit),
                        PrincipalAmount = profit,
                    };
                    list.Add(vmMoney);
                }
                return PartialView("_MoneyCollectionList", list);
            }
        }
        public ActionResult CreateMoneyCollection()
        {
            ViewBag.ddlMemberCode = db.tblMembers.Select(m => new SelectListItem { Text = m.MemberCode + "-" + m.MemberName, Value = m.MemberCode }).ToList();
            return View();
        }
        public ActionResult CrateMoneyCollection2(string flag, string mCode, string lCode, string mName, string mMobile)
        {
            if (string.IsNullOrEmpty(flag))
            {
                ViewBag.ddlMemberCode = db.tblMembers.Where(m=>m.OrgId==User.OrgId && m.MemberStatus=="Active").Select(m => new SelectListItem { Text = m.MemberCode + "-" + m.MemberName, Value = m.MemberCode }).ToList();
                return View();
            }
            else
            {
                var loanlist = db.tblLoanDistribution.Where(l =>l.LoanStatus=="Running" && l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim()))).ToList();
                List<VmLoanDistribution> list = new List<VmLoanDistribution>();
                foreach (var item in loanlist)
                {
                    VmLoanDistribution vmLoan = new VmLoanDistribution()
                    {
                        LDisId = item.LDisId,
                        MemberCode = item.MemberCode,
                        MemberName = item.MemberName,
                        MemberAddress = item.MemberAddress,
                        MemberMobile = item.MemberMobile,
                        LoanAmount = item.LoanAmount,
                        LoanInterest = item.LoanInterest,
                        TimeLimit = item.TimeLimit,
                        RefName = item.RefName,
                        RefMobile = item.RefMobile,
                        LDisCode = item.LDisCode,
                        LoanStatus = item.LoanStatus,
                        DailyPayable = item.DailyPayable,
                        NetPayable = item.NetPayable,
                        Remarks = item.Remarks,
                        EntryDate = item.EntryDate,
                        EntryUser = item.EntryUser,
                        SkimName = item.SkimName,
                    };
                    list.Add(vmLoan);
                }
                return PartialView("_CrateMoneyCollection2", list);
            }
        }
        [HttpPost]
        public ActionResult GetLoanCode(string mCode)
        {
            var dropDown = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId && l.MemberCode==mCode && l.LoanStatus == "Running").Select(m => new DropDown { text = m.LDisCode.ToString(), value = m.LDisCode.ToString() }).ToList();
            return Json(dropDown);
        }
        public ActionResult GetLoanInformation(string lcode)
        {
            var collection = db.tblMoneyCollection.Where(c =>c.LDisCode == lcode).ToList();
            double amount = collection.Select(a => a.MCAmount).Sum();
            var loan = db.tblLoanDistribution.Where(l => l.LDisCode == lcode).FirstOrDefault();
            double loandue = (loan.NetPayable - amount);
            double duedays = loandue / loan.DailyPayable;
            double payDays = loan.TimeLimit - duedays;
            VmLoanDistribution vmLoan = new VmLoanDistribution();
            if(loan != null)
            {
                vmLoan.MemberCode = loan.MemberCode;
                vmLoan.MemberName = loan.MemberName;
                vmLoan.MemberAddress = loan.MemberAddress;
                vmLoan.MemberMobile = loan.MemberMobile;
                vmLoan.LoanAmount = loan.LoanAmount;
                vmLoan.NetPayable = loan.NetPayable;
                vmLoan.DailyPayable = loan.DailyPayable;
                vmLoan.TotalCollection = amount;
                vmLoan.DueLoanCollection = loandue;
                vmLoan.TotalDueDays = duedays;
                vmLoan.TotalPayDays = payDays;
            }
            return Json(vmLoan);
        }
        public ActionResult SaveDailyCollectionAmount(VmMoneyCollection model)
        {
            var memberCode = db.tblLoanDistribution.Where(d => d.LDisCode == model.LDisCode).FirstOrDefault().MemberCode;
            
            bool IsSuccess = false;
            if (ModelState.IsValid)
            {
                if (model.MCId == 0)
                {
                    MoneyCollection money = new MoneyCollection
                    {
                        MCName=model.MCName,
                        MCMobile=model.MCMobile,
                        MemberCode= memberCode,
                        MemberName=model.MemberName,
                        MemberAddress=model.MemberAddress,
                        MemberMobile=model.MemberMobile,
                        LDisCode=model.LDisCode,
                        MCAmount=model.MCAmount,
                        MCDate=model.MCDate,
                        Remarks=model.Remarks,
                        OrgId=User.OrgId,
                        EntryUser=User.UserName,
                        EntryDate=DateTime.Now,
                    };
                    db.tblMoneyCollection.Add(money);
                    db.SaveChanges();
                    IsSuccess = true;
                }
            }
            return Json(IsSuccess);
        }
        public ActionResult SaveMoneyCollectionDaily(List<VmMoneyCollection> model,double savings,string mCode)
        {
            bool IsSuccess = false;
            var allmember = db.tblMembers.Where(m => m.OrgId==User.OrgId).ToList();
            var member = allmember.Where(m => m.MemberCode == mCode).FirstOrDefault();
            if (model !=null)
            {
                List<MoneyCollection> collectionlist = new List<MoneyCollection>();
                foreach(var item in model)
                {
                    if (item.MCAmount > 0)
                    {
                        if (ModelState.IsValid)
                        {
                            MoneyCollection money = new MoneyCollection
                            {
                                MemberCode = member.MemberCode,
                                MemberName = member.MemberName,
                                MemberAddress = member.MemberAddress,
                                MemberMobile = member.MemberMobile,
                                LDisCode = item.LDisCode,
                                MCAmount = item.MCAmount,
                                MCDate = DateTime.Now,
                                Remarks = "",
                                OrgId = User.OrgId,
                                EntryUser = User.UserName,
                                EntryDate = DateTime.Now,
                            };
                            collectionlist.Add(money);
                        }
                    }
                }
                db.tblMoneyCollection.AddRange(collectionlist);
                db.SaveChanges();
                IsSuccess = true;
                if (savings != 0)
                {
                    Savings save = new Savings
                    {
                        MemberCode = member.MemberCode,
                        MemberName = member.MemberName,
                        MemberAddress = member.MemberAddress,
                        MemberMobile = member.MemberMobile,
                        SavingAmount = savings,
                        SavingDate = DateTime.Now,
                        Remarks = "",
                        OrgId = User.OrgId,
                        EntryDate = DateTime.Now,
                        EntryUser = User.UserName,
                    };
                    db.tblSavings.Add(save);
                    db.SaveChanges();
                    IsSuccess = true;
                }
            }
            else
            {
                if (savings != 0)
                {
                    Savings save = new Savings
                    {
                        MemberCode = member.MemberCode,
                        MemberName = member.MemberName,
                        MemberAddress = member.MemberAddress,
                        MemberMobile = member.MemberMobile,
                        SavingAmount = savings,
                        SavingDate = DateTime.Now,
                        Remarks = "",
                        OrgId = User.OrgId,
                        EntryDate = DateTime.Now,
                        EntryUser = User.UserName,
                    };
                    db.tblSavings.Add(save);
                    db.SaveChanges();
                    IsSuccess = true;
                }
            }
            return Json(IsSuccess);
        }
        #endregion

        #region Savings
        public ActionResult SavingsList(string flag, string mCode, string mName, string mMobile)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var savings = db.tblSavings.Where(m => m.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || m.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || m.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || m.MemberMobile.ToLower().Contains(mMobile.Trim()))).ToList();
                List<VmSavings> saveList = new List<VmSavings>();
                foreach(var item in savings)
                {
                    VmSavings vmSavings = new VmSavings
                    {
                        SavingId=item.SavingId,
                        MemberCode=item.MemberCode,
                        MemberName=item.MemberName,
                        MemberAddress=item.MemberAddress,
                        MemberMobile=item.MemberMobile,
                        SavingAmount=item.SavingAmount,
                        SavingDate=item.SavingDate,
                        Remarks=item.Remarks,
                        OrgId=item.OrgId,
                        EntryDate=item.EntryDate,
                        EntryUser=item.EntryUser,
                    };
                    saveList.Add(vmSavings);
                }
                return PartialView("_SavingsList", saveList);
            }
        }
        public ActionResult CreateSavings()
        {
            ViewBag.ddlMemberCode = db.tblMembers.Where(m=>m.OrgId==User.OrgId && m.MemberStatus=="Active").Select(m => new SelectListItem { Text = m.MemberCode + "-" + m.MemberName, Value = m.MemberCode }).ToList();
            return View();
        }

        public ActionResult GetSavingsInformation(string mcode)
        {
            var member = db.tblMembers.Where(m => m.OrgId == User.OrgId && m.MemberCode == mcode).FirstOrDefault();
            var savings = db.tblSavings.Where(s => s.OrgId == User.OrgId && s.MemberCode == mcode).ToList();
            double totalSave = savings.Select(s => s.SavingAmount).Sum();
            VmSavings vmSavings = new VmSavings();
            if(member != null)
            {
                vmSavings.MemberName = member.MemberName;
                vmSavings.MemberAddress = member.MemberAddress;
                vmSavings.MemberMobile = member.MemberMobile;
                vmSavings.TotalSavings = totalSave;
            }
            return Json(vmSavings);
        }

        public ActionResult SaveSavingsAmount(VmSavings model)
        {
            bool IsSuccess = false;
            if (ModelState.IsValid)
            {
                if (model.SavingId == 0)
                {
                    Savings save = new Savings
                    {
                        MemberCode=model.MemberCode,
                        MemberName=model.MemberName,
                        MemberAddress=model.MemberAddress,
                        MemberMobile=model.MemberMobile,
                        SavingAmount=model.SavingAmount,
                        SavingDate=model.SavingDate,
                        Remarks=model.Remarks,
                        OrgId=User.OrgId,
                        EntryDate=DateTime.Now,
                        EntryUser=User.UserName,
                    };
                    db.tblSavings.Add(save);
                    db.SaveChanges();
                    IsSuccess = true;
                }
            }
            return Json(IsSuccess);
        }
        #endregion

        #region LoanAdjustmentFromSavings
        public ActionResult LoanAdjustmentList(string flag, string mCode, string lCode, string mName, string mMobile)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var loanadjust = db.tblLoanAdjustment.Where(l => l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim()))).ToList();
                List<VmLoanAdjustment> loanAdjList = new List<VmLoanAdjustment>();
                foreach(var item in loanadjust)
                {
                    VmLoanAdjustment loanAdjustment = new VmLoanAdjustment
                    {
                        LAdjId=item.LAdjId,
                        MemberCode=item.MemberCode,
                        MemberName=item.MemberName,
                        MemberAddress=item.MemberAddress,
                        MemberMobile=item.MemberMobile,
                        LDisCode=item.LDisCode,
                        AdjustmentAmount=item.AdjustmentAmount,
                        AdjustmentDate=item.AdjustmentDate,
                        Remarks=item.Remarks,
                        EntryDate=item.EntryDate,
                        OrgId=item.OrgId,
                        EntryUser=item.EntryUser,
                    };
                    loanAdjList.Add(loanAdjustment);
                }
                return PartialView("_LoanAdjustmentList", loanAdjList);
            }
        }
        public ActionResult CreateLoanAdjustment()
        {
            ViewBag.ddlLoanCode = db.tblLoanDistribution.Where(l=>l.OrgId==User.OrgId && l.LoanStatus=="Running").Select(m => new SelectListItem { Text = m.LDisCode + "-" + m.MemberName, Value = m.LDisCode }).ToList();
            return View();
        }
        public ActionResult GetMemberInformation(string lcode)
        {
            var loan = db.tblLoanDistribution.Where(l =>l.OrgId==User.OrgId && l.LDisCode == lcode).FirstOrDefault();
            VmLoanDistribution vmLoan = new VmLoanDistribution();
            if (loan != null)
            {
                vmLoan.MemberCode = loan.MemberCode;
                vmLoan.MemberName = loan.MemberName;
                vmLoan.MemberAddress = loan.MemberAddress;
                vmLoan.MemberMobile = loan.MemberMobile;
            }
            return Json(vmLoan);
        }
        public ActionResult SaveLoanAdjustment(VmLoanAdjustment model)
        {
            var memberCode = db.tblLoanDistribution.Where(d => d.LDisCode == model.LDisCode).FirstOrDefault().MemberCode;
            bool IsSuccess = false;
            if (ModelState.IsValid)
            {
                if (model.LAdjId == 0)
                {
                    LoanAdjustment loanAdj = new LoanAdjustment
                    {
                        MemberCode = memberCode,
                        MemberName = model.MemberName,
                        MemberAddress = model.MemberAddress,
                        MemberMobile = model.MemberMobile,
                        LDisCode = model.LDisCode,
                        AdjustmentAmount = model.AdjustmentAmount,
                        AdjustmentDate = model.AdjustmentDate,
                        Remarks = model.Remarks,
                        OrgId = User.OrgId,
                        EntryUser = User.UserName,
                        EntryDate = DateTime.Now,
                    };
                    db.tblLoanAdjustment.Add(loanAdj);
                    db.SaveChanges();
                    IsSuccess = true;
                }
            }
            return Json(IsSuccess);
        }

        public ActionResult GetAdjAmountCheck(string lcode, double amount)
        {
            bool IsSuccess = true;
            var member = db.tblLoanDistribution.Where(l => l.LDisCode == lcode && l.OrgId == User.OrgId).FirstOrDefault();
            var saveAm = db.tblSavings.Where(s => s.MemberCode == member.MemberCode && s.OrgId == User.OrgId).ToList();
            double amountSave = saveAm.Sum(s=>s.SavingAmount);
            var saveadjTotal = db.tblLoanAdjustment.Where(a => a.MemberCode == member.MemberCode && a.OrgId == User.OrgId).ToList();
            double totaladj = saveadjTotal.Sum(a => a.AdjustmentAmount);
            double currentSave = (amountSave - totaladj);
            if (currentSave >= amount)
            {
                IsSuccess = false;
            }
            return Json(IsSuccess);
        }
        #endregion

        #region Withdraw
        public ActionResult WithdrawList(string flag)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var with = db.tblWithdraw.Where(w => w.OrgId == User.OrgId).ToList();
                List<VmWithdraw> list = new List<VmWithdraw>();
                foreach(var item in with)
                {
                    VmWithdraw withdraw = new VmWithdraw
                    {
                        WithdrawId = item.WithdrawId,
                        WithdrawAmount = item.WithdrawAmount,
                        Remarks = item.Remarks,
                        EntryDate = item.EntryDate,
                        OrgId = item.OrgId,
                        EntryUser = item.EntryUser,
                    };
                    list.Add(withdraw);
                }
                return PartialView("_WithdrawList", list);
            }
        }

        public ActionResult SaveWithdrawBalance(VmWithdraw model)
        {
            bool IsSuccess = false;
            if (ModelState.IsValid)
            {
                if (model.WithdrawId == 0)
                {
                    Withdraw withdraw = new Withdraw()
                    {
                        WithdrawAmount=model.WithdrawAmount,
                        Remarks=model.Remarks,
                        EntryDate=DateTime.Now,
                        EntryUser=User.UserName,
                        OrgId=User.OrgId
                    };
                    db.tblWithdraw.Add(withdraw);
                    IsSuccess = true;
                }
                else
                {
                    var withUp = db.tblWithdraw.Where(w => w.WithdrawId == model.WithdrawId).FirstOrDefault();
                    if(withUp != null)
                    {
                        withUp.WithdrawAmount = model.WithdrawAmount;
                        withUp.Remarks = model.Remarks;
                        withUp.UpdateDate = DateTime.Now;
                        withUp.UpdateUser = User.UserName;
                    }
                }
                db.SaveChanges();
            }
            return Json(IsSuccess);
        }
        #endregion

        #region LoanReport
        public ActionResult LoanReportList(string flag, string mCode, string lCode, string mName, string mMobile,string status)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                List<VmLoanDistribution> loanList = new List<VmLoanDistribution>();
                var allLone = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId).ToList();
                var oneMemberLoan = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim())) && (status == null || status.Trim() == "" || l.LoanStatus.ToLower().Contains(status.Trim()))).ToList();
                foreach(var item in oneMemberLoan)
                {
                    var collection = db.tblMoneyCollection.Where(c => c.LDisCode == item.LDisCode).ToList();
                    double amount = collection.Select(a => a.MCAmount).Sum();
                    var loan = db.tblLoanDistribution.Where(l => l.LDisCode == item.LDisCode).FirstOrDefault();
                    var adjment = db.tblLoanAdjustment.Where(adj => adj.LDisCode == item.LDisCode).ToList();
                    double loandue = (loan.NetPayable - amount); 
                    double duedays = loandue / loan.DailyPayable;
                    double payDays = loan.TimeLimit - duedays;
                    double adjAmount = adjment.Select(ad => ad.AdjustmentAmount).Sum();
                    double principalamount = ((item.LoanAmount / item.TimeLimit) * payDays);
                    double profitAmount = (amount - principalamount);
                    //var adjmentall = db.tblLoanAdjustment.Where(a => a.OrgId == User.OrgId && a.LDisCode == item.LDisCode).ToList();
                    //double adjAmo = adjmentall.Sum(a => a.AdjustmentAmount);
                    VmLoanDistribution vmLoan = new VmLoanDistribution();
                    if (loan != null)
                    {
                        vmLoan.SkimName = item.SkimName;
                        vmLoan.LDisCode = item.LDisCode;
                        vmLoan.MemberCode = item.MemberCode;
                        vmLoan.MemberName = item.MemberName;
                        vmLoan.MemberAddress = item.MemberAddress;
                        vmLoan.MemberMobile = item.MemberMobile;
                        vmLoan.LoanAmount = item.LoanAmount;
                        vmLoan.NetPayable = item.NetPayable;
                        vmLoan.DailyPayable = item.DailyPayable;
                        vmLoan.TotalCollection = amount;
                        vmLoan.DueLoanCollection = loandue;
                        vmLoan.TotalDueDays = duedays;
                        vmLoan.TotalPayDays = payDays;
                        vmLoan.TimeLimit = item.TimeLimit;
                        vmLoan.LoanStatus = item.LoanStatus;
                        vmLoan.EntryDate = item.EntryDate;
                        vmLoan.AdjustmentAmount = adjAmount;
                        vmLoan.TotalProfitAmount = profitAmount;
                        vmLoan.TotalPrincipalAmount = principalamount;
                        vmLoan.NetDueAmount = (loandue - adjAmount);
                        
                    }
                    loanList.Add(vmLoan);
                }
                return PartialView("_LoanReportList", loanList);
            }
        }

        public ActionResult LoanDetailsReport(string flag, string mCode, string lCode, string mName, string mMobile,string status,string rptType)
        {
            List<VmLoanDistribution> loanList = new List<VmLoanDistribution>();
            var allLone = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId).ToList();
            var oneMemberLoan = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim())) && (status == null || status.Trim() == "" || l.LoanStatus.ToLower().Contains(status.Trim()))).ToList();
            foreach (var item in oneMemberLoan)
            {
                var collection = db.tblMoneyCollection.Where(c => c.LDisCode == item.LDisCode).ToList();
                double amount = collection.Select(a => a.MCAmount).Sum();
                var loan = db.tblLoanDistribution.Where(l => l.LDisCode == item.LDisCode).FirstOrDefault();
                var adjment = db.tblLoanAdjustment.Where(adj => adj.LDisCode == item.LDisCode).ToList();
                double loandue = (loan.NetPayable - amount);
                double duedays = loandue / loan.DailyPayable;
                double payDays = loan.TimeLimit - duedays;
                double adjAmount = adjment.Select(ad => ad.AdjustmentAmount).Sum();
                double principalamount = ((item.LoanAmount / item.TimeLimit) * payDays);
                double profitAmount = (amount - principalamount);
                VmLoanDistribution vmLoan = new VmLoanDistribution();
                if (loan != null)
                {
                    vmLoan.SkimName = item.SkimName;
                    vmLoan.LDisCode = item.LDisCode;
                    vmLoan.MemberCode = item.MemberCode;
                    vmLoan.MemberName = item.MemberName;
                    vmLoan.MemberAddress = item.MemberAddress;
                    vmLoan.MemberMobile = item.MemberMobile;
                    vmLoan.LoanAmount = item.LoanAmount;
                    vmLoan.NetPayable = item.NetPayable;
                    vmLoan.DailyPayable = item.DailyPayable;
                    vmLoan.TotalCollection = amount;
                    vmLoan.DueLoanCollection = loandue;
                    vmLoan.TotalDueDays = duedays;
                    vmLoan.TotalPayDays = payDays;
                    vmLoan.TimeLimit = item.TimeLimit;
                    vmLoan.LoanStatus = item.LoanStatus;
                    vmLoan.EntryDate = item.EntryDate;
                    vmLoan.AdjustmentAmount = adjAmount;
                    vmLoan.NetDueAmount = (loandue - adjAmount);
                    vmLoan.TotalProfitAmount = profitAmount;
                    vmLoan.TotalPrincipalAmount = principalamount;
                }
                loanList.Add(vmLoan);
            }

            LocalReport localReport = new LocalReport();
            string reportPath = Server.MapPath("~/Reports/rptLoanDetailsReport.rdlc");
            if (System.IO.File.Exists(reportPath))
            {
                localReport.ReportPath = reportPath;
                ReportDataSource dataSource1 = new ReportDataSource("LoanReport", loanList);
                localReport.DataSources.Clear();
                localReport.DataSources.Add(dataSource1);
                localReport.Refresh();
                localReport.DisplayName = "LoanReport"+ oneMemberLoan.FirstOrDefault();

                string mimeType;
                string encoding;
                string fileNameExtension;
                Warning[] warnings;
                string[] streams;
                byte[] renderedBytes;

                renderedBytes = localReport.Render(
                    rptType,
                    "",
                    out mimeType,
                    out encoding,
                    out fileNameExtension,
                    out streams,
                    out warnings);
                return File(renderedBytes, mimeType);
            }
            return new EmptyResult();
        }
        #endregion

        #region Savings Adjustment Report
        public ActionResult SavingsReport(string mCode)
        {
            var savings = db.tblSavings.Where(s => s.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || s.MemberCode.ToLower().Contains(mCode.ToLower().Trim()))).ToList();
            List<VmSavings> savelist = new List<VmSavings>();
            foreach (var item in savings)
            {
                VmSavings vms = new VmSavings
                {
                    MemberCode = item.MemberCode,
                    MemberName = item.MemberName,
                    SavingAmount = item.SavingAmount,
                    SavingDate = item.SavingDate,
                };
                savelist.Add(vms);
            }
            ViewBag.Savingslist = savelist;

            var loanadjust = db.tblLoanAdjustment.Where(a => a.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || a.MemberCode.ToLower().Contains(mCode.ToLower().Trim()))).ToList();
            List<VmLoanAdjustment> loanadjlist = new List<VmLoanAdjustment>();
            foreach (var item in loanadjust)
            {
                VmLoanAdjustment vmLoan = new VmLoanAdjustment
                {
                    MemberCode = item.MemberCode,
                    MemberName = item.MemberName,
                    AdjustmentAmount = item.AdjustmentAmount,
                    AdjustmentDate = item.AdjustmentDate,
                };
                loanadjlist.Add(vmLoan);
            }
            ViewBag.Adjustmentlist = loanadjlist;

            VmSavings saveAndadjust = new VmSavings();
            saveAndadjust.TotalSavings = savelist.Select(s => s.SavingAmount).Sum();
            saveAndadjust.TotalAdjust = loanadjlist.Select(l => l.AdjustmentAmount).Sum();
            saveAndadjust.CurrentSavings = ((savelist.Select(s => s.SavingAmount).Sum()) - (loanadjlist.Select(l => l.AdjustmentAmount).Sum()));

            ViewBag.SaveAndAdjustmentAmount = saveAndadjust;

            return View();
        }

        public ActionResult SavingsReport2(string flag, string mCode, string mName)
        {
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var savings = db.tblSavings.Where(s => s.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || s.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || s.MemberName.ToLower().Contains(mName.Trim()))).ToList();
                List<VmSavings> savelist = new List<VmSavings>();
                foreach (var item in savings)
                {
                    VmSavings vms = new VmSavings
                    {
                        MemberCode = item.MemberCode,
                        MemberName = item.MemberName,
                        SavingAmount = item.SavingAmount,
                        SavingDate = item.SavingDate,
                    };
                    savelist.Add(vms);
                }
                ViewBag.Savingslist = savelist;

                var loanadjust = db.tblLoanAdjustment.Where(a => a.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || a.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || a.MemberName.ToLower().Contains(mName.Trim()))).ToList();
                List<VmLoanAdjustment> loanadjlist = new List<VmLoanAdjustment>();
                foreach (var item in loanadjust)
                {
                    VmLoanAdjustment vmLoan = new VmLoanAdjustment
                    {
                        MemberCode = item.MemberCode,
                        MemberName = item.MemberName,
                        AdjustmentAmount = item.AdjustmentAmount,
                        AdjustmentDate = item.AdjustmentDate,
                    };
                    loanadjlist.Add(vmLoan);
                }
                ViewBag.Adjustmentlist = loanadjlist;

                VmSavings saveAndadjust = new VmSavings();
                saveAndadjust.TotalSavings = savelist.Select(s => s.SavingAmount).Sum();
                saveAndadjust.TotalAdjust = loanadjlist.Select(l => l.AdjustmentAmount).Sum();
                saveAndadjust.CurrentSavings = ((savelist.Select(s => s.SavingAmount).Sum()) - (loanadjlist.Select(l => l.AdjustmentAmount).Sum()));

                ViewBag.SaveAndAdjustmentAmount = saveAndadjust;

                return PartialView("_SavingsReport2", savelist);
            }
        }
        #endregion

        #region BalanceReport
        public ActionResult BalanceReport()
        {
            var invvest = db.tblInvestment.Where(i => i.OrgId == User.OrgId).ToList();
            double totalinvest = invvest.Sum(i => i.InvestAmount);
            var dist = db.tblLoanDistribution.Where(d => d.OrgId == User.OrgId).ToList();
            double totaldistribution = dist.Sum(d => d.LoanAmount);
            var collectin = db.tblMoneyCollection.Where(c => c.OrgId == User.OrgId).ToList();
            double totalCollection = collectin.Sum(c => c.MCAmount);
            var withd = db.tblWithdraw.Where(w => w.OrgId == User.OrgId).ToList();
            double totalWithdraw = withd.Sum(w => w.WithdrawAmount);

            VmBalanceReport vmBalance = new VmBalanceReport();
            vmBalance.TotalInvest = totalinvest;
            vmBalance.TotalDistribution = totaldistribution;
            vmBalance.TotalCollection = totalCollection;
            vmBalance.TotalWithdraw = totalWithdraw;
            vmBalance.Balance = ((totalinvest + totalCollection) - (totaldistribution + totalWithdraw));
            return View(vmBalance);
        }
        #endregion

        #region CollectionReport
        public ActionResult DailyCollectionReportList(string flag, string mCode, string lCode, string mName, string mMobile,string fromDate="",string toDate="")
        {
            DateTime dtimeFromDate = new DateTime();
            DateTime dtimeToDate = new DateTime();
            if (fromDate.Trim() != "")
            {
                dtimeFromDate = Convert.ToDateTime(fromDate);
            }
            if (toDate.Trim() != "")
            {
                dtimeToDate = Convert.ToDateTime(toDate);
            }
            if (string.IsNullOrEmpty(flag))
            {
                return View();

            }
            else
            {
                var money = db.tblMoneyCollection.Where(l => l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim())) &&
                                (
                                    (fromDate == "" && toDate == "") ||

                                    (((fromDate != "" && fromDate != null) && (toDate != "" && toDate != null)) && DbFunctions.TruncateTime(l.MCDate) >= DbFunctions.TruncateTime(dtimeFromDate) && DbFunctions.TruncateTime(l.MCDate) <= DbFunctions.TruncateTime(dtimeToDate)) ||

                                    ((fromDate != "" && fromDate != null) && DbFunctions.TruncateTime(l.MCDate) == DbFunctions.TruncateTime(dtimeFromDate)) ||

                                    ((toDate != "" && toDate != null) && DbFunctions.TruncateTime(l.MCDate) == DbFunctions.TruncateTime(dtimeToDate))
                               )

                ).ToList();
                List<VmMoneyCollection> list = new List<VmMoneyCollection>();
                foreach (var item in money)
                {
                    var loan = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId).ToList();
                    var loanamount = loan.Where(l => l.LDisCode == item.LDisCode).FirstOrDefault();
                    var profit = (loanamount.LoanAmount / loanamount.TimeLimit);
                    VmMoneyCollection vmMoney = new VmMoneyCollection
                    {
                        MCId = item.MCId,
                        MCName = item.MCName,
                        MCMobile = item.MCMobile,
                        MCDate = item.MCDate,
                        MemberCode = item.MemberCode,
                        MemberName = item.MemberName,
                        MemberMobile = item.MemberMobile,
                        MemberAddress = item.MemberAddress,
                        MCAmount = item.MCAmount,
                        LDisCode = item.LDisCode,
                        Remarks = item.Remarks,
                        EntryDate = item.EntryDate,
                        EntryUser = item.EntryUser,
                        ProfitAmount = (item.MCAmount - profit),
                        PrincipalAmount = profit,
                    };
                    list.Add(vmMoney);
                }
                return PartialView("_DailyCollectionReportList", list);
            }
        }
        public ActionResult DailyCollectionReport(string flag,string rptType, string mCode, string lCode, string mName, string mMobile, string fromDate = "", string toDate = "")
        {
            DateTime dtimeFromDate = new DateTime();
            DateTime dtimeToDate = new DateTime();
            if (fromDate.Trim() != "")
            {
                dtimeFromDate = Convert.ToDateTime(fromDate);
            }
            if (toDate.Trim() != "")
            {
                dtimeToDate = Convert.ToDateTime(toDate);
            }
            var money = db.tblMoneyCollection.Where(l => l.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || l.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (lCode == null || lCode.Trim() == "" || l.LDisCode.ToLower().Contains(lCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || l.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || l.MemberMobile.ToLower().Contains(mMobile.Trim())) &&
                                (
                                    (fromDate == "" && toDate == "") ||

                                    (((fromDate != "" && fromDate != null) && (toDate != "" && toDate != null)) && DbFunctions.TruncateTime(l.MCDate) >= DbFunctions.TruncateTime(dtimeFromDate) && DbFunctions.TruncateTime(l.MCDate) <= DbFunctions.TruncateTime(dtimeToDate)) ||

                                    ((fromDate != "" && fromDate != null) && DbFunctions.TruncateTime(l.MCDate) == DbFunctions.TruncateTime(dtimeFromDate)) ||

                                    ((toDate != "" && toDate != null) && DbFunctions.TruncateTime(l.MCDate) == DbFunctions.TruncateTime(dtimeToDate))
                               )

                ).ToList();
            List<VmMoneyCollection> list = new List<VmMoneyCollection>();
            foreach (var item in money)
            {
                var loan = db.tblLoanDistribution.Where(l => l.OrgId == User.OrgId).ToList();
                var loanamount = loan.Where(l => l.LDisCode == item.LDisCode).FirstOrDefault();
                var profit = (loanamount.LoanAmount / loanamount.TimeLimit);
                VmMoneyCollection vmMoney = new VmMoneyCollection
                {
                    MCId = item.MCId,
                    MCName = item.MCName,
                    MCMobile = item.MCMobile,
                    MCDate = item.MCDate,
                    MemberCode = item.MemberCode,
                    MemberName = item.MemberName,
                    MemberMobile = item.MemberMobile,
                    MemberAddress = item.MemberAddress,
                    MCAmount = item.MCAmount,
                    LDisCode = item.LDisCode,
                    Remarks = item.Remarks,
                    EntryDate = item.EntryDate,
                    EntryUser = item.EntryUser,
                    ProfitAmount = (item.MCAmount - profit),
                    PrincipalAmount = profit,
                };
                list.Add(vmMoney);
            }

            LocalReport localReport = new LocalReport();
            string reportPath = Server.MapPath("~/Reports/rptCollectionReport.rdlc");
            if (System.IO.File.Exists(reportPath))
            {
                localReport.ReportPath = reportPath;
                ReportDataSource dataSource1 = new ReportDataSource("CollectionReport", list);
                localReport.DataSources.Clear();
                localReport.DataSources.Add(dataSource1);
                localReport.Refresh();
                localReport.DisplayName = "CollectionReport";

                string mimeType;
                string encoding;
                string fileNameExtension;
                Warning[] warnings;
                string[] streams;
                byte[] renderedBytes;

                renderedBytes = localReport.Render(
                    rptType,
                    "",
                    out mimeType,
                    out encoding,
                    out fileNameExtension,
                    out streams,
                    out warnings);
                return File(renderedBytes, mimeType);
            }
            return new EmptyResult();
        }
        #endregion

        #region Total Savings Collection
        public ActionResult TotalSavingCollection(string flag, string mCode, string mName, string mMobile,string fromDate="",string toDate="")
        {
            DateTime dtimeFromDate = new DateTime();
            DateTime dtimeToDate = new DateTime();
            if (fromDate.Trim() != "")
            {
                dtimeFromDate = Convert.ToDateTime(fromDate);
            }
            if (toDate.Trim() != "")
            {
                dtimeToDate = Convert.ToDateTime(toDate);
            }
            if (string.IsNullOrEmpty(flag))
            {
                return View();
            }
            else
            {
                var savings = db.tblSavings.Where(m => m.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || m.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || m.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || m.MemberMobile.ToLower().Contains(mMobile.Trim())) &&
                                (
                                    (fromDate == "" && toDate == "") ||

                                    (((fromDate != "" && fromDate != null) && (toDate != "" && toDate != null)) && DbFunctions.TruncateTime(m.SavingDate) >= DbFunctions.TruncateTime(dtimeFromDate) && DbFunctions.TruncateTime(m.SavingDate) <= DbFunctions.TruncateTime(dtimeToDate)) ||

                                    ((fromDate != "" && fromDate != null) && DbFunctions.TruncateTime(m.SavingDate) == DbFunctions.TruncateTime(dtimeFromDate)) ||

                                    ((toDate != "" && toDate != null) && DbFunctions.TruncateTime(m.SavingDate) == DbFunctions.TruncateTime(dtimeToDate))
                               )
                ).ToList();
                List<VmSavings> saveList = new List<VmSavings>();
                foreach (var item in savings)
                {
                    VmSavings vmSavings = new VmSavings
                    {
                        SavingId = item.SavingId,
                        MemberCode = item.MemberCode,
                        MemberName = item.MemberName,
                        MemberAddress = item.MemberAddress,
                        MemberMobile = item.MemberMobile,
                        SavingAmount = item.SavingAmount,
                        SavingDate = item.SavingDate,
                        Remarks = item.Remarks,
                        OrgId = item.OrgId,
                        EntryDate = item.EntryDate,
                        EntryUser = item.EntryUser,
                    };
                    saveList.Add(vmSavings);
                }
                return PartialView("_TotalSavingCollection", saveList);
            }
        }

        public ActionResult TotalSavingsCollectionReport(string flag,string rptType, string mCode, string mName, string mMobile, string fromDate = "", string toDate = "")
        {
            DateTime dtimeFromDate = new DateTime();
            DateTime dtimeToDate = new DateTime();
            if (fromDate.Trim() != "")
            {
                dtimeFromDate = Convert.ToDateTime(fromDate);
            }
            if (toDate.Trim() != "")
            {
                dtimeToDate = Convert.ToDateTime(toDate);
            }
            var savings = db.tblSavings.Where(m => m.OrgId == User.OrgId && (mCode == null || mCode.Trim() == "" || m.MemberCode.ToLower().Contains(mCode.ToLower().Trim())) && (mName == null || mName.Trim() == "" || m.MemberName.ToLower().Contains(mName.Trim())) && (mMobile == null || mMobile.Trim() == "" || m.MemberMobile.ToLower().Contains(mMobile.Trim())) &&
                                (
                                    (fromDate == "" && toDate == "") ||

                                    (((fromDate != "" && fromDate != null) && (toDate != "" && toDate != null)) && DbFunctions.TruncateTime(m.SavingDate) >= DbFunctions.TruncateTime(dtimeFromDate) && DbFunctions.TruncateTime(m.SavingDate) <= DbFunctions.TruncateTime(dtimeToDate)) ||

                                    ((fromDate != "" && fromDate != null) && DbFunctions.TruncateTime(m.SavingDate) == DbFunctions.TruncateTime(dtimeFromDate)) ||

                                    ((toDate != "" && toDate != null) && DbFunctions.TruncateTime(m.SavingDate) == DbFunctions.TruncateTime(dtimeToDate))
                               )
                ).ToList();
            List<VmSavings> saveList = new List<VmSavings>();
            foreach (var item in savings)
            {
                VmSavings vmSavings = new VmSavings
                {
                    SavingId = item.SavingId,
                    MemberCode = item.MemberCode,
                    MemberName = item.MemberName,
                    MemberAddress = item.MemberAddress,
                    MemberMobile = item.MemberMobile,
                    SavingAmount = item.SavingAmount,
                    SavingDate = item.SavingDate,
                    Remarks = item.Remarks,
                    OrgId = item.OrgId,
                    EntryDate = item.EntryDate,
                    EntryUser = item.EntryUser,
                };
                saveList.Add(vmSavings);
            }

            LocalReport localReport = new LocalReport();
            string reportPath = Server.MapPath("~/Reports/rptTotalSavingsCollectionReport.rdlc");
            if (System.IO.File.Exists(reportPath))
            {
                localReport.ReportPath = reportPath;
                ReportDataSource dataSource1 = new ReportDataSource("SavingsCollection", saveList);
                localReport.DataSources.Clear();
                localReport.DataSources.Add(dataSource1);
                localReport.Refresh();
                localReport.DisplayName = "SavingsCollection";

                string mimeType;
                string encoding;
                string fileNameExtension;
                Warning[] warnings;
                string[] streams;
                byte[] renderedBytes;

                renderedBytes = localReport.Render(
                    rptType,
                    "",
                    out mimeType,
                    out encoding,
                    out fileNameExtension,
                    out streams,
                    out warnings);
                return File(renderedBytes, mimeType);
            }
            return new EmptyResult();
        }
        #endregion
    }
}