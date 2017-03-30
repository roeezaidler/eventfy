using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class MainPage2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Color c = Button1.BackColor;
        Button2.BackColor = c;
        Button2.Text = c.Name;
    }
}