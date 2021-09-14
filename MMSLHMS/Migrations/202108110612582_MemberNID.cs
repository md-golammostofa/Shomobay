namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MemberNID : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblMembers", "NIDNumber", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblMembers", "NIDNumber");
        }
    }
}
