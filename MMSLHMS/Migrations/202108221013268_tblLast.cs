namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLast : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblLoanDistribution", "SkimName", c => c.String());
            AlterColumn("dbo.tblLoanSkim", "Interest", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.tblLoanSkim", "Interest", c => c.Int(nullable: false));
            DropColumn("dbo.tblLoanDistribution", "SkimName");
        }
    }
}
