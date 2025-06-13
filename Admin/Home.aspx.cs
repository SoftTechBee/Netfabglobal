using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITConnection;
using TripleITTransaction;


public partial class Admin_Default : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsDashboard objdash = new clsDashboard();
    clsConnection objcon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
       
            if (!IsPostBack)
            {
            lbTotalDeposite.Text = objdash.CompanyTurnOver();
            lbTotalWithdrawal.Text = objdash.Totalwithdraw();
            lbpendingwithdraw.Text = objdash.Totalwithdraw();
            lbCompanyNetBalance.Text = (Convert.ToDecimal(lbTotalDeposite.Text) - Convert.ToDecimal(lbTotalWithdrawal.Text)).ToString();
              lbTotalMember.Text = objfun.AllUser("1");
            //lbTodayJoin.Text = objfun.UserStatus("1", "Active");
            lbpaidmember.Text = objfun.UserStatus("0", "Active");
            lbfreemember.Text = objfun.UserStatus("0", "Not Active");
            //income
            lblGlobalLevel.Text = objdash.IncomeType("Admin", "GLOBALLEVEL");
            lblDirectRefer.Text = objdash.IncomeType("Admin", "DIRECT");
            lblExtraDirect.Text = objdash.IncomeType("Admin", "EXTRADIRECT");
            lblExtraTeam.Text = objdash.IncomeType("Admin", "TEAM");
            lblGlobalBox.Text = objdash.IncomeType("Admin", "GLOBALBOX");
            lblRoyalty.Text = objdash.IncomeType("Admin", "ROYALTY");
            lblSalary.Text = objdash.IncomeType("Admin", "SALARY");
            lblMatchingBinary.Text = objdash.IncomeType("Admin", "MATCHING");
            lblSponsorBinary.Text = objdash.IncomeType("Admin", "DIRECTMATCHING");
            lblRepurchase.Text = objdash.IncomeType("Admin", "Repurchase");
            //lbteambusiness.Text = objdash.TotalTeamBusness();
            loadTeam();
            loadBuiness();
        }
       
    }
    private void loadTeam()
    {
        try
        {


            string sql = "EXEC [dbo].[BinaryTeam]@UserName ='ADMIN'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
              

                lbLeftTeam.Text = dt.Rows[0]["LeftTeam"].ToString();
                lbRightTeam.Text = dt.Rows[0]["RightTeam"].ToString();

                lbActiveleftteam.Text = dt.Rows[0]["LeftActiveTeam"].ToString();
                lbActiveRightteam.Text = dt.Rows[0]["RightActiveTeam"].ToString();

                lbInActiveLeftteam.Text = dt.Rows[0]["LeftInactiveTeam"].ToString();
                lbInActiveRightteam.Text = dt.Rows[0]["RightInactiveTeam"].ToString();


            }

        }
        catch (Exception ex)
        { }
    }
    private void loadBuiness()
    {
        try
        {


            string sql = "EXEC [dbo].[BinaryBusiness]@UserName ='NF100001'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                lbtotalbusiness.Text = dt.Rows[0]["BusinessTotal"].ToString();
                leftbusiness.Text = dt.Rows[0]["BusinessLeft"].ToString();
                rightbusiness.Text = dt.Rows[0]["BusinessRight"].ToString();
                AvailableleftBV.Text = dt.Rows[0]["BVLeftBalance"].ToString();
                leftBV.Text = dt.Rows[0]["BVLeftTotal"].ToString();
                AvailablerightBV.Text = dt.Rows[0]["BVRightBalance"].ToString();
                rightBV.Text = dt.Rows[0]["BVRightTotal"].ToString();
                Availableleftpv.Text = dt.Rows[0]["PVLeftBalance"].ToString();
                leftpv.Text = dt.Rows[0]["PVLeftTotal"].ToString();
                rightpv.Text = dt.Rows[0]["PVRightTotal"].ToString();
                Availablerightpv.Text = dt.Rows[0]["PVRightBalance"].ToString();

            }

        }
        catch (Exception ex)
        { }
    }

}