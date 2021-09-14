namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblMembers : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblMembers",
                c => new
                    {
                        MemberId = c.Long(nullable: false, identity: true),
                        MemberCode = c.String(),
                        MemberName = c.String(),
                        MemberAddress = c.String(),
                        MemberMobile = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.MemberId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblMembers");
        }
    }
}
