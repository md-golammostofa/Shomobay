namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoanDistribution_DailyPayable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblLoanDistribution", "DailyPayable", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblLoanDistribution", "DailyPayable");
        }
    }
}
