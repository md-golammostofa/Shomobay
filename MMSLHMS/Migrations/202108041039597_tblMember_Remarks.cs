namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblMember_Remarks : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblMembers", "Remarks", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblMembers", "Remarks");
        }
    }
}
