using System.Data;
using TripleITConnection;
using TripleITTransaction;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script;
using System.Xml.Linq;
using System.Collections.Generic;
using System;

public partial class Admin_Account : System.Web.UI.Page
{
    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();
    clsAccount objacc = new clsAccount();
    public static string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        username =Request.QueryString["upline"].ToString()=="0"? SessionData.Get<string>("newuser") : Request.QueryString["upline"].ToString();
        }
    }

    [WebMethod]
    public static string FunTreeView()
    {

        clsList objlist = new clsList();
        DataTable table = objlist.GetTreeView(username);
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }

        return jsSerializer.Serialize(parentRow);

    }




    //protected void btnsearch_Click(object sender, EventArgs e)
    //{
    //    username = txtsearch.Text.Trim();
    //}
}