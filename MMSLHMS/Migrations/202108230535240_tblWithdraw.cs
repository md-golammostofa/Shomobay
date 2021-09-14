namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblWithdraw : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblWithdraw",
                c => new
                    {
                        WithdrawId = c.Long(nullable: false, identity: true),
                        WithdrawAmount = c.Double(nullable: false),
                        Remarks = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.WithdrawId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblWithdraw");
        }
    }
}
