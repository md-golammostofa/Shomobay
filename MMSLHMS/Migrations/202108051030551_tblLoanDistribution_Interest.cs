namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoanDistribution_Interest : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblLoanDistribution", "LoanInterest", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblLoanDistribution", "LoanInterest");
        }
    }
}
