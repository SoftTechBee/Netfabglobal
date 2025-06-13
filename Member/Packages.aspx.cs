using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITConnection;
using TripleITTransaction;

public partial class Member_Default : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsDashboard objdashboard = new clsDashboard();
    clsList objlist = new clsList();
    clsAMD objamd = new clsAMD();
    clsTimeZone objtime = new clsTimeZone();
    CoinPayments objcoin = new CoinPayments();
    clsDashboard objDash = new clsDashboard();


    protected void Page_Load(object sender, EventArgs e)
    {
      
            try
            {
                if (!IsPostBack)
                {
                    string reqUser = Request.QueryString["Id"].ToString();
                    lbActiveMember.Text = reqUser == "0" ? SessionData.Get<string>("newuser") : reqUser;
                txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("newuser"));
                txtcurrentpack.Text = objdashboard.ReturnLastPackName(lbActiveMember.Text);
                txtcurrentamt.Text = objdashboard.ReturnLastPackAmt(lbActiveMember.Text);
                loadPack();
                SessionData.Put("ActiveUser", lbActiveMember.Text);




            }
        }
            catch (Exception ex)
            { }
      
    }


    private void loadPack()
    {
        try
        {
            string sql = "select Pid,Product,Descrption,MRP,DOI,PackID,cast(PV as int) as PV,cast(BV as int) as BV,Matching,Capping from tblproduct";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {
                lbdanger.Text = "Opps! NO Data Found";
                danger.Visible = true;
            }
        }
        catch (Exception ex)
        {

        }
    }



    protected void repPack_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Click")
        {
            int packid = Convert.ToInt32(e.CommandArgument.ToString());
            Label lbamount = e.Item.FindControl("lbamount") as Label;
            Label lbpack = e.Item.FindControl("lbpack") as Label;
            Label lblpv = e.Item.FindControl("lblpv") as Label;
            Label lblbv = e.Item.FindControl("lblbv") as Label;
            //int ActiveDirect = Convert.ToInt32(objDash.TotalDirect(lbActiveMember.Text));
            //int CurrentPackid = Convert.ToInt32(objDash.ReturnPackID(lbActiveMember.Text));
            string Status= objDash.AccountStatus(lbActiveMember.Text);

            try
            {
                //if (ActiveDirect >= 2)
                //{
                //if (Status == "Active")
                //{


                    //if ((CurrentPackid + 1) == packid)
                    //{
                    //    //if (1 == packid)
                    //{


                    //btnaction.Visible = false;
                    decimal widamount = 0, Min = 0, Max = 0;
                    decimal lbpv = 0, lbbv = 0;
                    string date = objtime.returnStringServerMachTime();
                    string PackType = lbpack.Text;

                    string Username = SessionData.Get<string>("newuser");
                    decimal finalamount = Convert.ToDecimal(txtbalance.Text.Trim());

                    widamount = Convert.ToDecimal(lbamount.Text);
                    lbpv = Convert.ToDecimal(lblpv.Text);
                    lbbv = Convert.ToDecimal(lblbv.Text);
             

                    if (finalamount >= widamount && widamount >= 100)
                    {


                        int a = objamd.ActiveMember(lbActiveMember.Text.Trim(), widamount, widamount, PackType, Username, "N");
                        if (a > 0)
                        {

                        int b = objamd.PRODUCTBILL(0, "", SessionData.Get<string>("Newuser"), "", "",0, widamount, 0, lbpv, lbbv, widamount, 0, 0, 0, "", "C");
                        if (b > 0)
                        {
                            danger.Visible = false;
                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = true;
                            info.Visible = false;
                            lbsuccess.Text = "Your Payment Has Been Succesully .! Please Check Out In Invoice List";
                            //string Username = SessionData.Get<string>("newuser");
                            //Response.Redirect("Billview.aspx?username=" + Username);

                            //loadTotal(SessionData.Get<string>("Newuser"));
                            loadaccount(SessionData.Get<string>("Newuser"));
                            txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));
                            SessionData.Put("StatusCSS", "text-success");


                        }
                        else if (b == -1)
                        {


                            danger.Visible = true;

                            lbdanger.Text = "You have already insert Member...!";
                        }
                        else
                        {

                            lbdanger.Text = "Data is not insert successfully";
                            danger.Visible = true;


                        }
                            txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("newuser"));
                            txtcurrentpack.Text = objdashboard.ReturnLastPackName(lbActiveMember.Text);
                            txtcurrentamt.Text = objdashboard.ReturnLastPackAmt(lbActiveMember.Text);
                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = false;
                            info.Visible = false;
                            sccess.Visible = true;
                            lbsuccess.Text = "Congratulations! Your packages " + lbpack.Text + "  has been buy successfully.";

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Successclick(); ", true);
                        }
                        else if (a == -1)
                        {

                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = false;
                            info.Visible = false;
                            info.Visible = true;

                            lbinfo.Text = "You have already buy this  " + lbpack.Text + " ! try another buy a pack!";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "warningclick(); ", true);
                            //  btnaction.Visible = true;
                        }
                        else
                        {
                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = false;
                            info.Visible = false;
                            warning.Visible = true;
                            lbwarning.Text = "Account active Not successfully";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "dangerlick(); ", true);
                            // btnaction.Visible = true;
                        }

                    }
                    else
                    {


                        warning.Visible = false;
                        danger.Visible = false;
                        sccess.Visible = false;
                        info.Visible = false;
                        warning.Visible = true;
                        lbwarning.Text = "Balance is less then to require amount  ";
                        lbfund.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "fundlick(); ", true);
                        // btnaction.Visible = true;
                    }
                    //}
                    //else
                    //{
                    //    warning.Visible = false;
                    //    danger.Visible = false;
                    //    sccess.Visible = false;
                    //    info.Visible = false;
                    //    info.Visible = true;

                    //    lbinfo.Text = "you can't buy this packages! Please Buy previous packages SequenceWise";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "PrePackBuy(); ", true);
                    //    //  btnaction.Visible = true;
                    //}
                    //}
                    //else
                    //{
                    //    warning.Visible = false;
                    //    danger.Visible = false;
                    //    sccess.Visible = false;
                    //    info.Visible = false;
                    //    lbwarning.Text = "you can't buy this packages! Required 2 Direct For Buy a Packages?";
                    //    warning.Visible = true;
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Direct(); ", true);
                    //    // btnaction.Visible = true;
                    //}
                //}
                //else
                //{
                //    warning.Visible = false;
                //    danger.Visible = false;
                //    sccess.Visible = false;
                //    info.Visible = false;
                //    lbwarning.Text = "you can't buy this packages! Your account already active?";
                //    warning.Visible = true;
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Active(); ", true);
                //    // btnaction.Visible = true;
                //}
            }
            catch (Exception ex)
            {
                warning.Visible = false;
                danger.Visible = false;
                sccess.Visible = false;
                info.Visible = false;
                lbwarning.Text = "Enter valid amount";
                warning.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "dangerlick(); ", true);
                // btnaction.Visible = true;
            }
            

        }
    }
    public void loadaccount(string username)
    {
        try
        {
            string sql = "select * from [tblproductsale] where username='" + username + "' and status='Pending'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {
                //lbdanger.Text = "Opps! NO Data Found";
                //danger.Visible = true;
            }


        }
        catch (Exception ex)
        {

        }


    }
    //public void loadTotal(string username)
    //{
    //    try
    //    {
    //        string sql = "select sum(mrp) as MRP,count(qty) as qty,sum(price) as DP,sum(bv) as BV,sum(discount) as Discount from [tblproductsale] where username='" + username + "' and status='Pending'";
    //        DataTable dt = objcon.ReturnDataTableSql(sql);
    //        if (dt.Rows.Count > 0)
    //        {

    //            lbpv.Text = dt.Rows[0]["qty"].ToString();
    //            Label2.Text = dt.Rows[0]["BV"].ToString();
    //            lbtotalBV.Text = dt.Rows[0]["BV"].ToString();
    //            totaldiscount.Text = dt.Rows[0]["Discount"].ToString();
    //            totaldp.Text = dt.Rows[0]["DP"].ToString();
    //            totalmrp.Text = dt.Rows[0]["MRP"].ToString();
    //            Decimal TotalBV = Convert.ToDecimal(lbtotalBV.Text);
    //            if (TotalBV >= 1 && TotalBV <= 500)
    //            {
    //                lbgrandtotal.Text = totaldp.Text;
    //                lbshipping.Text = "Free";
    //                lbtotalpayout.Text = (Convert.ToDecimal(totaldp.Text) + 0).ToString();
    //            }
    //            else if (TotalBV >= 501 && TotalBV <= 999)
    //            {
    //                lbgrandtotal.Text = totaldp.Text;
    //                lbshipping.Text = "Free";
    //                lbtotalpayout.Text = (Convert.ToDecimal(totaldp.Text) + 0).ToString();
    //            }
    //            else
    //            {
    //                lbshipping.Text = "Free";
    //                lbtotalpayout.Text = Convert.ToDecimal(totaldp.Text).ToString();
    //                lbgrandtotal.Text = totaldp.Text;
    //            }
    //        }
    //        else
    //        {
    //            //lbdanger.Text = "Opps! NO Data Found";
    //            //danger.Visible = true;
    //        }


    //    }
    //    catch (Exception ex)
    //    {

    //    }


    //}

    protected void btnaction_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    btnaction.Visible = false;
        //    decimal widamount = 0, Min = 0, Max = 0;
        //    string date = objtime.returnStringServerMachTime();
        //    string PackType = lbpack.Text;

        //    string Username = SessionData.Get<string>("newuser");
        //    decimal finalamount = Convert.ToDecimal(txtbalance.Text.Trim());

        //    widamount = Convert.ToDecimal(txtAmt.Text);
            
        //    if (finalamount >= widamount && widamount >= 100)
        //    {


        //        int a = objamd.ActiveMember(lbActiveMember.Text.Trim(), widamount, widamount, PackType, Username, "N");
        //        if (a > 0)
        //        {


        //            txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("newuser"));
        //            txtcurrentpack.Text = objdashboard.ReturnLastPackName(lbActiveMember.Text);
        //            txtcurrentamt.Text = objdashboard.ReturnLastPackAmt(lbActiveMember.Text);
        //            warning.Visible = false;
        //            danger.Visible = false;
        //            sccess.Visible = false;
        //            info.Visible = false;
        //            sccess.Visible = true;
        //            lbsuccess.Text = "Congratulations! Your Amount " + txtAmt.Text + "  has been Invest successfully.";

        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Successclick(); ", true);
        //        }
        //        else if (a == -1)
        //        {

        //            warning.Visible = false;
        //            danger.Visible = false;
        //            sccess.Visible = false;
        //            info.Visible = false;
        //            info.Visible = true;

        //            lbinfo.Text = "You have already Invest Amount " + txtAmt.Text + " ! try another buy a pack!";
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "warningclick(); ", true);
        //            btnaction.Visible = true;
        //        }
        //        else
        //        {
        //            warning.Visible = false;
        //            danger.Visible = false;
        //            sccess.Visible = false;
        //            info.Visible = false;
        //            warning.Visible = true;
        //            lbwarning.Text = "Account active Not successfully";
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "dangerlick(); ", true);
        //            btnaction.Visible = true;
        //        }

        //    }
        //    else
        //    {


        //        warning.Visible = false;
        //        danger.Visible = false;
        //        sccess.Visible = false;
        //        info.Visible = false;
        //        warning.Visible = true;
        //        lbwarning.Text = "Balance is less then to require amount or Please Enter Min Amt $100 and Max Amt $10000 ";
        //        lbfund.Visible = true;
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "fundlick(); ", true);
        //        btnaction.Visible = true;
        //    }
        //}
        //catch (Exception ex)
        //{
        //    warning.Visible = false;
        //    danger.Visible = false;
        //    sccess.Visible = false;
        //    info.Visible = false;
        //    lbwarning.Text = "Enter valid amount";
        //    warning.Visible = true;
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "dangerlick(); ", true);
        //    btnaction.Visible = true;
        //}
    }
}