namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoanDistribution_LoanDis : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.tblLoanDistribution", "LoanInterest", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.tblLoanDistribution", "LoanInterest", c => c.String());
        }
    }
}
