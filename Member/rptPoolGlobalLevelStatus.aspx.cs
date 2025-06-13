using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using TripleITTransaction;
public partial class User_rptPoolMemberStatus : System.Web.UI.Page
{

    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            LoadData();
            //Repeater1.DataSource = dt;
            //Repeater1.DataBind();
        }


    }

    public void LoadData()
    {
        try
        {
            string username = SessionData.Get<string>("Newuser");
            string sql = "  select p.username,p.levelno,p.tragetmember,p.total,p.poolno,p.totalteam,p.recived,p.entryno,p.istransfer,g.m1,g.m2 from [TblPoolLevel3X] p inner join TblPool3Matrix g on p.gid = g.id WHERE p.Username = '" + username+"'  ";
            if (drplevelno.SelectedValue != "0")
            {
                sql += " and p.levelno='" + drplevelno.SelectedValue + "'";
            }
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
              
            }
            else
            {
                lbdanger.Text = "OOPS! NO DATA FOUND.";
                danger.Visible = true;
            
            }
            grdData.DataSource = dt;
            grdData.DataBind();
             
           

        }
        catch (Exception ex)
        {

        }


    }
    public string remark(object IsType)
    {
        string Status = "";
        if (IsType.ToString() == "True")
        {
            Status = "Completed";
        }

        else
        {
            Status = "Pending";
        }
        return Status;
    }
        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    { 
        grdData.PageIndex = e.NewPageIndex;
        //   this.BindGrid();
        LoadData();
    }


    protected void drplevelno_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }
}

