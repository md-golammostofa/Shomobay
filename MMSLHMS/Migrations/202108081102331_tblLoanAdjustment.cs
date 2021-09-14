namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoanAdjustment : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblLoanAdjustment",
                c => new
                    {
                        LAdjId = c.Long(nullable: false, identity: true),
                        LDisCode = c.String(),
                        MemberCode = c.String(),
                        MemberName = c.String(),
                        MemberAddress = c.String(),
                        MemberMobile = c.String(),
                        AdjustmentAmount = c.Double(nullable: false),
                        AdjustmentDate = c.DateTime(),
                        Remarks = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.LAdjId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblLoanAdjustment");
        }
    }
}
