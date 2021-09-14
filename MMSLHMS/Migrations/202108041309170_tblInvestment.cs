namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblInvestment : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblInvestment",
                c => new
                    {
                        InvestmentId = c.Long(nullable: false, identity: true),
                        InvestAmount = c.Double(nullable: false),
                        Remarks = c.String(),
                        InvestDate = c.DateTime(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.InvestmentId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblInvestment");
        }
    }
}
