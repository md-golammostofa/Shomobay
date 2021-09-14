namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoandistribution_LoanStatus : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblLoanDistribution", "LoanStatus", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblLoanDistribution", "LoanStatus");
        }
    }
}
