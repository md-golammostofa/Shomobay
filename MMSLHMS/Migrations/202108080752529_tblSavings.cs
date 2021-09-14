namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblSavings : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblSavings",
                c => new
                    {
                        SavingId = c.Long(nullable: false, identity: true),
                        MemberCode = c.String(),
                        MemberName = c.String(),
                        MemberAddress = c.String(),
                        MemberMobile = c.String(),
                        SavingAmount = c.Double(nullable: false),
                        SavingDate = c.DateTime(),
                        Remarks = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.SavingId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblSavings");
        }
    }
}
