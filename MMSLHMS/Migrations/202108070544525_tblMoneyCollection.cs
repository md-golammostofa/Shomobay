namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblMoneyCollection : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblMoneyCollection",
                c => new
                    {
                        MCId = c.Long(nullable: false, identity: true),
                        MCName = c.String(),
                        MCMobile = c.String(),
                        MemberCode = c.String(),
                        MemberName = c.String(),
                        MemberAddress = c.String(),
                        MemberMobile = c.String(),
                        MCAmount = c.Double(nullable: false),
                        LDisCode = c.String(),
                        MCDate = c.DateTime(),
                        Remarks = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.MCId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblMoneyCollection");
        }
    }
}
