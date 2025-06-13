using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITTransaction;
using TripleITConnection;
public partial class User_purchasehistory : System.Web.UI.Page
{
    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();  
    public List<clsuser> objuserlist = new List<clsuser>();   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { loaddirect(); }
       
    }
    public void loaddirect()
    {
        try
        {
            string username = SessionData.Get<string>("newuser");
              string sql = "";
           

            sql = " select 	 *,datediff(day,dor,getdate()) as Stackday,islive from TblRetopup where username='" + username+"'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
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
        if (IsType.ToString() == "False")
        {
            Status = "Continue";
        }
        
        else
        {
            Status = "Withdraw";
        }
        return Status;

    }
    protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdData.PageIndex = e.NewPageIndex;

        loaddirect();
    }

}

