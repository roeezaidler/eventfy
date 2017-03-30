using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
public partial class ShowMembers : System.Web.UI.Page
{
    static Color c;
    static DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            ShowAllMembers();
        }

    }
    private void ShowAllMembers()
    {
        string SqlShow = "SELECT * FROM Members, Cities WHERE Members.CityId=Cities.CityId";
        ds = new DataSet();
        ds = Connect.GetDataSet(SqlShow, "Members");
        //for (int i = 0; i < ds.Tables["Members"].Rows.Count; i++)
        //{
        //    ds.Tables["Members"].Rows[i]["MemberDate"] = DateTime.Parse((ds.Tables["Members"].Rows[i]["MemberDate"].ToString())).ToShortDateString();
        //}
        GridShowMembers.DataSource = ds;
        GridShowMembers.DataBind();
    }


    protected void GridShowMembers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        c = e.Row.BackColor;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.originColor = this.style.backgroundColor; this.style.backgroundColor='gray'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originColor");


        }
        
        for (int i = 0; i < GridShowMembers.Rows.Count; i++)
        {
            ((System.Web.UI.WebControls.Image)GridShowMembers.Rows[i].Cells[13].FindControl("Image1")).ImageUrl = ds.Tables["Members"].Rows[GridShowMembers.PageIndex * 5 + i]["MemberPicture"].ToString();
            ((ImageButton)GridShowMembers.Rows[i].FindControl("ImageButton1")).ImageUrl = ds.Tables["Members"].Rows[GridShowMembers.PageIndex*5+i]["MemberPicture"].ToString();
            ((ImageButton)GridShowMembers.Rows[i].FindControl("ImageButton1")).Attributes.Add("onmouseover", "this.originImage=this.src;this.src='Images/gif1231.gif'");
            ((ImageButton)GridShowMembers.Rows[i].FindControl("ImageButton1")).Attributes.Add("onmouseout", "this.src =this.originImage");
            
            GridShowMembers.Rows[i].Cells[0].Text = (GridShowMembers.PageIndex*5 + (i + 1)).ToString();
        }
    }



    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        bool flag = false;
        if (((CheckBox)sender).Checked)
            flag = true;
        for (int i = 0; i < GridShowMembers.Rows.Count; i++)
        {
            ((CheckBox)GridShowMembers.Rows[i].Cells[13].FindControl("CheckBox1")).Checked = false;
        }
        if (flag)
            ((CheckBox)sender).Checked = true;
        foreach (GridViewRow row in GridShowMembers.Rows)
        {

            CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
            if (cb != null && cb.Checked)
            {
                row.BackColor = Color.Yellow;
            }
            else
                row.BackColor = c;
        }
    }

    protected void GridShowMembers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridShowMembers.PageIndex = e.NewPageIndex;
        ShowAllMembers();
    }
    protected void ImageButton1_DataBinding(object sender, EventArgs e)
    {
        
    }
}