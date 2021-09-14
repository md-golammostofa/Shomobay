namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MemberStatus : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblMembers", "MemberStatus", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblMembers", "MemberStatus");
        }
    }
}
