namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoanDistribution : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblLoanDistribution",
                c => new
                    {
                        LDisId = c.Long(nullable: false, identity: true),
                        MemberCode = c.String(),
                        MemberName = c.String(),
                        MemberAddress = c.String(),
                        MemberMobile = c.String(),
                        LoanAmount = c.Double(nullable: false),
                        TimeLimit = c.Int(nullable: false),
                        RefName = c.String(),
                        RefMobile = c.String(),
                        Remarks = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.LDisId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblLoanDistribution");
        }
    }
}
