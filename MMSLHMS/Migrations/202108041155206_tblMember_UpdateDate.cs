namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblMember_UpdateDate : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblMembers", "UpdateUser", c => c.String());
            AddColumn("dbo.tblMembers", "UpdateDate", c => c.DateTime());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblMembers", "UpdateDate");
            DropColumn("dbo.tblMembers", "UpdateUser");
        }
    }
}
