namespace MMSLHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tblLoanDistribution_Lcodenetpayable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tblLoanDistribution", "LDisCode", c => c.String());
            AddColumn("dbo.tblLoanDistribution", "NetPayable", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.tblLoanDistribution", "NetPayable");
            DropColumn("dbo.tblLoanDistribution", "LDisCode");
        }
    }
}
