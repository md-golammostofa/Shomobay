namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblSkim : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tblLoanSkim",
                c => new
                    {
                        SkimId = c.Long(nullable: false, identity: true),
                        SkimName = c.String(),
                        Interest = c.Int(nullable: false),
                        TimeLimit = c.Int(nullable: false),
                        Remarks = c.String(),
                        OrgId = c.Int(),
                        EntryUser = c.String(),
                        EntryDate = c.DateTime(),
                        UpdateUser = c.String(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.SkimId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tblLoanSkim");
        }
    }
}
