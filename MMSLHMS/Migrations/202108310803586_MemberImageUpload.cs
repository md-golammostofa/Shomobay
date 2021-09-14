namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MemberImageUpload : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblMembers", "MemberImage", c => c.String(maxLength: 250));
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblMembers", "MemberImage");
        }
    }
}
